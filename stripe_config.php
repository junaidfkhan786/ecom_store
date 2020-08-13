<?php

require_once('vendor/autoload.php');

$stripe = array(
  "secret_key"      => "sk_test_RtRMOCdX6IIK2f9Q94CilE5k",
  "publishable_key" => "pk_test_NcOLIMZPgVJid1099xnjs1Ka"
);

\Stripe\Stripe::setApiKey($stripe['secret_key']);


?>