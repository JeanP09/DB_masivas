<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Base de Datos Municipios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
    <div class="p-4 table-responsive">
        <div class="text-center"><a href="../index.php" class="btn btn-danger btn-circle">Regresar</a></div><br>
        <h4 class="text-center">Tablas de DB_municipios.sql</h4>
        <br>
        <table class="table table-bordered">
            <thead class="bg-info text-center">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Región</th>
                    <th scope="col">Código DANE Departamento</th>
                    <th scope="col">Departamento</th>
                    <th scope="col">Código DANE Municipio</th>
                    <th scope="col">Municipio</th>
                </tr>
            </thead>

            <tbody>
                <?php
                include "../model/conexion_db_municipios.php";

                $sql = $conexion->query("
                    SELECT r.idregion, r.nombre_region, 
                        d.codigo_dane_departamento, d.nombre_departamento, 
                        m.codigo_dane_municipio, m.nombre_municipio
                    FROM region r
                    LEFT JOIN departamento d ON r.idregion = d.region_idregion
                    LEFT JOIN municipio m ON d.codigo_dane_departamento = m.departamento_codigo_dane_departamento
                ");

                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->idregion ?></td>
                        <td><?= $datos->nombre_region ?></td>
                        <td><?= $datos->codigo_dane_departamento ?></td>
                        <td><?= $datos->nombre_departamento ?></td>
                        <td><?= $datos->codigo_dane_municipio ?></td>
                        <td><?= $datos->nombre_municipio ?></td>
                    </tr>
                <?php } ?>
            </tbody>


            </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>