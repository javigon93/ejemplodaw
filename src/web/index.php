<!DOCTYPE html>
<html>

<head>
    <title>Javier González</title>
    <meta charset="UTF-8">
    <link rel='stylesheet' type='text/css' media='screen' href='./css/main.css'>
</head>
<body>
    

<?php

try {
    require __DIR__ . '/vendor/autoload.php';

    //librería para poder leer archivos.env
    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
    $dotenv->load();

    try {
        $pdo = new \PDO(
            $_ENV['DB_CONNECTION'] . ":host=" .
                $_ENV['DB_HOST'] . ";port=" . $_ENV['DB_PORT'] . ";dbname=" . $_ENV['DB_DATABASE'],
            $_ENV['DB_USERNAME'],
            $_ENV['DB_PASSWORD']
        );
        $pdo->exec("set names utf8");
        $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        echo "HOLA" . $e->getMessage();
        exit();
    }

    $sql = "SELECT * FROM info ";

    $params = [
        ":id" => 2
    ];

    $ps = $pdo->prepare($sql);
    $ps->execute($params);
    $result = $ps->columnCount() > 0 ? $ps->fetchAll(\PDO::FETCH_ASSOC) : $ps->rowCount();

    echo '<h1 class="c-titulo">Resultado de la base de datos "' . $_ENV['DB_DATABASE'] . '"</h1>';
    echo '<p class="c-texto" >Nombre: ' . $result[0]['nombre'] . '</p>';
    echo '<p class="c-texto">Apellido: ' . $result[0]['apellido'] . '</p>';
    echo '<p class="c-texto">Edad: ' . $result[0]['edad'] . '</p>';
} catch (Exception $e) {

    echo $e->getMessage();
}

?>
</body>