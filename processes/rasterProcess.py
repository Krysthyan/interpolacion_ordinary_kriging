from pywps import Process, LiteralInput, LiteralOutput, LiteralOutput, Format, ComplexOutput, FORMATS
import threading
import os

from processes.processingDB import createShapeFile, generate_raster


class RasterProcess(Process):

    def __init__(self):
        inputs = [LiteralInput('province', 'provincia ', data_type='string'),
                  LiteralInput('type', 'tipo de datos pres/tem', data_type='string'),
                  LiteralInput('date', 'fecha a buscar', data_type='string'),
                  LiteralInput('hour', 'hora a buscar', data_type='string')
                  ]

        outputs = [LiteralOutput('response',
                                 'Respuesta del servidor', data_type='string')]

        super(RasterProcess, self).__init__(
            self._handler,
            identifier='interpolacion_segundoPlano',
            title='Proceso para crear el raster',
            abstract='Crea el raster pero este no devuelve el resultado sino que se queda ejecutando en el servidor, para despues consultar el resultado',
            version='1.0.0',
            inputs=inputs,
            outputs=outputs
        )
        dirName = ''

    def _handler(self, request, response):
        type = request.inputs['type'][0].data.replace('(', '').replace(')', '').replace(' ', '_')

        self.dirName = request.inputs['province'][0].data + "_" + \
                  type + "_" + \
                  request.inputs['date'][0].data + "_" \
                  + request.inputs['hour'][0].data

        try:
            # Create target Directory
            os.mkdir('./outputs/' + self.dirName)
            threading.Thread(target=process, args=(request,)).start()
            response.outputs[
                'response'].data = 'La creación del raster esta en proceso, esto puede durar unos 5 minutos'
        except FileExistsError:
            for dirpath, _, file_names in os.walk('./outputs/' + self.dirName):
                if len(file_names) == 1:
                    return_raster = 'outputs/' + self.dirName + '/' + self.dirName + '.tif'

                    response.outputs['response'].output_format = 'image/tiff'
                    response.outputs['response'].data = 'http://localhost:5000/' + return_raster
                    print("Directory ", './outputs/' + self.dirName, " Created ")
                else :
                    threading.Thread(target=process, args=(request,)).start()
                    response.outputs[
                        'response'].data = 'La creación del raster esta en proceso, esto puede durar unos 5 minutos'


        return response


def process(request):
    type = request.inputs['type'][0].data.replace('(', '').replace(')', '').replace(' ', '_')

    print(type)

    dirName = request.inputs['province'][0].data + "_" + \
              type + "_" + \
              request.inputs['date'][0].data + "_" \
              + request.inputs['hour'][0].data

    createShapeFile(dirName, request)
    generate_raster(dirName)
