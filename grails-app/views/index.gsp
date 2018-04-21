<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Inicio</title>
    <link type="text / css " href= "styles.css" rel="stylesheet">
    <link href="/stylesheets/styles.css" rel="stylesheet" type="text/css">
</head>

<body>
<sec:ifNotLoggedIn>
    <h1>¡Hola mundo!</h1>
</sec:ifNotLoggedIn>
<sec:ifAnyGranted roles="ROLE_ADMIN">
    <h1>¡Eres administrador!</h1>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_USER">
    <h1>¡Eres usuario!</h1>
</sec:ifAnyGranted>
</body>
</html>

