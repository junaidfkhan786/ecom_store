<?php

session_start();

include("includes/db.php");

include("functions/functions.php");

?>

<?php


$ip_add = getRealUserIp();

if(isset($_POST['id'])){

$id = $_POST['id'];

$qty = $_POST['quantity'];

$shipping_type = $_POST["shipping_type"];

$shipping_cost = $_POST["shipping_cost"];

$_SESSION["shipping_type"] = $shipping_type;

$_SESSION["shipping_cost"] = $shipping_cost;

$change_qty = "update cart set qty='$qty' where p_id='$id' AND ip_add='$ip_add'";

$run_qty = mysqli_query($con,$change_qty);

if($run_qty){

echo total_price();
	
	
}

}





?>