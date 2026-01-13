// dashboard employés sur lequel ils pourront consulter et valider les tâches

<?php

session_start();

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../models/getTasksByUser.php';

$userId = $_SESSION['user_id'];
$tasks = getTasksByUser($pdo, $userId);
?>