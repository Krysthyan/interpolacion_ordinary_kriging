<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>..::CEPRA-X-2016::..</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="pages/libreriascss.jsp"></jsp:include>
            <style>
                .loader {
                    border: 16px solid #f3f3f3;
                    border-radius: 50%;
                    border-top: 16px solid #3498db;
                    width: 120px;
                    height: 120px;
                    -webkit-animation: spin 2s linear infinite; /* Safari */
                    animation: spin 2s linear infinite;
                }

                /* Safari */
                @-webkit-keyframes spin {
                    0% { -webkit-transform: rotate(0deg); }
                    100% { -webkit-transform: rotate(360deg); }
                }

                @keyframes spin {
                    0% { transform: rotate(0deg); }
                    100% { transform: rotate(360deg); }
                }
            </style>

            <script type="text/javascript">
                function mostrar1() {
                    province = $("#province").val();
                    date = $("#date").val();
                    hour = $("#hour").val();

                    url = 'http://localhost:5000/wps?request=Execute&service=WPS&identifier=interpolacion&version=1.0.0&DataInputs=province='+province+';date='+date+';type=Precipitación de lluvia (Suma);hour='+hour

                    document.getElementById('spinner').innerHTML = '<div id="endSpinner" class="loader"></div>'

                    $.get(url, function (data, status) {
                        document.getElementById('endSpinner').remove();
                        var patt = /<wps:LiteralData >(.*?)</g;

                        while (match = patt.exec(data)) {


                            str1 = '<a href="'+match[1]+'" class="btn btn-info" role="button">Descargar raster de precipitacion</a>'

                            document.getElementById('raster').innerHTML = str1

                        }
                    }, 'html');


                }
                function mostrar2() {

                    province = $("#province1").val();
                    date = $("#date1").val();
                    hour = $("#hour1").val();

                    url = 'http://localhost:5000/wps?request=Execute&service=WPS&identifier=interpolacion&version=1.0.0&DataInputs=province='+province+';date='+date+';type=Temperatura ambiente (Promedio);hour='+hour

                    document.getElementById('spinner').innerHTML = '<div id="endSpinner" class="loader"></div>'

                    $.get(url, function (data, status) {
                        document.getElementById('endSpinner').remove();
                        var patt = /<wps:LiteralData >(.*?)</g;

                        while (match = patt.exec(data)) {


                            str1 = '<a href="'+match[1]+'" class="btn btn-info" role="button">Descargar raster de temperatura</a>'

                            document.getElementById('raster').innerHTML = str1

                        }
                    }, 'html');
                }
                function ocultar1() {
                    document.getElementById('oculto1').style.display = 'none';
                }
                function ocultar2() {
                    document.getElementById('oculto2').style.display = 'none';
                }
            </script>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
            <style>
                body{
                    background:url("./logo.jpg");
                }
                .opacity{
                    background-color:rgb(255,0,0);
                    opacity:0.7; /* Opacidad 90% */
                    width:200px;
                    height:70px;
                }
                .uno{
                    z-index: 1;
                }
                .dos{
                    z-index: 2;
                }
            </style>


        </head>
        <body>
        <jsp:include page="pages/header.jsp"></jsp:include>
            <section id="contentbody">
                <div class="row container" style="z-index:2" >
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="z-index:3">
                        <div class="row"style="z-index:4">
                            <div class="middle_bar" style="z-index:5">
                                <div class="single_category" style="z-index:6">
                                    <div style="z-index:7" class="category_title"><a>Mapas</a>
                                        <input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" value="Interpolar Precipitación">

                                        <div class="modal fade" id="myModal" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Interpolar Precipitación</h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <div class="form-group">
                                                            <label for="sel1">Seleccionar la provincia a ser evaluada:</label>
                                                            <select class="form-control" id="province">
                                                                <option>Azuay</option>
                                                                <option>Chimborazo</option>

                                                            </select>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="usr">Fecha:</label>
                                                            <input type="text" placeholder="2017-01-29" class="form-control" id="date">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="pwd">Hora:</label>
                                                            <input type="text" placeholder="12:00:00" class="form-control" id="hour">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-primary" data-dismiss="modal" onClick="mostrar1()">Generar raster</button>
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>





                                        <input type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2" value="Interpolar Temperatura">

                                        <div class="modal fade" id="myModal2" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Interpolar Precipitación</h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <div class="form-group">
                                                            <label for="sel1">Seleccionar la provincia a ser evaluada:</label>
                                                            <select class="form-control" id="province1">
                                                                <option>Azuay</option>
                                                                <option>Chimborazo</option>

                                                            </select>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="usr">Fecha:</label>
                                                            <input type="text" placeholder="2017-01-29" class="form-control" id="date1">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="pwd">Hora:</label>
                                                            <input type="text" placeholder="12:00:00" class="form-control" id="hour1">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-primary" data-dismiss="modal" onClick="mostrar2()">Generar raster</button>
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div id='raster'></div>
                                        <div id="spinner"></div>

                                    </div>
                                    <div  class="single_category_inner" style="position: relative; z-index:8">
                                        <!-- Contenido principal  -->
                                        <!--iframe frameborder="0" scrolling=auto width="100%" height="700" framespacing="0" border="0"
                                                src="http://201.159.222.53/visormapas/"
                                                ></iframe-->

                                        <iframe frameborder="0" scrolling=auto width="100%" height="700" framespacing="0" border="0"
                                                src="http://201.159.222.53/visor/"
                                                >
                                        </iframe>



                                        <div id='oculto1'  class="opacity">
                                        </div>

                                        <div id='oculto2' style=" display:none; position: absolute; width: 310px; height: 500px; top: 100px; left: 620px" class="opacity" >
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        <jsp:include page="pages/footer.jsp"></jsp:include>
        <jsp:include page="pages/libreriasjs.jsp"></jsp:include>
        <script>
            $(document).ready(function () {
                $('#map').addClass('active');
            });
        </script>
    </body>
</html>
