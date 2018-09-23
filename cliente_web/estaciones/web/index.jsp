<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>..::CEPRA-X-2016::..</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="pages/libreriascss.jsp"></jsp:include>
<link rel="stylesheet" href="assets/css/styleslider.css">
</head>
<body>
<jsp:include page="pages/header.jsp"></jsp:include>
    <section id="contentbody">
      <div class="row">          
       
          <div class="row">
            <div class="middle_bar">
              <div class="single_category">
                  <div class="category_title"> <a>Inicio</a></div>
                <div class="single_category_inner">
                    <!-- Contenido principal  -->
                    <!-- inicio de slider  --> 
                      
                       <br/>
                            <div class="wrap-slider">
                            <div id="contenedor-slider" class="contenedor-slider">
                            <div id="slider" class="slider">
                            <section class="slider__section"><img src="images/imagen1.jpg" class="slider__img"></section>
                            <section class="slider__section"><img src="images/imagen2.jpg" class="slider__img"></section>
                            <section class="slider__section"><img src="images/imagen3.jpg" class="slider__img"></section>
                            <section class="slider__section"><img src="images/imagen4.jpg" class="slider__img"></section>
                            </div>
  
                            </div>
                            <div id="btn-prev" class="btn-prev">&#60;</div>
                            <div id="btn-next" class="btn-next">&#62;</div>
                            </div>
                            <script src='assets/js/jquery.min.js'></script>
                            <script src="assets/js/index.js"></script>
                       <!-- fin del slider  -->  
                    <div>
                        <br/>
                       <br/>
                       <br/>
                       
                     <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                         <br/>
                         <br/>
                         <center><img src="images/ema_ceprax.png" height="580" width="390" /></center>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                     
                     
                    <aside>
                    <p style="font-family:pilcrow soft; text-align: justify; font-size: 25px">
                            INTRODUCCIÓN 
                        </p>
                        <p style="font-family:pilcrow soft; text-align: justify; font-size: 20px">
                            La investigación y desarrollo son ejes fundamentales de las instituciones de educación superior; la Escuela Superior Politécnica de Chimborazo, Universidad Nacional de Chimborazo, Universidad de Cuenca y REDCEDIA (Red Nacional de Investigación y Educación del Ecuador) establecen lasos de cooperación para desarrollar una plataforma de Geoportal para el acceso e interpolación  de precipitación y temperatura mediante herramientas geoestadísticas para las provincias de Azuay y Chimborazo. 
                        </p>
                        <p style="font-family:pilcrow soft; text-align: justify; font-size: 20px">
                            El Geoportal de código abierto está sujeto a mejoras y actualizaciones permanentes de acuerdo a las sugerencias de los investigadores en el transcurso del tiempo según características estratégicas requeridas. 
                        </p>
                        <p style="font-family:pilcrow soft; text-align: justify; font-size: 20px">Según la disponibilidad y apertura por parte de entidades públicas y privadas, se puede aumentar las potencialidades del Geoportal de información meteorológica, pudiendo provenir de estaciones meteorológicas automáticas y manuales ya existentes.
Si existieran vacíos de información por fallos de transmisión de datos desde las estaciones, o por otro tipo de daños, se podrá obtener una estimación estadística del dato faltante a partir de datos históricos, con un porcentaje de error mínimo al momento de interpolar la información.  
</p>
<p style="font-family:pilcrow soft; text-align: justify; font-size: 20px">Cabe señalar que este proyecto de investigación y desarrollo es de carácter multidisciplinario tales como: Sistemas de Información Geográfica Estadística, meteorología, informática, ciencias ambientales, electrónica</p>
                    </aside>
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
    $(document).ready(function (){
        $("#home").addClass('active');
    });
</script>
</body>
</html>