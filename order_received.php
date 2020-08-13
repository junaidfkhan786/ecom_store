<?php

session_start();

include("includes/db.php");

include("functions/functions.php");

if(!isset($_SESSION["customer_email"])){

echo "<script> window.open('checkout.php','_self'); </script>";
	
}

if(!isset($_GET["order_id"])){

echo "<script> window.open('checkout.php','_self'); </script>";
	
}

?>
<!DOCTYPE html>
<html>

<head>
<title>E commerce Store </title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" >

<link href="http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100" rel="stylesheet" >

<link href="styles/bootstrap.min.css" rel="stylesheet">

<link href="styles/style.css" rel="stylesheet">

<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">

<script src="https://checkout.stripe.com/checkout.js"></script>

<script src="js/jquery.min.js"> </script>


</head>

<body>

<div id="top"><!-- top Starts -->

<div class="container"><!-- container Starts -->

<div class="col-md-6 offer"><!-- col-md-6 offer Starts -->

<a href="#" class="btn btn-success btn-sm" >

<?php

if(!isset($_SESSION['customer_email'])){

echo "Welcome :Guest";


}else{

echo "Welcome : " . $_SESSION['customer_email'] . "";

}


?>

</a>

<a href="#">
Shopping Cart Total Price: <?php total_price(); ?>, Total Items <?php items(); ?>
</a>

</div><!-- col-md-6 offer Ends -->

<div class="col-md-6"><!-- col-md-6 Starts -->
<ul class="menu"><!-- menu Starts -->

<li>
<a href="customer_register.php">
Register
</a>
</li>

<li>
<?php

if(!isset($_SESSION['customer_email'])){

echo "<a href='checkout.php' >My Account</a>";

}
else{

echo "<a href='customer/my_account.php?my_orders'>My Account</a>";

}


?>
</li>

<li>
<a href="cart.php">
Go to Cart
</a>
</li>

<li>
<?php

if(!isset($_SESSION['customer_email'])){

echo "<a href='checkout.php'> Login </a>";

}else {

echo "<a href='logout.php'> Logout </a>";

}

?>
</li>

</ul><!-- menu Ends -->

</div><!-- col-md-6 Ends -->

</div><!-- container Ends -->
</div><!-- top Ends -->

<div class="navbar navbar-default" id="navbar"><!-- navbar navbar-default Starts -->
<div class="container" ><!-- container Starts -->

<div class="navbar-header"><!-- navbar-header Starts -->

<a class="navbar-brand home" href="index.php" ><!--- navbar navbar-brand home Starts -->

<img src="images/logo.png" alt="computerfever logo" class="hidden-xs" >
<img src="images/logo-small.png" alt="computerfever logo" class="visible-xs" >

</a><!--- navbar navbar-brand home Ends -->

<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation"  >

<span class="sr-only" >Toggle Navigation </span>

<i class="fa fa-align-justify"></i>

</button>

<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search" >

<span class="sr-only" >Toggle Search</span>

<i class="fa fa-search" ></i>

</button>


</div><!-- navbar-header Ends -->

<div class="navbar-collapse collapse" id="navigation" ><!-- navbar-collapse collapse Starts -->

<div class="padding-nav" ><!-- padding-nav Starts -->

<ul class="nav navbar-nav navbar-left"><!-- nav navbar-nav navbar-left Starts -->

<li>
<a href="index.php"> Home </a>
</li>

<li>
<a href="shop.php"> Shop </a>
</li>

<li>
<?php

if(!isset($_SESSION['customer_email'])){

echo "<a href='checkout.php' >My Account</a>";

}
else{

echo "<a href='customer/my_account.php?my_orders'>My Account</a>";

}


?>
</li>

<li>
<a href="cart.php"> Shopping Cart </a>
</li>

<li>
<a href="about.php"> About Us </a>
</li>

<li>

<a href="services.php"> Services </a>

</li>

<li>
<a href="contact.php"> Contact Us </a>
</li>

</ul><!-- nav navbar-nav navbar-left Ends -->

</div><!-- padding-nav Ends -->

<a class="btn btn-primary navbar-btn right" href="cart.php"><!-- btn btn-primary navbar-btn right Starts -->

<i class="fa fa-shopping-cart"></i>

<span> <?php items(); ?> items in cart </span>

</a><!-- btn btn-primary navbar-btn right Ends -->

<div class="navbar-collapse collapse right"><!-- navbar-collapse collapse right Starts -->

<button class="btn navbar-btn btn-primary" type="button" data-toggle="collapse" data-target="#search">

<span class="sr-only">Toggle Search</span>

<i class="fa fa-search"></i>

</button>

</div><!-- navbar-collapse collapse right Ends -->

