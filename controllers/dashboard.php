<?php
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../includes/functions.php';
require_once __DIR__ . '/../models/getAllTasks.php';
require_once __DIR__ . '/../models/user.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Sécurité : verifie le rôle sinon redirige
if (!isset($_SESSION['user_role']) || $_SESSION['user_role'] !== 'Responsable') {
    redirect('index.php?page=login');
}

$tasks = getAllTasks($pdo);
$users = getAllUsers($pdo);
// Afficher la VUE admin
require_once __DIR__ . '/../views/admin.php';
