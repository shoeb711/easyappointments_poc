<?php defined('BASEPATH') or exit('No direct script access allowed');

$config['useragent'] = 'Easy!Appointments';
$config['protocol'] = 'smtp';
$config['mailtype'] = 'html';

$config['smtp_host'] = 'smtp.gmail.com';
$config['smtp_auth'] = TRUE;
$config['smtp_user'] = 'shaikhshoeb711@gmail.com';
$config['smtp_pass'] = 'davzxrxzctyznkag'; // Use your Gmail **App Password** here
$config['smtp_crypto'] = 'tls';
$config['smtp_port'] = 587;

$config['from_name'] = 'Virtual Visit Admin';
$config['from_address'] = 'shaikhshoeb711@gmail.com'; // same as smtp_user
$config['reply_to'] = 'shaikhshoeb711@gmail.com'; // optional, can be different

$config['crlf'] = "\r\n";
$config['newline'] = "\r\n";
