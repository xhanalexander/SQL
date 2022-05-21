<?php

// using mySQLi_connect() for database function

$DB_HOST = 'localhost';
$DB_USER = 'root';
$DB_PASS = '';
$DB_NAME = 'crudeDB';

$mysqli = mysqli_connect($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);
if (!$mysqli) {
   die("Connection failed: " . mysqli_connect_error());
}

echo "Connected successfully";
mysqli_close($mysqli);


?>