<div class="collapse clearfix" id="search"><!-- collapse clearfix Starts -->

<form class="navbar-form" method="get" action="results.php"><!-- navbar-form Starts -->

<div class="input-group"><!-- input-group Starts -->

<input class="form-control" type="text" placeholder="Search" name="user_query" required>

<span class="input-group-btn"><!-- input-group-btn Starts -->

<button type="submit" value="Search" name="search" class="btn btn-primary">

<i class="fa fa-search"></i>

</button>

</span><!-- input-group-btn Ends -->

</div><!-- input-group Ends -->

</form><!-- navbar-form Ends -->

</div><!-- collapse clearfix Ends -->

</div><!-- navbar-collapse collapse Ends -->

</div><!-- container Ends -->
</div><!-- navbar navbar-default Ends -->


<div id="content" ><!-- content Starts -->
<div class="container" ><!-- container Starts -->

<div class="col-md-12" ><!--- col-md-12 Starts -->

<ul class="breadcrumb" ><!-- breadcrumb Starts -->

<li>
<a href="index.php">Home</a>
</li>

<li> Order Completed </li>

</ul><!-- breadcrumb Ends -->

<nav class="checkout-breadcrumbs text-center">

<a href="cart.php"> Shopping Cart </a>

<i class="fa fa-chevron-right"></i>

<a href="checkout.php"> Checkout Details </a>

<i class="fa fa-chevron-right"></i>

<a href="#" class="active"> Order Complete </a>

</nav>

</div><!--- col-md-12 Ends -->

<div class="col-md-8"><!-- col-md-8 Starts -->

<?php

if(isset($_GET["order_id"])){

$customer_email = $_SESSION['customer_email'];

$get_customer = "select * from customers where customer_email='$customer_email'";

$run_customer = mysqli_query($con, $get_customer);

$row_customer = mysqli_fetch_array($run_customer);

$customer_id = $row_customer['customer_id'];
	
$customer_contact = $row_customer['customer_contact'];	

$order_id = $_GET["order_id"];

$select_order = "select * from orders where order_id='$order_id' and customer_id='$customer_id'";

$run_order = mysqli_query($con,$select_order);

$row_order = mysqli_fetch_array($run_order);

$invoice_no = $row_order["invoice_no"];

$shipping_type = $row_order["shipping_type"];

$shipping_cost = $row_order["shipping_cost"];

$payment_method = $row_order["payment_method"];

$order_date = $row_order["order_date"];

$order_total = $row_order["order_total"];

$order_status = $row_order["order_status"];

$select_order_addresses = "select * from orders_addresses where order_id='$order_id'";

$run_order_addresses = mysqli_query($con, $select_order_addresses);

$row_order_addresses = mysqli_fetch_array($run_order_addresses);

$billing_first_name = $row_order_addresses["billing_first_name"];

$billing_last_name = $row_order_addresses["billing_last_name"];

$billing_country = $row_order_addresses["billing_country"];

$billing_address_1 = $row_order_addresses["billing_address_1"];

$billing_address_2 = $row_order_addresses["billing_address_2"];

$billing_state = $row_order_addresses["billing_state"];

$billing_city = $row_order_addresses["billing_city"];

$billing_postcode = $row_order_addresses["billing_postcode"];

$is_shipping_address_same = $row_order_addresses["is_shipping_address_same"];

// Shopping Details Starts

$shipping_first_name = $row_order_addresses["shipping_first_name"];

$shipping_last_name = $row_order_addresses["shipping_last_name"];

$shipping_country = $row_order_addresses["shipping_country"];

$shipping_address_1 = $row_order_addresses["shipping_address_1"];

$shipping_address_2 = $row_order_addresses["shipping_address_2"];

$shipping_state = $row_order_addresses["shipping_state"];

$shipping_city = $row_order_addresses["shipping_city"];

$shipping_postcode = $row_order_addresses["shipping_postcode"];

}

?>

<div class="box" id="order-summary"><!-- box order-summary Starts -->

<h3> Order Details </h3>

<table class="table"><!-- table Starts -->

<thead>

<tr>

<th class="text-muted lead"> Product: </th>

<th class="text-muted lead"> Total: </th>

</tr>

</thead>

<tbody>

<?php

$items_subtotal = 0;

$physical_products = array();

$select_order_items = "select * from orders_items where order_id='$order_id'";

$run_order_items = mysqli_query($con,$select_order_items);

