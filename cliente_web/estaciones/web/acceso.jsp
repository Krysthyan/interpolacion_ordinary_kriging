<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>..::CEPRA-X-2016 - Acceso::..</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="pages/libreriascss.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="assets/css/login.css">
</head>
<body>
<jsp:include page="pages/header.jsp"></jsp:include>
    <section id="contentbody">
      <div class="row">          
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="row">
            <div class="middle_bar">
              <div class="single_category">
                  <!--<div class="category_title"> <a href="acceso.jsp">Acceso</a></div> -->
                <div class="single_category_inner">
                    <!-- Contenido principal  -->
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                        <div class="panel panel-primary">
                            <div class="panel-heading"><a>Acceso al sistema</a></div>
                            <div class="panel-body">
                            <form >
                            <!--<h2 class="form-signin-heading"></h2> -->
                                <input type="text" class="form-control" placeholder="Usuario" autofocus>
                                <br>
                                <input type="password" class="form-control" placeholder="Password">
                                <br>
                                <button class="btn btn-lg btn-primary btn-block" type="submit"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp;Login</button>
                            </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
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
        $('#login').addClass('active');
});
</script>
</body>
</html>

