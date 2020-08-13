<?php

if(!defined("review_order")){
	
echo "<script> window.open('checkout.php','_self'); </script>";	
	
}

?>

<div class="row"><!-- row Starts -->

<?php

$ip_add = getRealUserIp();

$select_cart = "select * from cart where ip_add='$ip_add'";

$run_cart = mysqli_query($con,$select_cart);

$count = mysqli_num_rows($run_cart);

if($count == 0){

?>

<div class="col-md-12"><!-- col-md-12 Starts -->

<div class="box text-center"><!-- box text-center Starts -->

<p class="lead"> Checkout Is Not Available. Your Cart Is Currently Empty. </p>

<a href="shop.php" class="btn btn-primary btn-lg"> Return To Shop </a>

</div><!-- box text-center Ends -->

</div><!-- col-md-12 Ends -->

<?php }else{ ?>

<div class="col-md-8"><!-- col-md-8 Starts -->

<div class="box"><!-- box Starts -->

<p class="lead"> Please Feel Free To Check Your Billing Details And Shipping Details. </p>

<?php

$customer_email = $_SESSION['customer_email'];

$get_customer = "select * from customers where customer_email='$customer_email'";

$run_customer = mysqli_query($con, $get_customer);

$row_customer = mysqli_fetch_array($run_customer);

$customer_id = $row_customer['customer_id'];

$select_customers_addresses = "select * from customers_addresses where customer_id='$customer_id'";

$run_customers_addresses = mysqli_query($con, $select_customers_addresses);

$row_customers_addresses = mysqli_fetch_array($run_customers_addresses);

$billing_first_name = $row_customers_addresses['billing_first_name'];

$billing_last_name = $row_customers_addresses['billing_last_name'];

$billing_country = $row_customers_addresses['billing_country'];

$billing_address_1 = $row_customers_addresses['billing_address_1'];

$billing_address_2 = $row_customers_addresses['billing_address_2'];

$billing_state = $row_customers_addresses['billing_state'];

$billing_city = $row_customers_addresses['billing_city'];

$billing_postcode = $row_customers_addresses['billing_postcode'];

//Shipping Details Starts

$shipping_first_name = $row_customers_addresses['shipping_first_name'];

$shipping_last_name = $row_customers_addresses['shipping_last_name'];

$shipping_country = $row_customers_addresses['shipping_country'];

$shipping_address_1 = $row_customers_addresses['shipping_address_1'];

$shipping_address_2 = $row_customers_addresses['shipping_address_2'];

$shipping_state = $row_customers_addresses['shipping_state'];

$shipping_city = $row_customers_addresses['shipping_city'];

$shipping_postcode = $row_customers_addresses['shipping_postcode'];

$physical_products = array();

$select_cart = "select * from cart where ip_add='$ip_add'";

$run_cart = mysqli_query($con,$select_cart);

while($row_cart = mysqli_fetch_array($run_cart)){

$product_id = $row_cart['p_id'];

$get_product = "select * from products where product_id='$product_id'";

$run_product = mysqli_query($con,$get_product);

$row_product = mysqli_fetch_array($run_product);

$product_type = $row_product['product_type'];

if($product_type == "physical_product"){
	
array_push($physical_products, $product_id);
	
}
	
}

?>

<form method="post" id="shipping-billing-details-form"><!-- shipping-billing-details-form Starts -->

<h2> Billing Details </h2>

<div class="row"><!-- row Starts -->

<div class="col-sm-6"><!-- col-sm-6 Starts -->

<div class="form-group"><!-- form-group Starts -->

<label> First Name: </label>

<input type="text" name="billing_first_name" class="form-control" value="<?php echo $billing_first_name; ?>" required>

</div><!-- form-group Ends -->

</div><!-- col-sm-6 Ends -->

<div class="col-sm-6"><!-- col-sm-6 Starts -->

<div class="form-group"><!-- form-group Starts -->

<label> Last Name: </label>

<input type="text" name="billing_last_name" class="form-control" value="<?php echo $billing_last_name; ?>" required>

</div><!-- form-group Ends -->

</div><!-- col-sm-6 Ends -->

</div><!-- row Ends -->

<div class="form-group"><!-- form-group Starts -->

<label> Country: </label>

<select name="billing_country" class="form-control" required>

<option value=""> Select A Country </option>

<?php

$get_countries = "select * from countries";

$run_countries = mysqli_query($con,$get_countries);

while($row_country = mysqli_fetch_array($run_countries)){

$country_id = $row_country['country_id'];

$country_name = $row_country['country_name'];

?>

<option value="<?php echo $country_id; ?>" 

<?php

if($billing_country == $country_id){ echo "selected"; }

?>

>

<?php echo $country_name; ?>

</option>

<?php
	
}

?>

</select>

</div><!-- form-group Ends -->


<div class="form-group"><!-- form-group Starts -->

<label> Address 1: </label>

<input type="text" name="billing_address_1" class="form-control" value="<?php echo $billing_address_1; ?>" required>

</div><!-- form-group Ends -->


<div class="form-group"><!-- form-group Starts -->

<label> Address 2 (optional): </label>

<input type="text" name="billing_address_2" class="form-control" value="<?php echo $billing_address_2; ?>">

</div><!-- form-group Ends -->

<div class="row"><!-- row Starts -->

<div class="col-sm-6"><!-- col-sm-6 Starts -->

<div class="form-group"><!-- form-group Starts -->

<label> State / County: </label>

<input type="text" name="billing_state" class="form-control" value="<?php echo $billing_state; ?>" required>

</div><!-- form-group Ends -->

</div><!-- col-sm-6 Ends -->

<div class="col-sm-6"><!-- col-sm-6 Starts -->

<div class="form-group"><!-- form-group Starts -->

<label> City / Town: </label>

<input type="text" name="billing_city" class="form-control" value="<?php echo $billing_city; ?>" required>

</div><!-- form-group Ends -->

</div><!-- col-sm-6 Ends -->

</div><!-- row Ends -->

<div class="form-group"><!-- form-group Starts -->

<label> Postcode / Zip : </label>

<input type="text" name="billing_postcode" class="form-control" value="<?php echo $billing_postcode; ?>" required>

</div><!-- form-group Ends -->

<?php if(count($physical_products) > 0){ ?>

<hr>

<div class="form-group"><!-- form-group Starts -->

<h4> Is Shipping Details Are The Same?</h4>

<?php

if(!isset($_SESSION["is_shipping_address_same"])){
	
$_SESSION["is_shipping_address_same"] = "yes";
	
}

?>

<input type="radio" name="is_shipping_address_same" value="yes"

<?php

if(@$_SESSION["is_shipping_address_same"] == "yes"){ echo "checked"; }

?>
>

<label> Yes </label>

<input type="radio" name="is_shipping_address_same" value="no"

<?php

if(@$_SESSION["is_shipping_address_same"] == "no"){ echo "checked"; }

?>
>

<label> No </label>

</div><!-- form-group Ends -->



<div id="shipping-details-form-div"><!-- shipping-details-form-div Starts -->

<h2> Shipping Details </h2>

<div class="row"><!-- row Starts -->

<div class="col-sm-6"><!-- col-sm-6 Starts -->

<div class="form-group"><!-- form-group Starts -->

<label> First Name: </label>

<input type="text" name="shipping_first_name" class="form-control" value="<?php echo $shipping_first_name; ?>" required>

</div><!-- form-group Ends -->

</div><!-- col-sm-6 Ends -->

<div class="col-sm-6"><!-- col-sm-6 Starts -->

<div class="form-group"><!-- form-group Starts -->

<label> Last Name: </label>

<input type="text" name="shipping_last_name" class="form-control" value="<?php echo $shipping_last_name; ?>" required>

</div><!-- form-group Ends -->

</div><!-- col-sm-6 Ends -->

</div><!-- row Ends -->

<div class="form-group"><!-- form-group Starts -->

<label> Country: </label>

<select name="shipping_country" class="form-control" required>

<option value=""> Select A Country </option>

<?php

$get_countries = "select * from countries";

$run_countries = mysqli_query($con,$get_countries);

while($row_country = mysqli_fetch_array($run_countries)){

$country_id = $row_country['country_id'];

$country_name = $row_country['country_name'];

?>

<option value="<?php echo $country_id; ?>" 

<?php

if($shipping_country == $country_id){ echo "selected"; }

?>

>

<?php echo $country_name; ?>

</option>

<?php
	
}

?>

</select>

</div><!-- form-group Ends -->


<div class="form-group"><!-- form-group Starts -->

<label> Address 1: </label>

<input type="text" name="shipping_address_1" class="form-control" value="<?php echo $shipping_address_1; ?>" required>

</div><!-- form-group Ends -->


<div class="form-group"><!-- form-group Starts -->

<label> Address 2 (optional): </label>

<input type="text" name="shipping_address_2" class="form-control" value="<?php echo $shipping_address_2; ?>">

</div><!-- form-group Ends -->

<div class="row"><!-- row Starts -->

<div class="col-sm-6"><!-- col-sm-6 Starts -->

<div class="form-group"><!-- form-group Starts -->

<label> State / County: </label>

<input type="text" name="shipping_state" class="form-control" value="<?php echo $shipping_state; ?>" required>

</div><!-- form-group Ends -->

</div><!-- col-sm-6 Ends -->

<div class="col-sm-6"><!-- col-sm-6 Starts -->

<div class="form-group"><!-- form-group Starts -->

<label> City / Town: </label>

<input type="text" name="shipping_city" class="form-control" value="<?php echo $shipping_city; ?>" required>

</div><!-- form-group Ends -->

</div><!-- col-sm-6 Ends -->

</div><!-- row Ends -->

<div class="form-group"><!-- form-group Starts -->

<label> Postcode / Zip : </label>

<input type="text" name="shipping_postcode" class="form-control" value="<?php echo $shipping_postcode; ?>" required>

</div><!-- form-group Ends -->

</div><!-- shipping-details-form-div Ends -->

<?php } ?>

<input type="submit" name="submit" id="shipping-details-form-submit-button" value="Submit Form" style="display:none;">

</form><!-- shipping-billing-details-form Ends -->

</div><!-- box Ends -->

</div><!-- col-md-8 Starts -->

<div class="col-md-4"><!-- col-md-4 Starts -->

<div class="box" id="order-summary"><!-- box Starts -->

<div class="box-header"><!-- box-header Starts -->

<h3> Order Summary </h3>

</div><!-- box-header Ends -->

<table class="table"><!-- table Starts -->

<thead>

<tr>

<th class="text-muted lead"> Product: </th>

<th class="text-muted lead"> Total: </th>

</tr>

</thead>

<tbody id="checkout-tbody-reload"><!-- tbody Starts -->

<?php

$total = 0;

$total_weight = 0;

$select_cart = "select * from cart where ip_add='$ip_add'";

$run_cart = mysqli_query($con,$select_cart);

while($row_cart = mysqli_fetch_array($run_cart)){

$product_id = $row_cart['p_id'];

$product_price = $row_cart['p_price'];

$product_qty = $row_cart['qty'];

$product_size = $row_cart['size'];

$get_product = "select * from products where product_id='$product_id'";

$run_product = mysqli_query($con,$get_product);

$row_product = mysqli_fetch_array($run_product);

$product_title = $row_product['product_title'];

$product_weight = $row_product['product_weight'];

$sub_total = $product_price * $product_qty;

$total += $sub_total;

$sub_total_weight = $product_weight * $product_qty;

$total_weight += $sub_total_weight;

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

<td class="text-muted bold"> Order Subtotal </td>

<th> $<?php echo $total; ?>.00 </th>

</tr>

<?php if(count($physical_products) > 0){  ?>

<tr>

<th colspan="2">

<P class="shipping-header text-muted">

<I class="fa fa-truck"></i> Shipping:

</P>

<ul class="list-unstyled"><!-- shipping ul list-unstyled Starts -->

<?php

$shipping_zone_id = "";

if(@$_SESSION["is_shipping_address_same"] == "yes"){

if(empty($billing_country) and empty($billing_postcode)){

echo "

<li>

<p>

There are no shipping types available. Please double check your address, or contact us if you need any help.

</p>

</li>

";
	
}

$select_zones = "select * from zones order by zone_order DESC";	

$run_zones = mysqli_query($con, $select_zones);

while($row_zones = mysqli_fetch_array($run_zones)){

$zone_id = $row_zones['zone_id'];

$select_zones_locations = "select DISTINCT zone_id from zones_locations where zone_id='$zone_id' and (location_code='$billing_country' and location_type='country')";

$run_zones_locations = mysqli_query($con, $select_zones_locations);

$count_zones_locations = mysqli_num_rows($run_zones_locations);

if($count_zones_locations != "0"){
	
$row_zones_locations = mysqli_fetch_array($run_zones_locations);

$zone_id = $row_zones_locations["zone_id"];

$select_zone_shipping = "select * from shipping where shipping_zone='$zone_id'";

$run_zone_shipping = mysqli_query($con, $select_zone_shipping);

$count_zone_shipping = mysqli_num_rows($run_zone_shipping);

if($count_zone_shipping != "0"){
	
$select_zone_postcodes = "select * from zones_locations where zone_id='$zone_id' and location_type='postcode'";

$run_zone_postcodes = mysqli_query($con, $select_zone_postcodes);

$count_zone_postcodes = mysqli_num_rows($run_zone_postcodes);

if($count_zone_postcodes != "0"){

while($row_zones_postcodes = mysqli_fetch_array($run_zone_postcodes)){
	
$location_code = $row_zones_postcodes["location_code"];

if($location_code == $billing_postcode){

$shipping_zone_id = $zone_id;
	
}
	
}
	
}else{

$shipping_zone_id = $zone_id;
	
}

	
}
	
}
	

}
	
}elseif(@$_SESSION["is_shipping_address_same"] == "no"){

if(empty($shipping_country) and empty($shipping_postcode)){

echo "

<li>

<p>

There are no shipping types available. Please double check your address, or contact us if you need any help.

</p>

</li>

";
	
}

$select_zones = "select * from zones order by zone_order DESC";	

$run_zones = mysqli_query($con, $select_zones);

while($row_zones = mysqli_fetch_array($run_zones)){

$zone_id = $row_zones['zone_id'];

$select_zones_locations = "select DISTINCT zone_id from zones_locations where zone_id='$zone_id' and (location_code='$shipping_country' and location_type='country')";

$run_zones_locations = mysqli_query($con, $select_zones_locations);

$count_zones_locations = mysqli_num_rows($run_zones_locations);

if($count_zones_locations != "0"){
	
$row_zones_locations = mysqli_fetch_array($run_zones_locations);

$zone_id = $row_zones_locations["zone_id"];

$select_zone_shipping = "select * from shipping where shipping_zone='$zone_id'";

$run_zone_shipping = mysqli_query($con, $select_zone_shipping);

$count_zone_shipping = mysqli_num_rows($run_zone_shipping);

if($count_zone_shipping != "0"){
	
$select_zone_postcodes = "select * from zones_locations where zone_id='$zone_id' and location_type='postcode'";

$run_zone_postcodes = mysqli_query($con, $select_zone_postcodes);

$count_zone_postcodes = mysqli_num_rows($run_zone_postcodes);

if($count_zone_postcodes != "0"){

while($row_zones_postcodes = mysqli_fetch_array($run_zone_postcodes)){
	
$location_code = $row_zones_postcodes["location_code"];

if($location_code == $shipping_postcode){

$shipping_zone_id = $zone_id;
	
}
	
}
	
}else{

$shipping_zone_id = $zone_id;
	
}

	
}
	
}
	

}
	
	
}else{


	if(empty($billing_country) and empty($billing_postcode)){

echo "

<li>

<p>

There are no shipping types available. Please double check your address, or contact us if you need any help.

</p>

</li>

";
	
}

$select_zones = "select * from zones order by zone_order DESC";	

$run_zones = mysqli_query($con, $select_zones);

while($row_zones = mysqli_fetch_array($run_zones)){

$zone_id = $row_zones['zone_id'];

$select_zones_locations = "select DISTINCT zone_id from zones_locations where zone_id='$zone_id' and (location_code='$billing_country' and location_type='country')";

$run_zones_locations = mysqli_query($con, $select_zones_locations);

$count_zones_locations = mysqli_num_rows($run_zones_locations);

if($count_zones_locations != "0"){
	
$row_zones_locations = mysqli_fetch_array($run_zones_locations);

$zone_id = $row_zones_locations["zone_id"];

$select_zone_shipping = "select * from shipping where shipping_zone='$zone_id'";

$run_zone_shipping = mysqli_query($con, $select_zone_shipping);

$count_zone_shipping = mysqli_num_rows($run_zone_shipping);

if($count_zone_shipping != "0"){
	
$select_zone_postcodes = "select * from zones_locations where zone_id='$zone_id' and location_type='postcode'";

$run_zone_postcodes = mysqli_query($con, $select_zone_postcodes);

$count_zone_postcodes = mysqli_num_rows($run_zone_postcodes);

if($count_zone_postcodes != "0"){

while($row_zones_postcodes = mysqli_fetch_array($run_zone_postcodes)){
	
$location_code = $row_zones_postcodes["location_code"];

if($location_code == $billing_postcode){

$shipping_zone_id = $zone_id;
	
}
	
}
	
}else{

$shipping_zone_id = $zone_id;
	
}

	
}
	
}
	

}
	
}


if(!empty($shipping_zone_id)){

$select_shipping_types = "
select *,if(
$total_weight > (
select max(shipping_weight) from shipping
where shipping_type=type_id AND shipping_zone='$shipping_zone_id'
),
(
select shipping_cost from shipping 
where shipping_type=type_id AND shipping_zone='$shipping_zone_id' order by shipping_weight DESC LIMIT 0,1
),
(
select shipping_cost from shipping where shipping_type=type_id
AND shipping_zone='$shipping_zone_id' AND shipping_weight >= '$total_weight' order by shipping_weight ASC LIMIT 0,1
)

) AS shipping_cost from shipping_types where type_local='yes' order by type_order ASC
";

$run_shipping_types = mysqli_query($con, $select_shipping_types);

$i = 0;

while($row_shipping_types = mysqli_fetch_array($run_shipping_types)){

$i++;	

$type_id = $row_shipping_types['type_id'];

$type_name = $row_shipping_types['type_name'];

$type_default = $row_shipping_types['type_default'];

$shipping_cost = $row_shipping_types['shipping_cost'];

if(!empty($shipping_cost)){

?>

<li>

<input type="radio" name="shipping_type" value="<?php echo $type_id; ?>" class="shipping_type" data-shipping_cost="<?php echo $shipping_cost; ?>" 

<?php

if($type_default == "yes"){

$_SESSION["shipping_type"] = $type_id;

$_SESSION["shipping_cost"] = $shipping_cost;

echo "checked";
	
}elseif($i == 1){
	
$_SESSION["shipping_type"] = $type_id;

$_SESSION["shipping_cost"] = $shipping_cost;

echo "checked";	
	
}

?>

>

<?php echo $type_name; ?>: <span class="text-muted"> $<?php echo $shipping_cost; ?> </span>

</li>

<?php
	
}
	
}
	
}else{

if(!empty($billing_country) or !empty($shipping_country)){

if(@$_SESSION["is_shipping_address_same"] == "yes"){

$select_country_shipping = "select * from shipping where shipping_country='$billing_country'";
	
}elseif(@$_SESSION["is_shipping_address_same"] == "no"){

$select_country_shipping = "select * from shipping where shipping_country='$shipping_country'";	
	
}else{

$select_country_shipping = "select * from shipping where shipping_country='$billing_country'";	
	
}

$run_country_shipping = mysqli_query($con, $select_country_shipping);

$count_country_shipping = mysqli_num_rows($run_country_shipping);

if($count_country_shipping == "0"){

echo "

<li>

<p>

There are no shipping types matched/available for your address, or contact us if you need any help.

</p>

</li>

";
	
}else{
	
if(@$_SESSION["is_shipping_address_same"] == "yes"){

$select_shipping_types = "
select *,if(
$total_weight > (
select max(shipping_weight) from shipping
where shipping_type=type_id AND shipping_country='$billing_country'
),
(
select shipping_cost from shipping 
where shipping_type=type_id AND shipping_country='$billing_country' order by shipping_weight DESC LIMIT 0,1
),
(
select shipping_cost from shipping where shipping_type=type_id
AND shipping_country='$billing_country' AND shipping_weight >= '$total_weight' order by shipping_weight ASC LIMIT 0,1
)

) AS shipping_cost from shipping_types where type_local='no' order by type_order ASC
";
	
}elseif(@$_SESSION["is_shipping_address_same"] == "no"){

$select_shipping_types = "
select *,if(
$total_weight > (
select max(shipping_weight) from shipping
where shipping_type=type_id AND shipping_country='$shipping_country'
),
(
select shipping_cost from shipping 
where shipping_type=type_id AND shipping_country='$shipping_country' order by shipping_weight DESC LIMIT 0,1
),
(
select shipping_cost from shipping where shipping_type=type_id
AND shipping_country='$shipping_country' AND shipping_weight >= '$total_weight' order by shipping_weight ASC LIMIT 0,1
)

) AS shipping_cost from shipping_types where type_local='no' order by type_order ASC
";
	
}else{

$select_shipping_types = "
select *,if(
$total_weight > (
select max(shipping_weight) from shipping
where shipping_type=type_id AND shipping_country='$billing_country'
),
(
select shipping_cost from shipping 
where shipping_type=type_id AND shipping_country='$billing_country' order by shipping_weight DESC LIMIT 0,1
),
(
select shipping_cost from shipping where shipping_type=type_id
AND shipping_country='$billing_country' AND shipping_weight >= '$total_weight' order by shipping_weight ASC LIMIT 0,1
)

) AS shipping_cost from shipping_types where type_local='no' order by type_order ASC
";	
	
}

$run_shipping_types = mysqli_query($con, $select_shipping_types);

$i = 0;

while($row_shipping_types = mysqli_fetch_array($run_shipping_types)){

$i++;	

$type_id = $row_shipping_types['type_id'];

$type_name = $row_shipping_types['type_name'];

$type_default = $row_shipping_types['type_default'];

$shipping_cost = $row_shipping_types['shipping_cost'];

if(!empty($shipping_cost)){

?>

<li>

<input type="radio" name="shipping_type" value="<?php echo $type_id; ?>" class="shipping_type" data-shipping_cost="<?php echo $shipping_cost; ?>" 

<?php

if($type_default == "yes"){

$_SESSION["shipping_type"] = $type_id;

$_SESSION["shipping_cost"] = $shipping_cost;

echo "checked";
	
}elseif($i == 1){
	
$_SESSION["shipping_type"] = $type_id;

$_SESSION["shipping_cost"] = $shipping_cost;

echo "checked";	
	
}

?>

>

<?php echo $type_name; ?>: <span class="text-muted"> $<?php echo $shipping_cost; ?> </span>

</li>

<?php
	
}
	
}
	
}


	
}
	
}

$total_cart_price = $total + @$_SESSION["shipping_cost"];

?>

</ul><!-- shipping ul list-unstyled Ends -->

</th>

</tr>

<?php } ?>

<tr>

<td class="text-muted bold">Tax</td>

<th>$0.00</th>

</tr>

<tr class="total">

<td>Total</td>

<?php if(count($physical_products) > 0){ ?>

<th class="total-cart-price">$<?php echo $total_cart_price; ?>.00</th>

<?php }else{ ?>

<th class="total-cart-price">$<?php echo $total; ?>.00</th>

<?php } ?>

</tr>

<tr>

<th colspan="2">

<input id="offline-radio" type="radio" name="payment_method" value="pay_offline">

<label for="offline-radio"> Pay Offline </label>

<p id="offline-desc" class="text-muted">

Your order will not be shipped until the funds have cleared in our account.

</P>

</th>

</tr>

<tr>

<th colspan="2">

<input id="stripe-radio" type="radio" name="payment_method" value="stripe">

<label for="stripe-radio"> Credit Card (Stripe) </label>

<p id="stripe-desc" class="text-muted">

Pay with your credit card via Stripe.

</P>

</th>

</tr>

<tr>

<th colspan="2">

<input id="paypal-radio" type="radio" name="payment_method" value="paypal" checked>

<label for="paypal-radio"> Paypal </label>

<p id="paypal-desc" class="text-muted">

Pay via PayPal you can pay with your credit card if you don’t have a PayPal account.

</P>

</th>

</tr>

<tr>

<td id="payment-method-forms-td" colspan="2"><!-- payment-method-forms-td Starts -->

<form id="offline-form" action="order.php" method="post"><!-- offline-form Starts -->

<?php if(count($physical_products) > 0){ ?>

<input type="hidden" name="amount" value="<?php echo $total_cart_price; ?>" >

<?php }else{ ?>

<input type="hidden" name="amount" value="<?php echo $total; ?>" >

<?php } ?>

<input type="submit" value="Place Order" id="offline-submit" class="btn btn-success btn-lg" style="border-radius:0px;">

</form><!-- offline-form Ends -->

<?php

include("stripe_config.php");

if(count($physical_products) > 0){
	
$stripe_total_amount = $total_cart_price * 100;
	
}else{
	
$stripe_total_amount = $total * 100;
	
}	

?>

<form id="stripe-form" action="stripe_charge.php" method="post"><!-- stripe-form Starts -->

<?php if(count($physical_products) > 0){ ?>

<input type="hidden" name="total_amount" value="<?php echo $total_cart_price; ?>" >

<?php }else{ ?>

<input type="hidden" name="total_amount" value="<?php echo $total; ?>" >

<?php } ?>

<input type="hidden" name="stripe_total_amount" value="<?php echo $stripe_total_amount; ?>" >

<input

type="submit"

id="stripe-submit"

class="btn btn-success btn-lg"

value="Procced With Stripe"

style="border-radius:0px;"

data-name="computerfever.com"

data-description="Pay With Credit Card"

data-image="images/stripe-logo.png"

data-key="<?php echo $stripe["publishable_key"]; ?>"

data-amount="<?php echo $stripe_total_amount; ?>"

data-currency="usd"

data-email="<?php echo $customer_email; ?>"

>

</form><!-- stripe-form Ends -->

<form id="paypal-form" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post"><!-- paypal-form Starts -->

<input type="hidden" name="business" value="admin-bussioness@computerfever.com" >

<input type="hidden" name="cmd" value="_cart" >

<input type="hidden" name="upload" value="1" >

<input type="hidden" name="currency_code" value="USD" >

<?php if(count($physical_products) > 0){ ?>

<input type="hidden" name="return" value="http://localhost/ecom_store/paypal_order.php?c_id=<?php echo $customer_id; ?>&amount=<?php echo $total_cart_price; ?>" >

<?php }else{ ?>

<input type="hidden" name="return" value="http://localhost/ecom_store/paypal_order.php?c_id=<?php echo $customer_id; ?>&amount=<?php echo $total; ?>" >

<?php } ?>

<input type="hidden" name="cancel_return" value="http://localhost/ecom_store/checkout.php" >

<?php

$i = 0;

$select_cart = "select * from cart where ip_add='$ip_add'";

$run_cart = mysqli_query($con,$select_cart);

while($row_cart = mysqli_fetch_array($run_cart)){

$product_id = $row_cart['p_id'];

$product_qty = $row_cart['qty'];

$product_price = $row_cart['p_price'];

$get_product = "select * from products where product_id='$product_id'";

$run_product = mysqli_query($con,$get_product);

$row_product = mysqli_fetch_array($run_product);

$product_title = $row_product["product_title"];

$i++;

?>

<input type="hidden" name="item_name_<?php echo $i; ?>" value="<?php echo $product_title; ?>">

<input type="hidden" name="item_nubmer_<?php echo $i; ?>" value="<?php echo $i; ?>">

<input type="hidden" name="amount_<?php echo $i; ?>" value="<?php echo $product_price; ?>">

<input type="hidden" name="quantity_<?php echo $i; ?>" value="<?php echo $product_qty; ?>">

<?php } ?>

<input type="hidden" name="shipping_1" value="<?php echo @$_SESSION["shipping_cost"]; ?>" >

<input type="hidden" name="first_name" value="<?php echo $billing_first_name; ?>" >

<input type="hidden" name="last_name" value="<?php echo $billing_last_name; ?>" >

<input type="hidden" name="address1" value="<?php echo $billing_address_1; ?>" >

<input type="hidden" name="address2" value="<?php echo $billing_address_2; ?>" >

<input type="hidden" name="city" value="<?php echo $billing_city; ?>" >

<input type="hidden" name="state" value="<?php echo $billing_state; ?>" >

<input type="hidden" name="zip" value="<?php echo $billing_postcode; ?>" >

<input type="hidden" name="email" value="<?php echo $customer_email; ?>" >

<input type="submit" id="paypal-submit" name="submit" value="Procced With PayPal" class="btn btn-success btn-lg" style="border-radius:0px;" >

</form><!-- paypal-form Ends -->

</td><!-- payment-method-forms-td Ends -->

</tr>

</tbody><!-- tbody Ends -->

</table><!-- table Ends -->

</div><!-- box Ends -->

</div><!-- col-md-4 Starts -->

<?php } ?>

</div><!-- row Ends -->

<script>

$(document).ready(function(){
	
<?php if(@$_SESSION["is_shipping_address_same"] == "yes"){ ?>	
	
$("#shipping-details-form-div :input").prop("disabled", true);

$("#shipping-details-form-div").hide();

<?php } ?>

$("input[name='is_shipping_address_same']").click(function(){
	
var radio_value = $(this).val();

if(radio_value == "yes"){

$("#shipping-details-form-div :input").prop("disabled", true);

$("#shipping-details-form-div").hide();
	
}else if(radio_value == "no"){
	
$("#shipping-details-form-div :input").prop("disabled", false);

$("#shipping-details-form-div").show();
	
}
	
});

$("#shipping-billing-details-form :input").change(function(){
	
var form = document.getElementById("shipping-billing-details-form");

var form_data = new FormData(form);

var shipping_type = $("input[name='shipping_type']:checked").val();

var payment_method = $("input[name='payment_method']:checked").val();

form_data.append("shipping_type", shipping_type);

form_data.append("payment_method", payment_method);

$("table").addClass("wait-loader");

$.ajax({
	
url: "update_billing_shipping_details.php",

method: "POST",

processData: false,

contentType: false,

cache: false,

data: form_data
	
}).done(function(){
	
$("#checkout-tbody-reload").load("checkout_tbody.php");

$("table").removeClass("wait-loader");
	
});
	
});

<?php if(count($physical_products) > 0){ ?>

$(document).on("change", ".shipping_type", function(){
	
var total = Number(<?php echo $total; ?>);

var shipping_type = $(this).val();

var shipping_cost = Number($(this).data("shipping_cost"));

var payment_method = $("input[name='payment_method']:checked").val();

var total_cart_price = total + shipping_cost;

$("table").addClass("wait-loader");

$.ajax({
	
url:"change_checkout_shipping.php",

method:"POST",

data:{total: total, shipping_type: shipping_type, shipping_cost: shipping_cost, payment_method: payment_method}
	
}).done(function(data){
	
$(".total-cart-price").html("$" + total_cart_price + ".00");

$("#payment-method-forms-td").html(data);

$("table").removeClass("wait-loader");
	
});
	
});

<?php } ?>

$("#offline-desc").hide();

$("#offline-form").hide();

$("#stripe-desc").hide();

$("#stripe-form").hide();

$("#paypal-desc").show();

$("#paypal-form").show();

$("#offline-radio").click(function(){
	
$("#offline-desc").show();

$("#offline-form").show();

$("#stripe-desc").hide();

$("#stripe-form").hide();

$("#paypal-desc").hide();

$("#paypal-form").hide();
	
});


$("#stripe-radio").click(function(){
	
$("#offline-desc").hide();

$("#offline-form").hide();

$("#stripe-desc").show();

$("#stripe-form").show();

$("#paypal-desc").hide();

$("#paypal-form").hide();
	
});


$("#paypal-radio").click(function(){
	
$("#offline-desc").hide();

$("#offline-form").hide();

$("#stripe-desc").hide();

$("#stripe-form").hide();

$("#paypal-desc").show();

$("#paypal-form").show();
	
});

$("#offline-submit").click(function(event){
	
event.preventDefault();	

$("#shipping-billing-details-form").submit(function(event){

event.preventDefault();

var confirm_action = confirm("Do You Really Want To Order Cart Products By Pay Offline Method.");

if(confirm_action == true){

$("#offline-submit").click();
	
}
	
});

$("#shipping-details-form-submit-button").click();
	
});

$("#stripe-submit").click(function(event){
	
event.preventDefault();	

$("#shipping-billing-details-form").submit(function(event){

event.preventDefault();

var confirm_action = confirm("Do You Really Want To Order Cart Products By Credit Card (stripe) Method.");

if(confirm_action == true){

var $button = $("#stripe-submit"),
                    $form = $button.parents('form');
                var opts = $.extend({}, $button.data(), {
                    token: function(result) {
                        $form.append($('<input>').attr({ type: 'hidden', name: 'stripeToken', value: result.id })).submit();
                    }
                });
                StripeCheckout.open(opts);
	
}
	
});

$("#shipping-details-form-submit-button").click();
	
});

$("#paypal-submit").click(function(event){
	
event.preventDefault();	

$("#shipping-billing-details-form").submit(function(event){

event.preventDefault();

var confirm_action = confirm("Do You Really Want To Order Cart Products By PayPal Method.");

if(confirm_action == true){

$("#paypal-submit").click();
	
}
	
});

$("#shipping-details-form-submit-button").click();
	
});
	
});

</script>


