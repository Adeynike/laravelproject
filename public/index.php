<?php

use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

// Determine if the application is in maintenance mode...
if (file_exists($maintenance = __DIR__.'/../storage/framework/maintenance.php')) {
    require $maintenance;
}

// Register the Composer autoloader...
require __DIR__.'/../vendor/autoload.php';

// Bootstrap Laravel and handle the request...
$app = require_once __DIR__.'/../bootstrap/app.php';

// Check if $app is an instance of the Laravel application
if ($app instanceof \Illuminate\Contracts\Foundation\Application) {
    // If it is, handle the request
    $app->handleRequest(Request::capture());
} else {
    // Otherwise, print an error message
    echo "Error: Bootstrap file did not return an instance of the Laravel application.";
    // You might want to log this error instead of printing it out
}
