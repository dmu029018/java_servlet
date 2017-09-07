<%@page import="model.enums.Country"%>
<%@page import="java.util.ArrayList"%>
<%@page import="config.Config"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Country> countryList = Country.findAll();
%>


<!DOCTYPE html>
<html lang="<%=Config.LANGUAGE%>">
    <head>
        <title>Título de la página</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--JQuery-->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" type="text/css" href="/java_servlet/assets/css/base-layout.css"/>
        
    </head>
    <body>

        <nav class="navbar navbar-default navigation-color">

            <div class="container">
                <div class="navbar-header navbar-left">
                    <a class="navbar-brand" href="index.jsp">My website</a>
                </div>
                <form action="Login" method="POST" class="navbar-form navbar-right">
                    <!--<div class="form-group">
                        <h4>Login</h4>
                    </div>-->
                    <div class="form-group">
                        <label class="text-info">Email</label>
                        <input type="email" class="form-control" name="email" placeholder="Log in with your email" required>
                    </div>
                    <div class="form-group">
                        <label class="text-info">Password</label>
                        <input type="password" class="form-control" name="password" placeholder="Insert your password" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="login" value="Login" class="btn btn-success">
                    </div>
                </form>
            </div>
        </nav>

        <% if (request.getAttribute("notification-error") != null) {%>
        <div class="alert alert-danger text-center" role="alert"><%= request.getAttribute("notification-error")%></div>
        <%}%>

        <% if (request.getAttribute("notification-success") != null) {%>
        <div class="alert alert-success text-center" role="alert"><%= request.getAttribute("notification-success")%></div>
        <%}%>


        <div class="container">
            <section>
                <div class="row">
                    <div class="col-md-8">
                        <div class="jumbotron text-center">
                            <h1>Haz tu propio CV fácilmente</h1>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                            </p>

                        </div>
                    </div>
                    <div class="col-md-4">
                        <h2>No tienes cuenta? Regístrate</h2>
                        <form action="Register" method="POST">
                            <div class="form-group">
                                <label class="control-label">Email</label>
                                <input type="email" class="form-control"  name="email"  placeholder="email" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Password</label>
                                <input type="password" class="form-control" name="password"  placeholder="password" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Nombre</label>
                                <input class="form-control" name="name"  placeholder="nombre" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Apellidos</label>
                                <input class="form-control" name="lastname"  placeholder="apellidos" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Género</label>
                                <div class="radio-group">
                                    <label class="radio-inline"><input type="radio" name="gender" value="1" checked="true">Hombre</label>
                                    <label class="radio-inline"><input type="radio" name="gender" value="2">Mujer</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Fecha de nacimiento</label>
                                <input class="form-control" type="date" name="birthdate" placeholder="Fecha de nacimiento" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label">País</label>
                                <select class="form-control" name="country">
                                    <%for(Country c : countryList){%>
                                        <option value="<%=c.getId()%>"><%=c.getName()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Ciudad</label>
                                <input class="form-control" name="city"  placeholder="Ciudad" required>
                            </div>
                            <div class="button-group">    
                                <input type="submit" name="register" value="Register" class="btn btn-success">
                            </div>
                        </form>
                    </div>

                </div>

                <div class="row">
                    <h2 class="text-center">¡Disfruta de nuestros servicios!</h2>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="well text-center">
                            <h3>Toda tu información en un único punto</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="well text-center">
                            <h3>Plantillas personalizables para tu puesto ideal</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="well text-center">
                            <h3>¡Gestionar tus perfiles nunca fue tan fácil!</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script>
            $(function(){
                
                var fadeOutAlert = function(){
                    $(".alert").fadeOut();
                };
                
                $(document).on("click", ".alert", fadeOutAlert);
                setInterval(fadeOutAlert, 10000);
                
            });
        </script>
    </body>
</html>