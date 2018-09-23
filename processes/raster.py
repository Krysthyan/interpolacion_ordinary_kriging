
from pywps import Process, LiteralInput, LiteralOutput

import os
from processes.processingDB import createShapeFile, generate_raster


class Raster(Process):

    def __init__(self):
        inputs = [LiteralInput('province', 'provincia ', data_type='string'),
                  LiteralInput('type', 'tipo de datos pres/tem', data_type='string'),
                  LiteralInput('date', 'fecha a buscar', data_type='string'),
                  LiteralInput('hour', 'hora a buscar', data_type='string')
                  ]

        outputs = [LiteralOutput('response', 'Buffered', data_type='string')]

        super(Raster, self).__init__(
            self._handler,
            identifier='interpolacion',
            title='creación del raster',
            abstract='Este proceso crea el raster y se queda en espera de respuesta para devolver el resultado',
            version='1.0.0',
            inputs=inputs,
            outputs=outputs,
            store_supported=True,
            status_supported=True
        )
        dirName = ''

    def _handler(self, request, response):

        type = request.inputs['type'][0].data.replace('(', '').replace(')', '').replace(' ', '_')

        print(type)

        self.dirName = request.inputs['province'][0].data + "_" + \
                       type + "_" + \
                       request.inputs['date'][0].data + "_" \
                       + request.inputs['hour'][0].data

        createShapeFile(self.dirName, request)

        try:
            # Create target Directory
            os.mkdir('./outputs/' + self.dirName)
            return_raster, _ = generate_raster(self.dirName)
            print("Directory ", './outputs/' + self.dirName, " Created ")
        except FileExistsError:
            for dirpath, _, file_names in os.walk('./outputs/' + self.dirName):
                if len(file_names) != 1:
                    return_raster, _ = generate_raster(self.dirName)
            return_raster = 'outputs/' + self.dirName + '/' + self.dirName + '.tif'
            print("Directory ", './outputs/' + self.dirName, " already exists")

        response.outputs['response'].output_format = 'image/tiff'
        response.outputs['response'].data = 'http://localhost:5000/' + return_raster
        print(self.uuid)

        return response


