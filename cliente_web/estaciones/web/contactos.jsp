<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>..::CEPRA-X-2016 - Contactos::..</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="pages/libreriascss.jsp"></jsp:include>
</head>
<body>
<jsp:include page="pages/header.jsp"></jsp:include>
    <section id="contentbody">
      <div class="row">          
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="row">
            <div class="middle_bar">
              <div class="single_category">
                  <div class="category_title"><a>Contactos</a></div>
                <div class="single_category_inner">
                    <!-- Contenido principal  -->
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        <h3 style="font-family:pilcrow soft; ">INVESTIGADORES: <br></h3>
                        <table class="table table-condensed" style="font-family:pilcrow soft; ">
                        <thead>
                            <tr>
                                <th>CARGO QUE DESEMPEÑA  </th>
                                <th>NOMBRE </th>
                                <th>CORREO </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="active">
                                <td>Director del proyecto</td>
                                <td> Dr. Jose Muñoz phd </td>
                                <td> dm17850@yahoo.es </td>
                            </tr>
                            <tr class="danger">
                                <td>Investigador de la Unach</td>
                                <td>Dra. Silvia Salazar</td>
                                <td>sil_alex@hotmail.es</td>
                             </tr>
                             <tr class="info">
                                <td>Investigador de la Universidad de Cuenca</td>
                                <td>Biologo Danilo Mejía</td>
                                <td>danilo.mejia@ucuenca.edu.ec</td>
                             </tr>
                         </tbody>
                    </table>                     
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        <h3 style="font-family:pilcrow soft; ">AGRADECIMIENTOS A: <br></h3>
                    <table class="table table-condensed" style="font-family:pilcrow soft; ">
                        <thead>
                            <tr>
                                <th>NOMBRE </th>
                                <th>CORREO </th>
                                <th>INSTITUCIÓN </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="active">
                                <td>Dr. Celso Recalde</td>
                                <td> crecalde672000@yahoo.com </td>
                                <td>Espoch</td>
                            </tr>
                            <tr class="success">
                                <td>Biof. Mario Perez</td>
                                <td>map_1090@hotmail.com</td>
                                <td>Espoch</td>
                             </tr>
                             <tr class="danger">
                                <td>Ing. Carina Yaucán</td>
                                <td>carina_yaucan@hotmail.es</td>
                                <td>Espoch</td>
                            </tr>
                             <tr class="warning">
                                <td>Sr. Luis Mullo</td>
                                <td>luis_mulloch@yahoo.com</td>
                                <td>Espoch</td>
                            </tr>
                            <tr class="success">
                                <td>Ing. Janeth Urquizo</td>
                                <td>janndys@hotmail.com</td>
                                <td>Espoch</td>
                            </tr>
                            <tr class="active">
                                <td>Ing. Juan Carlos Moyota</td>
                                <td>juankamoyota21@hotmail.com</td>
                                <td>Unach</td>
                            </tr>
                             <tr class="danger">
                                <td>Ing.Alejandra VIllacres </td>
                                <td>alejandra_villacres@yahoo.com</td>
                                <td>Unach</td>
                            </tr>
                            <tr class="info">
                                <td>Ing.Cristian Jiménez </td>
                                <td>cjimenezg_05@yahoo.es</td>
                                <td>Unach</td>
                            </tr>
                            <tr class="danger">
                                <td>Ing.Lorena Abad </td>
                                <td>lore.abad6@gmail.com</td>
                                <td>UCuenca</td>
                            </tr>
                            <tr class="warning">
                                <td>Ing.Edison Patiño </td>
                                <td>edison.patinoz@ucuenca.ec</td>
                                <td>UCuenca</td>
                            </tr>
                        </tbody>
                    </table>
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
        $("#contact").addClass('active');
    });
</script>
</body>
</html>