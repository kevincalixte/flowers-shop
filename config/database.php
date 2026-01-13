<?php
// Connexion à la base de donnée
$dbhost = "localhost";
$dbname = "flowers_shop";
$dbuser = "root";
$dbpass = "1234";
$dbcharset = "utf8mb4";

try {
    $dsn = "mysql:host=$dbhost;dbname=$dbname;charset=$dbcharset";
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ];
    $pdo = new PDO($dsn, $dbuser, $dbpass, $options);
} catch (PDOException $e) {
    die("Erreur de connexion à la base de donnée : " . $e->getMessage());
}
