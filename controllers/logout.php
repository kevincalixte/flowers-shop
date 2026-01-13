<?php

require_once __DIR__ . '/../includes/functions.php';

//Supprime la session et redirige vers login
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

session_destroy();
redirect("../index.php?page=login");