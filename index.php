<?php
require "vendor/autoload.php";

$account = (new \InstagramScraper\Instagram)->getMediaLikes('BzKrxXUiz67', 50);

echo "<pre>";
var_dump($account);
echo "</pre>";
