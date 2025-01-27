<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bdveterinaria";
$port = 3307; // Puerto personalizado

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

?>
