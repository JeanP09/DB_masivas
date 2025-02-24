<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Base de Datos Masivas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .btn-circle {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <h1 class="p-3">Escoger una Base de Datos</h1>

    <div class="d-flex gap-4">
        <a href="./views/db_jumbo.php" class="btn btn-primary btn-circle">Jumbo</a>
        <a href="./views/db_municipios.php" class="btn btn-success btn-circle">Municipios</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>