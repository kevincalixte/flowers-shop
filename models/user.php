// fonctions liées aux users (GET employe by ID)

<?php

require_once "../config/database.php";

// Récupère tout les utilisateurs
function getAllUsers($pdo)
{
    $stmt = $pdo->prepare("SELECT * FROM users");
    $stmt->execute();
    $data = $stmt->fetchAll();
    return $data;
}

// Récupère un utilisateur par l'id
function getEmployeById($pdo, $id)
{
    $stmt = $pdo->prepare("SELECT * FROM users WHERE id = ?");
    $stmt->execute([$id]);
    $data = $stmt->fetch();
    return $data;
}

// Optionnel addUser($pdo, $data)
// Optionnel updateUser($pdo, $id, $data)
// Optionnel deleteUser($pdo, $id)