while($row_order_items = mysqli_fetch_array($run_order_items)){
	
$product_id = $row_order_items["product_id"];

$product_qty = $row_order_items["qty"];

$product_price = $row_order_items["price"];

$product_size = $row_order_items["size"];

$sub_total = $product_price * $product_qty;

$select_product = "select * from products where product_id='$product_id'";

$run_product = mysqli_query($con,$select_product);

$row_product = mysqli_fetch_array($run_product);

$product_title = $row_product["product_title"];

$product_type = $row_product["product_type"];

if($product_type == "physical_product"){
	
array_push($physical_products,$product_id);
	
}

$items_subtotal += $sub_total;

?>

<tr>

<td>

<a href="#" class="bold"> <?php echo $product_title; ?> </a>

<i class="fa fa-times" title="Product Qty"></i> <?php echo $product_qty; ?> 

<?php if($product_size != "None"){ ?>

<i class="fa fa-plus" title="Product Size"></i> <?php echo $product_size; ?> 

<?php } ?>

</td>

<th>$<?php echo $sub_total; ?> </th>

</tr>


<?php } ?>

<tr>

<th class="text-muted"> Subtotal: </th>

<th> $<?php echo $items_subtotal; ?>  </th>

</tr>

<?php if(count($physical_products) > 0){ ?>

<tr>

<th class="text-muted"> Shipping: </th>

<th>

<span class="text-muted">

<i class="fa fa-truck"></i> <?php echo $shipping_type; ?>:

</span>

$<?php echo $shipping_cost; ?>

</th>

</tr>

<?php } ?>

<tr class="total">

<td> Total: </td>

<td>$<?php echo $order_total; ?></td>

</tr>

</tbody>

</table><!-- table Ends -->

<h3> Customer Details </h3>

<table class="table"><!-- table Starts -->

<tbody>

<tr>

<th class="text-muted"> Email: </th>

<th> <?php echo $customer_email; ?> </th>

</tr>

<tr>

<th class="text-muted"> Phone: </th>

<th> <?php echo $customer_contact; ?> </th>

</tr>

</tbody>

</table><!-- table Ends -->

<div class="row"><!-- row Starts -->

<div class="col-sm-6"><!-- col-sm-6 Starts -->

<h4> Billing Details </h4>

<address class="text-muted" style="font-size:15px;">

<?php echo $billing_first_name . " " . $billing_last_name; ?><br>

<?php echo $billing_address_1; ?><br>

<?php echo $billing_address_2; ?><br>

<?php echo $billing_city; ?><br>

<?php echo $billing_state; ?><br>

<?php echo $billing_postcode; ?><br>

<?php 

$select_country = "select * from countries where country_id='$billing_country'";

$run_country = mysqli_query($con,$select_country);

$row_country = mysqli_fetch_array($run_country);

echo $country_name = $row_country["country_name"];



?><br>

</address>

</div><!-- col-sm-6 Ends -->

<?php if($is_shipping_address_same == "no"){ ?>

<div class="col-sm-6"><!-- col-sm-6 Starts -->

<h4> Shipping Details </h4>

<address class="text-muted" style="font-size:15px;">

<?php echo $shipping_first_name . " " . $shipping_last_name; ?><br>

<?php echo $shipping_address_1; ?><br>

<?php echo $shipping_address_2; ?><br>

<?php echo $shipping_city; ?><br>

<?php echo $shipping_state; ?><br>

<?php echo $shipping_postcode; ?><br>

<?php 

$select_country = "select * from countries where country_id='$shipping_country'";

$run_country = mysqli_query($con,$select_country);

$row_country = mysqli_fetch_array($run_country);

echo $country_name = $row_country["country_name"];



?><br>

</address>

</div><!-- col-sm-6 Ends -->

<?php } ?>

</div><!-- row Ends -->

</div><!-- box order-summary Ends -->

</div><!-- col-md-8 Ends -->

<div class="col-md-4"><!-- col-md-4 Starts -->

<div class="box"><!-- box Starts -->

<h4 class="text-success"> Thank you. Your order has been received. </h4>

<ul class="order-received-list"><!-- ul order-received-list Starts -->

<li> Invoice/Order Number: <strong>#<?php echo $invoice_no; ?></strong> </li>

<li> Date: <strong><?php echo $order_date; ?></strong> </li>

<li> Payment Method: <strong><?php echo ucwords($payment_method); ?></strong> </li>

<li> Total: <strong>$<?php echo $order_total; ?></strong> </li>

<li> 

<strong>

<a class="text-muted" href="customer/my_account.php?my_orders"> Click Here For Go To My Account </a>

</strong> 

</li>

</ul><!-- ul order-received-list Ends -->

</div><!-- box Ends -->

</div><!-- col-md-4 Ends -->

</div><!-- container Ends -->
</div><!-- content Ends -->



<?php

include("includes/footer.php");

?>



<script src="js/bootstrap.min.js"></script>

</body>
</html>