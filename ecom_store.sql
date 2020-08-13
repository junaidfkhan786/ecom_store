-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2018 at 10:48 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `about_id` int(10) NOT NULL,
  `about_heading` text NOT NULL,
  `about_short_desc` text NOT NULL,
  `about_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`about_id`, `about_heading`, `about_short_desc`, `about_desc`) VALUES
(1, 'About Us Information', '\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,\r\n', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_country` text NOT NULL,
  `admin_job` varchar(255) NOT NULL,
  `admin_about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_contact`, `admin_country`, `admin_job`, `admin_about`) VALUES
(2, 'Karena Kapoor', 'karena@gmail.com', '$2y$10$ztCtuBOlr/z1D6XsfxvEC.sVuk/9Cp6.XNLmHVcsKURcBIeP1nZle', 'Kareena.jpg', '077885221', 'India', 'Fashion Designer', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical     '),
(5, 'Salman', 'salman@gmail.com', '$2y$10$NywGlHBV1Ajmvj7WxVhxZuOOgJQhLUlY5nhUS9dSf25JPou7dtL8m', 'Salman-2.jpg', '33456693', 'India', 'Actor', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical     '),
(6, 'Sonu', 'sonu@yahoo.com', '$2y$10$K8azgw10Om86a8swH6hNJOD8pvGh/46zq1V1k/arp46aWiqkzbb6W', 'khan-image.jpg', '03334566931', 'India', 'Actor', ' It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.');

-- --------------------------------------------------------

--
-- Table structure for table `boxes_section`
--

CREATE TABLE `boxes_section` (
  `box_id` int(10) NOT NULL,
  `box_title` text NOT NULL,
  `box_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `boxes_section`
--

INSERT INTO `boxes_section` (`box_id`, `box_title`, `box_desc`) VALUES
(2, 'BEST PRICES', 'You can check on all others sites about the prices and than compare with us.'),
(3, '100% SATISFACTION GUARANTEED From Us', 'Free returns on everything for 3 months. '),
(6, 'WE LOVE OUR CUSTOMERS', ' We are known to provide best possible service ever');

-- --------------------------------------------------------

--
-- Table structure for table `bundle_product_relation`
--

CREATE TABLE `bundle_product_relation` (
  `rel_id` int(10) NOT NULL,
  `rel_title` varchar(255) NOT NULL,
  `product_id` int(10) NOT NULL,
  `bundle_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bundle_product_relation`
--

INSERT INTO `bundle_product_relation` (`rel_id`, `rel_title`, `product_id`, `bundle_id`) VALUES
(8, 'jacket bundle relation -1', 4, 11),
(9, 'jacket bundle relation -2', 5, 11),
(10, 'jacket bundle relation -3', 6, 11);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `p_price` varchar(255) NOT NULL,
  `size` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `p_id`, `ip_add`, `qty`, `p_price`, `size`) VALUES
(4, 11, '::1', 2, '200', 'Extra Large'),
(5, 18, '::1', 2, '150', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` text NOT NULL,
  `cat_top` text NOT NULL,
  `cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `cat_top`, `cat_image`) VALUES
(2, 'Feminine', 'no', 'zinta_preity.jpg'),
(3, 'Kids', 'no', 'image10.jpg'),
(4, 'Others', 'yes', 'cat_image.jpg'),
(5, 'Men', 'yes', 'image11.jpg'),
(6, 'Antivirus', 'no', ''),
(7, 'Softwares', 'no', '');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_id` int(10) NOT NULL,
  `contact_email` text NOT NULL,
  `contact_heading` text NOT NULL,
  `contact_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`contact_id`, `contact_email`, `contact_heading`, `contact_desc`) VALUES
(1, 'sad.ahmed22224@gmail.com', 'Contact  To Us', 'If you have any questions, please feel free to contact us, our customer service center is working for you 24/7.');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(10) NOT NULL,
  `country_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`) VALUES
(1, 'Afghanistan'),
(2, 'Aland Islands'),
(3, 'Albania'),
(4, 'Algeria'),
(5, 'American Samoa'),
(6, 'Andorra'),
(7, 'Angola'),
(8, 'Anguilla'),
(9, 'Antarctica'),
(10, 'Antigua And Barbuda'),
(11, 'Argentina'),
(12, 'Armenia'),
(13, 'Aruba'),
(14, 'Australia'),
(15, 'Austria'),
(16, 'Azerbaijan'),
(17, 'Bahamas'),
(18, 'Bahrain'),
(19, 'Bangladesh'),
(20, 'Barbados'),
(21, 'Belarus'),
(22, 'Belgium'),
(23, 'Belize'),
(24, 'Benin'),
(25, 'Bermuda'),
(26, 'Bhutan'),
(27, 'Bolivia'),
(28, 'Bosnia And Herzegovina'),
(29, 'Botswana'),
(30, 'Bouvet Island'),
(31, 'Brazil'),
(32, 'British Indian Ocean Territory'),
(33, 'Brunei Darussalam'),
(34, 'Bulgaria'),
(35, 'Burkina Faso'),
(36, 'Burundi'),
(37, 'Cambodia'),
(38, 'Cameroon'),
(39, 'Canada'),
(40, 'Cape Verde'),
(41, 'Cayman Islands'),
(42, 'Central African Republic'),
(43, 'Chad'),
(44, 'Chile'),
(45, 'China'),
(46, 'Christmas Island'),
(47, 'Cocos (keeling) Islands'),
(48, 'Colombia'),
(49, 'Comoros'),
(50, 'Congo'),
(51, 'Congo, The Democratic Republic Of'),
(52, 'Cook Islands'),
(53, 'Costa Rica'),
(54, 'Cote D\'ivoire'),
(55, 'Croatia'),
(56, 'Cuba'),
(57, 'Cyprus'),
(58, 'Czech Republic'),
(59, 'Denmark'),
(60, 'Djibouti'),
(61, 'Dominica'),
(62, 'Dominican Republic'),
(63, 'Ecuador'),
(64, 'Egypt'),
(65, 'El Salvador'),
(66, 'Equatorial Guinea'),
(67, 'Eritrea'),
(68, 'Estonia'),
(69, 'Ethiopia'),
(70, 'Falkland Islands (malvinas)'),
(71, 'Faroe Islands'),
(72, 'Fiji'),
(73, 'Finland'),
(74, 'France'),
(75, 'French Guiana'),
(76, 'French Polynesia'),
(77, 'French Southern Territories'),
(78, 'Gabon'),
(79, 'Gambia'),
(80, 'Georgia'),
(81, 'Germany'),
(82, 'Ghana'),
(83, 'Gibraltar'),
(84, 'Greece'),
(85, 'Greenland'),
(86, 'Grenada'),
(87, 'Guadeloupe'),
(88, 'Guam'),
(89, 'Guatemala'),
(90, 'Guernsey'),
(91, 'Guinea'),
(92, 'Guinea-bissau'),
(93, 'Guyana'),
(94, 'Haiti'),
(95, 'Heard Island And Mcdonald Islands'),
(96, 'Holy See (vatican City State)'),
(97, 'Honduras'),
(98, 'Hong Kong'),
(99, 'Hungary'),
(100, 'Iceland'),
(101, 'India'),
(102, 'Indonesia'),
(103, 'Iran, Islamic Republic Of'),
(104, 'Iraq'),
(105, 'Ireland'),
(106, 'Isle Of Man'),
(107, 'Israel'),
(108, 'Italy'),
(109, 'Jamaica'),
(110, 'Japan'),
(111, 'Jersey'),
(112, 'Jordan'),
(113, 'Kazakhstan'),
(114, 'Kenya'),
(115, 'Kiribati'),
(116, 'Korea, Democratic People\'s Republic Of'),
(117, 'Korea, Republic Of'),
(118, 'Kuwait'),
(119, 'Kyrgyzstan'),
(120, 'Lao People\'s Democratic Republic'),
(121, 'Latvia'),
(122, 'Lebanon'),
(123, 'Lesotho'),
(124, 'Liberia'),
(125, 'Libyan Arab Jamahiriya'),
(126, 'Liechtenstein'),
(127, 'Lithuania'),
(128, 'Luxembourg'),
(129, 'Macao'),
(130, 'Macedonia, The Former Yugoslav Republic Of'),
(131, 'Madagascar'),
(132, 'Malawi'),
(133, 'Malaysia'),
(134, 'Maldives'),
(135, 'Mali'),
(136, 'Malta'),
(137, 'Marshall Islands'),
(138, 'Martinique'),
(139, 'Mauritania'),
(140, 'Mauritius'),
(141, 'Mayotte'),
(142, 'Mexico'),
(143, 'Micronesia, Federated States Of'),
(144, 'Moldova, Republic Of'),
(145, 'Monaco'),
(146, 'Mongolia'),
(147, 'Montserrat'),
(148, 'Morocco'),
(149, 'Mozambique'),
(150, 'Myanmar'),
(151, 'Namibia'),
(152, 'Nauru'),
(153, 'Nepal'),
(154, 'Netherlands'),
(155, 'Netherlands Antilles'),
(156, 'New Caledonia'),
(157, 'New Zealand'),
(158, 'Nicaragua'),
(159, 'Niger'),
(160, 'Nigeria'),
(161, 'Niue'),
(162, 'Norfolk Island'),
(163, 'Northern Mariana Islands'),
(164, 'Norway'),
(165, 'Oman'),
(166, 'Pakistan'),
(167, 'Palau'),
(168, 'Palestinian Territory, Occupied'),
(169, 'Panama'),
(170, 'Papua New Guinea'),
(171, 'Paraguay'),
(172, 'Peru'),
(173, 'Philippines'),
(174, 'Pitcairn'),
(175, 'Poland'),
(176, 'Portugal'),
(177, 'Puerto Rico'),
(178, 'Qatar'),
(179, 'Reunion'),
(180, 'Romania'),
(181, 'Russian Federation'),
(182, 'Rwanda'),
(183, 'Saint Helena'),
(184, 'Saint Kitts And Nevis'),
(185, 'Saint Lucia'),
(186, 'Saint Pierre And Miquelon'),
(187, 'Saint Vincent And The Grenadines'),
(188, 'Samoa'),
(189, 'San Marino'),
(190, 'Sao Tome And Principe'),
(191, 'Saudi Arabia'),
(192, 'Senegal'),
(193, 'Serbia And Montenegro'),
(194, 'Seychelles'),
(195, 'Sierra Leone'),
(196, 'Singapore'),
(197, 'Slovakia'),
(198, 'Slovenia'),
(199, 'Solomon Islands'),
(200, 'Somalia'),
(201, 'South Africa'),
(202, 'South Georgia And The South Sandwich Islands'),
(203, 'Spain'),
(204, 'Sri Lanka'),
(205, 'Sudan'),
(206, 'Suriname'),
(207, 'Svalbard And Jan Mayen'),
(208, 'Swaziland'),
(209, 'Sweden'),
(210, 'Switzerland'),
(211, 'Syrian Arab Republic'),
(212, 'Taiwan, Province Of China'),
(213, 'Tajikistan'),
(214, 'Tanzania, United Republic Of'),
(215, 'Thailand'),
(216, 'Timor-leste'),
(217, 'Togo'),
(218, 'Tokelau'),
(219, 'Tonga'),
(220, 'Trinidad And Tobago'),
(221, 'Tunisia'),
(222, 'Turkey'),
(223, 'Turkmenistan'),
(224, 'Turks And Caicos Islands'),
(225, 'Tuvalu'),
(226, 'Uganda'),
(227, 'Ukraine'),
(228, 'United Arab Emirates'),
(229, 'United Kingdom'),
(230, 'United States'),
(231, 'United States Minor Outlying Islands'),
(232, 'Uruguay'),
(233, 'Uzbekistan'),
(234, 'Vanuatu'),
(235, 'Venezuela'),
(236, 'Viet Nam'),
(237, 'Virgin Islands, British'),
(238, 'Virgin Islands, U.S.'),
(239, 'Wallis And Futuna'),
(240, 'Western Sahara'),
(242, 'Zambia'),
(243, 'Zimbabwe'),
(246, 'Myanmar'),
(247, 'Dominican Republic');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `coupon_title` varchar(255) NOT NULL,
  `coupon_price` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_limit` int(100) NOT NULL,
  `coupon_used` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `product_id`, `coupon_title`, `coupon_price`, `coupon_code`, `coupon_limit`, `coupon_used`) VALUES
(3, 9, 'Remind T-shirt', '40', '333444', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(255) NOT NULL,
  `customer_country` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(255) NOT NULL,
  `customer_confirm_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`, `customer_confirm_code`) VALUES
(2, 'Brock Lesnar', 'brock@gmail.com', '$2y$10$Z2YWVZl25fZHOI9smeBYhem1psToKPEtGzkI8PaW8pByFLTusF.Qa', 'America', 'New York', '0092334566931', 'new york', 'Brock-Lesnar.jpg', '::1', ''),
(5, 'Saad Ahmed', 'rasheed23@yahoo.com', '$2y$10$JYQD.o1glLMyOBkok/LxVefnnjSaoeW/SRC3LvegvxAPjxKuzW7tq', 'Pakistan', 'Lahore', '03334566931', 'House#2/10,Halqa Iqbal,Darul, Nasir Gharbi Rabwah, Chenab Nagar Rabwah', 'saad-ahmed.jpg', '::1', ''),
(6, ' John Cena', 'john-cena@gmail.com', '$2y$10$SJKqDPXYd7V7uGV5SSxbh.EpU8qgYh3qYe3sRhIIoZ5BmZ9RcpxQa', 'United States', 'LOS ANGELES', ' 404-380-8265', '1814 Quiet Valley Lane', 'john-cena.jpg', '::1', '1350760143');

-- --------------------------------------------------------

--
-- Table structure for table `customers_addresses`
--

CREATE TABLE `customers_addresses` (
  `address_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `billing_first_name` text NOT NULL,
  `billing_last_name` text NOT NULL,
  `billing_country` text NOT NULL,
  `billing_address_1` text NOT NULL,
  `billing_address_2` text NOT NULL,
  `billing_state` text NOT NULL,
  `billing_city` text NOT NULL,
  `billing_postcode` text NOT NULL,
  `shipping_first_name` text NOT NULL,
  `shipping_last_name` text NOT NULL,
  `shipping_country` text NOT NULL,
  `shipping_address_1` text NOT NULL,
  `shipping_address_2` text NOT NULL,
  `shipping_state` text NOT NULL,
  `shipping_city` text NOT NULL,
  `shipping_postcode` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers_addresses`
--

INSERT INTO `customers_addresses` (`address_id`, `customer_id`, `billing_first_name`, `billing_last_name`, `billing_country`, `billing_address_1`, `billing_address_2`, `billing_state`, `billing_city`, `billing_postcode`, `shipping_first_name`, `shipping_last_name`, `shipping_country`, `shipping_address_1`, `shipping_address_2`, `shipping_state`, `shipping_city`, `shipping_postcode`) VALUES
(1, 5, 'Saad', 'Nawaz', '166', 'House#2/10,Halqa Iqbal,Darul, Nasir Gharbi Rabwah', 'Chenab Nagar Rabwah', 'Punjab', 'Lahore', '54600', 'Saad', 'Nawaz', '166', 'Gulberg Boulevard to Jail Road', 'House #4/6, Green Town', 'Punjab', 'Lahore', '53720'),
(2, 6, 'John', 'Cena', '230', '3560 Powder House Road', '', 'California', 'LOS ANGELES', '90001', 'John', 'Cena', '230', '1814 Quiet Valley Lane', '', 'California', 'LOS ANGELES', ' 90071');

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE `downloads` (
  `download_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `download_title` text NOT NULL,
  `download_file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `downloads`
--

INSERT INTO `downloads` (`download_id`, `product_id`, `download_title`, `download_file`) VALUES
(2, 13, 'Avast Internet Security Download', 'Avast Internet Security Download.txt'),
(3, 14, 'Microsoft Office Download', 'Microsoft Office Download.docx'),
(4, 16, 'Corel VideoStudio Ultimate X10', 'Corel VideoStudio Ultimate Download.zip'),
(5, 17, 'Adobe Photoshop CC 2018 Download', 'Adobe Photoshop CC 2018 Download.pptx');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_types`
--

CREATE TABLE `enquiry_types` (
  `enquiry_id` int(10) NOT NULL,
  `enquiry_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry_types`
--

INSERT INTO `enquiry_types` (`enquiry_id`, `enquiry_title`) VALUES
(1, 'Order and Delivery Support'),
(2, 'Technical Support'),
(3, 'Price Concern');

-- --------------------------------------------------------

--
-- Table structure for table `hide_admin_orders`
--

CREATE TABLE `hide_admin_orders` (
  `hide_id` int(10) NOT NULL,
  `admin_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE `icons` (
  `icon_id` int(10) NOT NULL,
  `icon_product` int(10) NOT NULL,
  `icon_title` varchar(255) NOT NULL,
  `icon_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`icon_id`, `icon_product`, `icon_title`, `icon_image`) VALUES
(1, 1, 'statue', 'icon image.jpg'),
(2, 2, 'Icon-2', 'icon-2.png'),
(3, 3, 'Icon-3', 'icon-3.png'),
(4, 4, 'Icon-4', 'icon-4.jpg'),
(5, 3, 'dummy', 'icon image.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `manufacturer_id` int(10) NOT NULL,
  `manufacturer_title` text NOT NULL,
  `manufacturer_top` text NOT NULL,
  `manufacturer_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturer_id`, `manufacturer_title`, `manufacturer_top`, `manufacturer_image`) VALUES
(2, 'Amir Khan', 'no', 'image2.jpg'),
(3, 'Omri Liba', 'no', 'image3.jpg'),
(4, 'Joy Peng', 'no', 'manufacturer.jpg'),
(5, 'Kane Bender', 'no', 'image6.jpg'),
(6, 'Akshay Kumar', 'yes', 'akshay-kumar.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `shipping_type` text NOT NULL,
  `shipping_cost` decimal(10,1) NOT NULL,
  `payment_method` text NOT NULL,
  `order_date` text NOT NULL,
  `order_total` decimal(10,1) NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `invoice_no`, `shipping_type`, `shipping_cost`, `payment_method`, `order_date`, `order_total`, `order_status`) VALUES
(1, 5, 1649986913, 'Next Day (orders placed before 7pm)', '45.0', 'pay offline', 'April 15, 2018 02:29', '840.0', 'completed'),
(2, 5, 1039465674, 'Next Day (orders placed before 7pm)', '30.0', 'stripe', 'April 15, 2018 02:48', '588.0', 'processing'),
(3, 5, 479982944, 'Next Day (orders placed before 7pm)', '45.0', 'paypal', 'April 15, 2018 03:09', '705.0', 'pending'),
(4, 5, 1295279799, 'Standard 3-5 days', '6.0', 'pay offline', 'April 20, 2018 11:19', '163.0', 'pending'),
(5, 5, 1251904062, '', '0.0', 'stripe', 'April 20, 2018 11:20', '150.0', 'processing');

-- --------------------------------------------------------

--
-- Table structure for table `orders_addresses`
--

CREATE TABLE `orders_addresses` (
  `address_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `billing_first_name` text NOT NULL,
  `billing_last_name` text NOT NULL,
  `billing_country` text NOT NULL,
  `billing_address_1` text NOT NULL,
  `billing_address_2` text NOT NULL,
  `billing_state` text NOT NULL,
  `billing_city` text NOT NULL,
  `billing_postcode` text NOT NULL,
  `is_shipping_address_same` text NOT NULL,
  `shipping_first_name` text NOT NULL,
  `shipping_last_name` text NOT NULL,
  `shipping_country` text NOT NULL,
  `shipping_address_1` text NOT NULL,
  `shipping_address_2` text NOT NULL,
  `shipping_state` text NOT NULL,
  `shipping_city` text NOT NULL,
  `shipping_postcode` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_addresses`
--

INSERT INTO `orders_addresses` (`address_id`, `order_id`, `billing_first_name`, `billing_last_name`, `billing_country`, `billing_address_1`, `billing_address_2`, `billing_state`, `billing_city`, `billing_postcode`, `is_shipping_address_same`, `shipping_first_name`, `shipping_last_name`, `shipping_country`, `shipping_address_1`, `shipping_address_2`, `shipping_state`, `shipping_city`, `shipping_postcode`) VALUES
(1, 1, 'Saad', 'Ahmed', '166', 'House#2/10,Halqa Iqbal,Darul, Nasir Gharbi Rabwah', 'Chenab Nagar Rabwah', 'Punjab', 'Lahore', '54600', 'yes', '', '', '', '', '', '', '', 0),
(2, 2, 'Saad', 'Ahmed', '166', 'House#2/10,Halqa Iqbal,Darul, Nasir Gharbi Rabwah', 'Chenab Nagar Rabwah', 'Punjab', 'Lahore', '54600', 'yes', '', '', '', '', '', '', '', 0),
(3, 3, 'Saad', 'Ahmed', '166', 'House#2/10,Halqa Iqbal,Darul, Nasir Gharbi Rabwah', 'Chenab Nagar Rabwah', 'Punjab', 'Lahore', '54600', 'no', 'Saad', 'Nawaz', '166', 'Gulberg Boulevard to Jail Road', 'House #4/6, Fawara Chowk', 'Punjab', 'Lahore', 53720),
(4, 4, 'Saad', 'Ahmed', '166', 'House#2/10,Halqa Iqbal,Darul, Nasir Gharbi Rabwah', 'Chenab Nagar Rabwah', 'Punjab', 'Lahore', '54600', 'no', 'Saad', 'Ahmed', '166', 'Gulberg Boulevard to Jail Road', 'House #4/6, Fawara Chowk', 'Punjab', 'Lahore', 53720),
(5, 5, 'Saad', 'Ahmed', '166', 'House#2/10,Halqa Iqbal,Darul, Nasir Gharbi Rabwah', 'Chenab Nagar Rabwah', 'Punjab', 'Lahore', '54600', 'none', '', '', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders_items`
--

CREATE TABLE `orders_items` (
  `item_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `price` decimal(10,1) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_items`
--

INSERT INTO `orders_items` (`item_id`, `order_id`, `product_id`, `price`, `qty`, `size`) VALUES
(1, 1, 16, '79.0', 5, 'None'),
(2, 1, 11, '200.0', 2, 'Large'),
(3, 2, 17, '129.0', 2, 'None'),
(4, 2, 7, '150.0', 2, 'Extra Large'),
(5, 3, 14, '130.0', 2, 'None'),
(6, 3, 11, '200.0', 2, 'Extra Large'),
(7, 4, 13, '59.0', 1, 'None'),
(8, 4, 3, '98.0', 1, 'Extra Large'),
(9, 5, 18, '150.0', 1, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` decimal(10,1) NOT NULL,
  `payment_mode` text NOT NULL,
  `ref_no` int(10) NOT NULL,
  `code` int(10) NOT NULL,
  `payment_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_no`, `amount`, `payment_mode`, `ref_no`, `code`, `payment_date`) VALUES
(2, 1607603019, '447.0', 'UBL/Omni Paisa', 5678, 33, '11/1/2016'),
(3, 314788500, '345.0', 'UBL/Omni Paisa', 443, 865, '11/1/2016'),
(4, 1649986913, '840.0', 'Bank Code', 665635, 677366, 'April 19, 2018');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `p_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `manufacturer_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_title` text NOT NULL,
  `product_seo_desc` text NOT NULL,
  `product_url` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_psp_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_features` text NOT NULL,
  `product_video` text NOT NULL,
  `product_keywords` text NOT NULL,
  `product_label` text NOT NULL,
  `product_type` text NOT NULL,
  `product_weight` decimal(10,1) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `p_cat_id`, `cat_id`, `manufacturer_id`, `date`, `product_title`, `product_seo_desc`, `product_url`, `product_img1`, `product_img2`, `product_img3`, `product_price`, `product_psp_price`, `product_desc`, `product_features`, `product_video`, `product_keywords`, `product_label`, `product_type`, `product_weight`, `status`) VALUES
(1, 5, 4, 3, '2018-02-20 05:41:59', 'New T-Shirt', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'new-t-shirt', 'img1.jpg', 'img2.jpg', 'img3.jpg', 70, 50, '<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla</p>', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,</p>', '\r\n<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/BxjtpdWeGtI\" frameborder=\"0\" allowfullscreen></iframe>\r\n', 'T-Shirts', 'Sale', 'physical_product', '1.2', 'product'),
(2, 5, 3, 2, '2018-02-20 05:44:43', 'U.S. Polo Assn. Blue Polos shirt', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'product-url-2', 'U-S--Polo-Assn--Blue-Polos-0266-586842-1-pdp_slider_l.jpg', 'U-S--Polo-Assn--Blue-Polos-0268-586842-2-pdp_slider_l.jpg', 'U-S--Polo-Assn--Blue-Polos-0271-586842-3-pdp_slider_l.jpg', 69, 45, '<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.</p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>', 'T-Shirt', 'Gift', 'physical_product', '1.3', 'product'),
(3, 5, 3, 6, '2018-02-20 05:44:53', 'BENETTON White Polo Shirt', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'product-url-3', 'United-Colors-of-Benetton-White-Polo-Shirt-0608-0914361-1-pdp_slider_l.jpg', 'United-Colors-of-Benetton-White-Polo-Shirt-0608-0914361-2-pdp_slider_l.jpg', 'United-Colors-of-Benetton-White-Polo-Shirt-0609-0914361-3-pdp_slider_l.jpg', 98, 0, '<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla</p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>', 'T-Shirt', 'New', 'physical_product', '2.0', 'product'),
(4, 7, 5, 5, '2018-02-20 05:45:03', 'Navy Blue Solid Denim Jacket', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'product-url-4', 'Levi-s-Blue-Solid-Denim-Jacket-5953-6506172-1-pdp_slider_l.jpg', 'Levi-s-Blue-Solid-Denim-Jacket-5953-6506172-2-pdp_slider_l.jpg', 'Levi-s-Blue-Solid-Denim-Jacket-5953-6506172-3-pdp_slider_l.jpg', 230, 150, '<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.</p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>', 'Jackets', 'Sale', 'physical_product', '1.6', 'product'),
(5, 7, 5, 5, '2018-02-20 05:45:21', 'Denim Borg Lined Western Jacket', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'product-url-5', 'Next-Denim-Borg-Lined-Western-Jacket-0463-0064553-1-pdp_slider_l.jpg', 'Next-Denim-Borg-Lined-Western-Jacket-0463-0064553-2-pdp_slider_l.jpg', 'Next-Denim-Borg-Lined-Western-Jacket-0465-0064553-3-pdp_slider_l.jpg', 259, 100, '<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.</p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>', 'Jackets', 'Gift', 'physical_product', '2.2', 'product'),
(6, 7, 5, 5, '2018-02-20 05:45:38', 'Jack & White Solid Denim Jacket', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'product-url-6', 'Jack---Jones-White-Solid-Denim-Jacket-3115-5549091-1-pdp_slider_l.jpg', 'Jack---Jones-White-Solid-Denim-Jacket-3115-5549091-2-pdp_slider_l.jpg', 'Jack---Jones-White-Solid-Denim-Jacket-3115-5549091-3-pdp_slider_l.jpg', 96, 0, '<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.</p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>', 'Jackets', 'New', 'physical_product', '2.6', 'product'),
(7, 4, 2, 6, '2018-02-20 05:45:49', 'Nice Solid Long Coat With Lace', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'product-url-7', 'fur coat with button1.jpg', 'fur coat with button2.jpg', 'fur coat with button3.jpg', 200, 150, '<p>Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document. kingVideo provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document</p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>', 'Coats', 'Sale', 'physical_product', '3.0', 'product'),
(8, 4, 2, 4, '2018-02-20 05:45:54', 'Sleeveless Faux Fur Hybrid Coat', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'product-url-8', 'Black Blouse Versace Coat1.jpg', 'Black Blouse Versace Coat2.jpg', 'Black Blouse Versace Coat3.jpg', 245, 100, '<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.</p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>', 'Coats', 'Gift', 'physical_product', '2.7', 'product'),
(9, 5, 4, 2, '2018-02-20 05:46:14', 'Remind Printed T-Shirt', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'product-url-9', 'product-1.jpg', 'product-2.jpg', 'product-3.jpg', 50, 0, '<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.</p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,', '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>', 'T-Shirt', 'New', 'physical_product', '1.1', 'product'),
(11, 7, 5, 5, '2018-02-20 05:49:28', 'Solid Navy Denim Jackets Bundle', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'jacket-bundle', 'jacket-1.jpg', 'jacket-2.jpg', 'jacket-3.jpg', 300, 200, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>', '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qImi3vNccaU\" frameborder=\"0\" allowfullscreen></iframe>', 'jacket bundle', 'Sale', 'physical_product', '4.5', 'bundle'),
(13, 8, 6, 5, '2018-04-20 06:18:08', 'Avast Internet Security 2018 (1 PC, 1 Year) [Download]', 'Avast is the best security software of this modern age which protects your computer from malwares.', 'avast-internet-security', 'avast-1.jpg', 'avast-2.png', 'avast-3.png', 59, 49, '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters</p>', '', '\r\n\r\n\r\n\r\n', 'avast antivirus', 'Software', 'digital_product', '0.0', 'product'),
(14, 8, 6, 2, '2018-02-15 22:38:29', 'Microsoft Office Professional 2016 Download', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'microsoft-office-professional-2016', 'microsft-office.jpg', 'microsft-office-2.jpg', 'microsft-office-3.jpg', 130, 0, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '', '', 'windows,software', 'Software', 'digital_product', '0.0', 'product'),
(16, 8, 6, 4, '2018-02-15 22:38:07', 'Corel VideoStudio Ultimate X10', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'corel-video-studio-ultimate-x10', 'corel video-1.jpg', 'corel video-2.jpg', 'corel video-3.jpg', 79, 0, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '', '', 'corel,software', 'Software', 'digital_product', '0.0', 'product'),
(17, 8, 6, 4, '2018-02-15 22:38:00', 'Adobe Photoshop CC 2018 | 12 Month Subscription (Download)', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'adobe-photoshop-cc-2018', 'photoshop-cc.jpg', 'photoshop-cc-2.jpg', 'photoshop-3.png', 129, 0, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '', '', 'adobe,software', 'Software', 'digital_product', '0.0', 'product'),
(18, 8, 7, 4, '2018-02-20 07:24:21', ' Digital Premium Softwares Bundle', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', 'digital-premium-softwares-bundle', 'digital-bundle-1.jpg', 'digital-bundle-2.jpg', 'digital-bundle-3.jpg', 150, 99, '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters</p>', '', '\r\n\r\n\r\n\r\n', 'avast,corel,adobe,office pro 2016', 'Bundle', 'digital_product', '0.0', 'bundle'),
(21, 8, 7, 5, '2018-04-22 07:40:25', 'Cyberlink PowerDirector 16 Pro', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'cyberlink-powerdirector-16-ultimate', 'cyberlink powerdirector.jpg', '', '', 60, 50, '<p>Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.</p>', '', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'cyberlink', '', 'digital_product', '0.0', 'product');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL,
  `p_cat_title` text NOT NULL,
  `p_cat_top` text NOT NULL,
  `p_cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_top`, `p_cat_image`) VALUES
(4, 'Coats', 'no', 'image3.jpg'),
(5, 'T-Shirts', 'no', 'image2.jpg'),
(6, 'Sweater', 'no', 'sweater.jpg'),
(7, 'jackets', 'yes', 'jacket.jpg'),
(8, 'Microsoft Windows', 'yes', '');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(10) NOT NULL,
  `service_title` varchar(255) NOT NULL,
  `service_image` varchar(255) NOT NULL,
  `service_desc` text NOT NULL,
  `service_button` varchar(255) NOT NULL,
  `service_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_title`, `service_image`, `service_desc`, `service_button`, `service_url`) VALUES
(4, 'Gift Package ', 'service-1.jpg', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', 'Contact For Details and Rates', 'http://www.computerfever.com'),
(5, 'Love Surprisre', 'service-2.jpg', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', 'Contact For Details and Rates', 'http://www.computerfever.com'),
(6, 'Wedding Package', 'service-3.jpg', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', 'Contact For Details and Rates', 'http://www.computerfever.com');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` int(10) NOT NULL,
  `shipping_type` int(10) NOT NULL,
  `shipping_zone` int(10) NOT NULL,
  `shipping_country` int(10) NOT NULL,
  `shipping_weight` decimal(10,1) NOT NULL,
  `shipping_cost` decimal(10,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`shipping_id`, `shipping_type`, `shipping_zone`, `shipping_country`, `shipping_weight`, `shipping_cost`) VALUES
(1, 4, 5, 0, '1.0', '3.0'),
(3, 4, 5, 0, '1.5', '4.5'),
(4, 4, 5, 0, '2.0', '6.0'),
(5, 4, 5, 0, '2.5', '7.5'),
(6, 4, 5, 0, '3.0', '9.0'),
(7, 4, 5, 0, '3.5', '10.5'),
(8, 4, 5, 0, '4.0', '12.0'),
(9, 4, 5, 0, '4.5', '13.5'),
(14, 4, 5, 0, '6.0', '18.0'),
(15, 4, 5, 0, '6.5', '19.5'),
(16, 4, 5, 0, '7.0', '21.0'),
(17, 4, 5, 0, '7.5', '22.5'),
(18, 4, 5, 0, '8.0', '24.0'),
(19, 4, 5, 0, '8.5', '25.5'),
(20, 4, 5, 0, '9.0', '27.0'),
(21, 4, 5, 0, '9.5', '28.5'),
(22, 4, 5, 0, '10.0', '30.0'),
(23, 4, 5, 0, '5.0', '15.0'),
(24, 4, 5, 0, '5.5', '16.5'),
(25, 3, 5, 0, '1.0', '4.0'),
(26, 3, 5, 0, '1.5', '6.0'),
(27, 3, 5, 0, '2.0', '8.0'),
(28, 3, 5, 0, '2.5', '10.0'),
(29, 3, 5, 0, '3.0', '12.0'),
(30, 3, 5, 0, '3.5', '14.0'),
(31, 3, 5, 0, '4.0', '16.0'),
(32, 3, 5, 0, '4.5', '18.0'),
(33, 3, 5, 0, '6.0', '24.0'),
(34, 3, 5, 0, '6.5', '26.0'),
(35, 3, 5, 0, '7.0', '28.0'),
(36, 3, 5, 0, '7.5', '30.0'),
(37, 3, 5, 0, '8.0', '32.0'),
(38, 3, 5, 0, '8.5', '34.0'),
(39, 3, 5, 0, '9.0', '36.0'),
(40, 3, 5, 0, '9.5', '38.0'),
(41, 3, 5, 0, '10.0', '40.0'),
(42, 1, 5, 0, '1.0', '5.0'),
(43, 1, 5, 0, '1.5', '7.5'),
(44, 1, 5, 0, '2.0', '10.0'),
(45, 1, 5, 0, '2.5', '12.5'),
(46, 1, 5, 0, '3.0', '15.0'),
(47, 1, 5, 0, '3.5', '17.5'),
(48, 4, 5, 0, '4.0', '20.0'),
(49, 1, 5, 0, '4.5', '22.5'),
(50, 1, 5, 0, '5.0', '25.0'),
(51, 1, 5, 0, '5.5', '27.5'),
(52, 1, 5, 0, '6.0', '30.0'),
(53, 1, 5, 0, '6.5', '32.5'),
(54, 1, 5, 0, '7.0', '35.0'),
(55, 1, 5, 0, '7.5', '37.5'),
(56, 1, 5, 0, '8.0', '40.0'),
(57, 1, 5, 0, '8.5', '42.5'),
(58, 1, 5, 0, '9.0', '45.0'),
(59, 1, 5, 0, '9.5', '47.5'),
(60, 1, 5, 0, '10.0', '50.0'),
(61, 7, 0, 230, '1.0', '5.0'),
(62, 7, 0, 230, '1.5', '7.5'),
(64, 7, 0, 230, '2.5', '12.5'),
(65, 7, 0, 230, '3.0', '15.0'),
(66, 7, 0, 230, '3.5', '17.5'),
(67, 7, 0, 230, '4.5', '22.5'),
(68, 7, 0, 230, '5.0', '25.0'),
(69, 7, 0, 230, '5.5', '27.5'),
(70, 7, 0, 230, '6.0', '30.0'),
(71, 7, 0, 230, '6.5', '32.5'),
(72, 7, 0, 230, '7.0', '35.0'),
(73, 7, 0, 230, '7.5', '37.5'),
(74, 7, 0, 230, '8.0', '40.0'),
(75, 7, 0, 230, '8.5', '42.5'),
(76, 7, 0, 230, '9.0', '45.0'),
(77, 7, 0, 230, '9.5', '47.5'),
(78, 7, 0, 230, '10.0', '50.0'),
(79, 7, 0, 230, '2.0', '10.0'),
(80, 6, 0, 230, '1.0', '10.0'),
(81, 6, 0, 230, '1.5', '15.0'),
(82, 6, 0, 230, '2.0', '20.0'),
(83, 6, 0, 230, '2.5', '25.0'),
(84, 6, 0, 230, '3.0', '30.0'),
(85, 6, 0, 230, '3.5', '35.0'),
(86, 6, 0, 230, '4.5', '45.0'),
(87, 6, 0, 230, '5.0', '50.0'),
(88, 6, 0, 230, '5.5', '55.0'),
(89, 6, 0, 230, '6.0', '60.0'),
(90, 6, 0, 230, '6.5', '65.0'),
(91, 6, 0, 230, '7.0', '70.0'),
(92, 6, 0, 230, '7.5', '75.0'),
(93, 6, 0, 230, '8.0', '80.0'),
(94, 6, 0, 230, '8.5', '85.0'),
(95, 6, 0, 230, '9.0', '90.0'),
(96, 6, 0, 230, '9.5', '95.0'),
(97, 6, 0, 230, '10.0', '100.0'),
(98, 1, 5, 0, '4.0', '20.0'),
(99, 6, 0, 230, '4.0', '40.0'),
(100, 7, 0, 230, '4.0', '20.0');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `type_id` int(10) NOT NULL,
  `type_name` text NOT NULL,
  `type_default` text NOT NULL,
  `type_local` text NOT NULL,
  `type_order` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping_types`
--

INSERT INTO `shipping_types` (`type_id`, `type_name`, `type_default`, `type_local`, `type_order`) VALUES
(1, 'Next Day (orders placed before 7pm)', 'yes', 'yes', 1),
(3, ' Speedy 1-2 days', 'no', 'yes', 2),
(4, 'Standard 3-5 days', 'no', 'yes', 3),
(6, 'Express International', 'yes', 'no', 1),
(7, 'Standard International', 'no', 'no', 2);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slide_id` int(10) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_image` text NOT NULL,
  `slide_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slide_id`, `slide_name`, `slide_image`, `slide_url`) VALUES
(1, 'Slide Number 1', '1.jpg', 'http://localhost/Ecom_store/shop.php'),
(2, 'Slide Number 2', '2.jpg', 'htttp://www.computerfever.com/services'),
(3, 'Slide Number 3', '3.jpg', 'http://urdustories.computerfever.com'),
(7, 'Slide Number 4', 'slide-5.jpg', 'http://www.computerfever.com');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` int(10) NOT NULL,
  `term_title` varchar(100) NOT NULL,
  `term_link` varchar(100) NOT NULL,
  `term_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_title`, `term_link`, `term_desc`) VALUES
(1, 'Rules And Regulations', 'rules', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.&nbsp;</p>'),
(2, 'Refund Policy', 'link2', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on'),
(3, 'Pricing and Promotions Policy', 'link3', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `customer_id`, `product_id`) VALUES
(2, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `zone_id` int(10) NOT NULL,
  `zone_name` text NOT NULL,
  `zone_order` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `zone_name`, `zone_order`) VALUES
(5, 'Pakistan Lahore Zone', 1),
(6, 'India Delhi Zone', 2),
(7, 'Europe Zone', 3);

-- --------------------------------------------------------

--
-- Table structure for table `zones_locations`
--

CREATE TABLE `zones_locations` (
  `location_id` int(10) NOT NULL,
  `zone_id` int(10) NOT NULL,
  `location_code` text NOT NULL,
  `location_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zones_locations`
--

INSERT INTO `zones_locations` (`location_id`, `zone_id`, `location_code`, `location_type`) VALUES
(19, 6, '101', 'country'),
(20, 6, '110003', 'postcode'),
(21, 6, '110055', 'postcode'),
(22, 6, '110011', 'postcode'),
(23, 6, '110026', 'postcode'),
(24, 7, '74', 'country'),
(25, 7, '154', 'country'),
(26, 7, '229', 'country'),
(68, 5, '166', 'country'),
(69, 5, '54000', 'postcode'),
(70, 5, '54600', 'postcode'),
(71, 5, '53720', 'postcode');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `boxes_section`
--
ALTER TABLE `boxes_section`
  ADD PRIMARY KEY (`box_id`);

--
-- Indexes for table `bundle_product_relation`
--
ALTER TABLE `bundle_product_relation`
  ADD PRIMARY KEY (`rel_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customers_addresses`
--
ALTER TABLE `customers_addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `enquiry_types`
--
ALTER TABLE `enquiry_types`
  ADD PRIMARY KEY (`enquiry_id`);

--
-- Indexes for table `hide_admin_orders`
--
ALTER TABLE `hide_admin_orders`
  ADD PRIMARY KEY (`hide_id`);

--
-- Indexes for table `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`icon_id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_addresses`
--
ALTER TABLE `orders_addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `orders_items`
--
ALTER TABLE `orders_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`p_cat_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `zones_locations`
--
ALTER TABLE `zones_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `about_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `boxes_section`
--
ALTER TABLE `boxes_section`
  MODIFY `box_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bundle_product_relation`
--
ALTER TABLE `bundle_product_relation`
  MODIFY `rel_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `contact_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers_addresses`
--
ALTER TABLE `customers_addresses`
  MODIFY `address_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `download_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enquiry_types`
--
ALTER TABLE `enquiry_types`
  MODIFY `enquiry_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hide_admin_orders`
--
ALTER TABLE `hide_admin_orders`
  MODIFY `hide_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `icon_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `manufacturer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders_addresses`
--
ALTER TABLE `orders_addresses`
  MODIFY `address_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders_items`
--
ALTER TABLE `orders_items`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `p_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `shipping_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slide_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `zones_locations`
--
ALTER TABLE `zones_locations`
  MODIFY `location_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
