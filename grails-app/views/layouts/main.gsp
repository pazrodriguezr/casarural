<!doctype html>
<html lang="es" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <asset:javascript src="application"/>
    <asset:stylesheet src="application"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    %{--<link rel="icon" href="../../favicon.ico">--}%

    <title>Casa Rural</title>

    <g:layoutHead/>
</head>

<body role="presentation">
<div id="wrap">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">∫
        <asset:image src="casarural/logo.png" style="display: inline-block;" width="50px"
                     height="50px"/>
    </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <g:link class="nav-link" action="index">Inicio <span class="sr-only">(current)</span></g:link>
                </li>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownCategoria" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                            Categorías
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownCategoria">
                            <a class="dropdown-item" href="${createLink(controller: 'categoria', action: 'index')}">Mostrar categorías</a>
                            <a class="dropdown-item" href="${createLink(controller: 'categoria', action: 'create')}">Nueva categoría</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownHabitacion" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                            Habitaciones
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownHabitacion">
                            <a class="dropdown-item" href="${createLink(controller: 'habitacion', action: 'index')}">Mostrar habitaciones</a>
                            <a class="dropdown-item" href="${createLink(controller: 'habitacion', action: 'create')}">Nueva habitación</a>
                        </div>
                    </li>
                </sec:ifAnyGranted>
                <sec:ifLoggedIn>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownReserva" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                            Reservas
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownReserva">
                            <sec:ifAnyGranted roles="ROLE_ADMIN">
                                <a class="dropdown-item" href="${createLink(controller: 'habitacion', action: 'index')}">Mostrar reservas</a>
                            </sec:ifAnyGranted>
                            <a class="dropdown-item" href="${createLink(controller: 'habitacion', action: 'create')}">Nueva reserva</a>
                        </div>
                    </li>
                </sec:ifLoggedIn>
                <li class="nav-item dropdown show">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMas" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                        Más
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMas">
                        <a class="dropdown-item" href="#">Mapa</a>
                        <a class="dropdown-item" href="#">Servicios</a>
                    </div>
                </li>
                %{--<form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>--}%
            </ul>
        </div>
    </nav>
</div>

<div class="container theme" role="main">
    <g:layoutBody/>
    %{--<asset:javascript src="application"/>--}%
</div>
</div>
<!--Footer-->
<footer class="card-footer fixed-bottom">
    <div class="container-fluid">
        <span>
            <nobr>
                <div id='loginLinkContainer' class="centered">
                    <sec:ifLoggedIn>
                        Logged in as <sec:username/> (<g:link controller='logout'>Logout</g:link>)
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <g:link controller='login'>Login</g:link>
                    </sec:ifNotLoggedIn>

                    <sec:ifSwitched>
                        <a href='${request.contextPath}/j_spring_security_exit_user'>
                            Resume as <sec:switchedUserOriginalUsername/>
                        </a>
                    </sec:ifSwitched>
                </div>
            </nobr>
        </span>
    </div>

    <!--Copyright-->
    <div class="footer-copyright">
        <div class="container-fluid text-center">
            © 2018 Copyright: <a href="https://www.rural.com">Rural.com</a>

        </div>
    </div>
    <!--/.Copyright-->

</footer>
<!--/.Footer-->

<div id="spinner" class="spinner" style="display:none;">
    %{--<g:message code="spinner.alt" default="Loading&hellip;"/>--}%
    <span class="fa fa-spinner" style="font-size:48px;"/>
</div>

</body>
</html>