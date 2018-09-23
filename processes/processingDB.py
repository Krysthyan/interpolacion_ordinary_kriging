import fiona
from shapely.geometry import Point, mapping
from fiona.crs import from_epsg
import os


def generate_raster(dirName):
    import processing
    from processing.core.Processing import Processing
    Processing.initialize()

    dir_raster = 'outputs/' + dirName + '/' + dirName + '.tif'

    print('./data/shapes/' + dirName + '/estaciones.shp')
    processing.run("saga:ordinarykriging",
                   {'POINTS': './data/shapes/' + dirName + '/estaciones.shp', 'FIELD': 'Prec_acc',
                    'TQUALITY': 1,
                    'LOG': True, 'BLOCK': False, 'DBLOCK': 100, 'VAR_MAXDIST': -1, 'VAR_NCLASSES': 102,
                    'VAR_NSKIP': 1, 'VAR_MODEL': 'a + b * x',
                    'TARGET_USER_XMIN TARGET_USER_XMAX TARGET_USER_YMIN TARGET_USER_YMAX': '637401.5747013092,794208.375,9598531.606599808,9842183.0 [EPSG:32717]',
                    'TARGET_USER_SIZE': 30, 'TARGET_USER_FITS': 1,
                    'PREDICTION': './data/shapes/' + dirName + '/processing/r1.sdat',
                    'VARIANCE': './data/shapes/' + dirName + '/processing/r2.sdat', 'SEARCH_RANGE': 1,
                    'SEARCH_RADIUS': 1103,
                    'SEARCH_POINTS_ALL': 1, 'SEARCH_POINTS_MIN': 4, 'SEARCH_POINTS_MAX': 20, 'SEARCH_DIRECTION': 1})

    processing.run("gdal:cliprasterbymasklayer",
                   {'INPUT': './data/shapes/' + dirName + '/processing/r2.sdat',
                    'MASK': './data/shapes/Unido.shp', 'NODATA': None,
                    'ALPHA_BAND': False, 'CROP_TO_CUTLINE': True, 'KEEP_RESOLUTION': False, 'OPTIONS': '',
                    'DATA_TYPE': 5, 'OUTPUT': dir_raster})

    return dir_raster, dirName


def getDatDB(request):
    import psycopg2

    conn = psycopg2.connect("dbname='pywps' host='localhost' user='pywps' password=pywps")
    cur = conn.cursor()
    sql = """select D.esta_nombre as Nombre, 
                D.esta_latitud as latitud, 
                D.esta_longitud as longitud, 
                C.datotratservm1_valor as Prec_acc 
                from administracion.variableservidor as A 
                join administracion.sens_variserv as B on B.variserv_id = A.variserv_id 
                join datosservidor.datotratadoservidorm1 as C on C.variserv_id = B.variserv_id 
                    and C.sens_id = B.sens_id 
                    join administracion.estacion as D on D.esta_id = C.esta_id 
                    join administracion.parroquia as E on E.parr_id = D.parr_id 
                    join administracion.canton as F on F.cant_id = E.cant_id 
                    join administracion.provincia as G on G.prov_id = F.prov_id 
                    where upper(G.prov_nombre) like upper('""" + request.inputs['province'][0].data + """') 
                    and upper(A.variserv_nombre) like upper('""" + request.inputs['type'][0].data + """') 
                    and C.datotratservm1_fecha = '""" + request.inputs['date'][0].data + """' 
                    and C.datotratservm1_hora = '""" + request.inputs['hour'][0].data + """'"""
    cur.execute(sql)

    return cur.fetchall()


def createShapeFile(dirName, request):
    try:
        os.mkdir('./data/shapes/' + dirName)
        os.mkdir('./data/shapes/' + dirName + '/processing/')
        create_fileshape_fiona(dirName, request)
        return True

    except FileExistsError:
        for dirpath, _, file_names in os.walk('./data/shapes/' + dirName):
            if len(file_names) < 4:
                create_fileshape_fiona(dirName, request)


def create_fileshape_fiona(dirName, request):
    import utm
    schema = {
        'geometry': 'Point',
        'properties': {
            'F1': 'str:5',
            'Nombre': 'str:100',
            'latitud': 'float:13.6',
            'longitud': 'float:13.6',
            'Prec_acc': 'float:13.6'}}

    datadb = getDatDB(request)

    with fiona.open('./data/shapes/' + dirName + '/estaciones.shp', 'w', crs=from_epsg(32717),
                    driver='ESRI Shapefile',
                    schema=schema) as output:
        for row in datadb:
            u = utm.from_latlon(row[1], row[2])
            point = Point(u[0], u[1])
            prop = {'F1': 'M0141', 'Nombre': row[0], 'latitud': row[1], 'longitud': row[2],
                    'Prec_acc': row[3]}
            output.write({'geometry': mapping(point), 'properties': prop})

    output.close()
