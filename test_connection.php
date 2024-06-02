<?php
require_once 'connection.php';

try {
    $db = new Connection();
    echo "Connected to the database successfully!";
} catch (Exception $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>
