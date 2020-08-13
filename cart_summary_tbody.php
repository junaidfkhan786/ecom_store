<?php

session_start();

include("includes/db.php");

include("functions/functions.php");

?>

<?php

$total = 0;

$total_weight = 0;

$physical_products = array();

$ip_add = getRealUserIp();

$select_cart = "select * from cart where ip_add='$ip_add'";

$run_cart = mysqli_query($con,$select_cart);

$count = mysqli_num_rows($run_cart);

while($row_cart = mysqli_fetch_array($run_cart)){

$pro_id = $row_cart['p_id'];

$pro_size = $row_cart['size'];

$pro_qty = $row_cart['qty'];

$only_price = $row_cart['p_price'];

$get_products = "select * from products where product_id='$pro_id'";

$run_products = mysqli_query($con,$get_products);

while($row_products = mysqli_fetch_array($run_products)){

$product_title = $row_products['product_title'];

$product_img1 = $row_products['product_img1'];

$product_type = $row_products['product_type'];

$product_weight = $row_products['product_weight'];

$sub_total_weight = $product_weight * $pro_qty;

$total_weight += $sub_total_weight;

if($product_type == "physical_product" ){

array_push($physical_products, $pro_id);
	
	
}

$sub_total = $only_price*$pro_qty;

$_SESSION['pro_qty'] = $pro_qty;

$total += $sub_total;

}

}

?>


<tr>

<td> Order Subtotal </td>

<th> $<?php echo $total; ?>.00 </th>

</tr>

<?php if(count($physical_products) > 0){ ?>

<tr>

<th colspan="2">

<p class="shipping-header text-muted">

Cart Total Weight: <?php echo $total_weight; ?> Kg

</p>

<P class="shipping-header text-muted">

<I class="fa fa-truck"></i> Shipping:

</P>

<ul class="list-unstyled"><!-- ul list-unstyled Starts -->

<?php

if(isset($_SESSION['customer_email'])){

$customer_email = $_SESSION['customer_email'];

$get_customer = "select * from customers where customer_email='$customer_email'";

$run_customer = mysqli_query($con, $get_customer);

$row_customer = mysqli_fetch_array($run_customer);

$customer_id = $row_customer['customer_id'];

$select_customers_addresses = "select * from customers_addresses where customer_id='$customer_id'";

$run_customers_addresses = mysqli_query($con, $select_customers_addresses);

$row_customers_addresses = mysqli_fetch_array($run_customers_addresses);

$billing_country = $row_customers_addresses['billing_country'];

$billing_postcode = $row_customers_addresses['billing_postcode'];

$shipping_country = $row_customers_addresses['shipping_country'];

$shipping_postcode = $row_customers_addresses['shipping_postcode'];

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

}else{
	
echo "

<li>

<p> Please login to view the available shipping types, or contact us if you need any help. </p>

</li>

";
	
}


?>

</ul><!-- ul list-unstyled Ends -->

</th>

</tr>

<?php 

$total_cart_price = $total + @$_SESSION["shipping_cost"];

} 

?>

<tr>

<td>Tax</td>

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

<script>

$(document).ready(function(){
	
	
<?php if(count($physical_products) > 0){ ?>

$(document).on("change", ".shipping_type", function(){
	
var shipping_cost = Number($(this).data("shipping_cost"));

var total = Number(<?php echo $total; ?>);

var total_cart_price = total + shipping_cost;

$(".total-cart-price").html("$" + total_cart_price + ".00");
	
});

<?php } ?>
	
});

</script>
