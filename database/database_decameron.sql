-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2011 at 04:27 PM
-- Server version: 5.1.54
-- PHP Version: 5.3.3

--
-- Database: `decameron`
--

-- --------------------------------------------------------

--
-- Table structure for table `reser_app_config`
--

CREATE TABLE `reser_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_app_config`
--

INSERT INTO `reser_app_config` (`key`, `value`) VALUES
('address', '123 Nowhere street'),
('company', 'Hotel Decameron'),
('default_tax_rate', '8'),
('email', 'admin@pappastech.com'),
('fax', ''),
('phone', '555-555-5555'),
('return_policy', 'Test'),
('timezone', 'America/New_York'),
('website', '');

-- --------------------------------------------------------

--
-- Table structure for table `reser_customers`
--

CREATE TABLE `reser_customers` (
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_customers`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_employees`
--

CREATE TABLE `reser_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_employees`
--

INSERT INTO `reser_employees` (`username`, `password`, `person_id`, `deleted`) VALUES
('admin', '439a6de57d475c1a0ba9bcb1c39f0af6', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reser_giftcards`
--

CREATE TABLE `reser_giftcards` (
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_number` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` INT NOT NULL,
  PRIMARY KEY (`giftcard_id`),
  UNIQUE KEY `giftcard_number` (`giftcard_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=48 ;

--
-- Dumping data for table `reser_giftcards`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_inventory`
--

CREATE TABLE `reser_inventory` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_id`),
  KEY `trans_items` (`trans_items`),
  KEY `trans_user` (`trans_user`),
  KEY `trans_location` (`trans_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `reser_inventory`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_items`
--

CREATE TABLE `reser_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `quantity` decimal(15,2) NOT NULL DEFAULT '0.00',
  `reorder_level` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `custom1` VARCHAR(25) NOT NULL,
  `custom2` VARCHAR(25) NOT NULL,
  `custom3` VARCHAR(25) NOT NULL,
  `custom4` VARCHAR(25) NOT NULL,
  `custom5` VARCHAR(25) NOT NULL,
  `custom6` VARCHAR(25) NOT NULL,
  `custom7` VARCHAR(25) NOT NULL,
  `custom8` VARCHAR(25) NOT NULL,
  `custom9` VARCHAR(25) NOT NULL,
  `custom10` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_number` (`item_number`),
  KEY `reser_items_ibfk_1` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `reser_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_items_taxes`
--

CREATE TABLE `reser_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`item_id`,`name`,`percent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_items_taxes`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_item_kits`
--

CREATE TABLE `reser_item_kits` (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `reser_item_kits`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_item_kit_items`
--

CREATE TABLE `reser_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `reser_item_kit_items_ibfk_2` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_item_kit_items`
--

-- --------------------------------------------------------

--
-- Table structure for table `reser_item_quantities`
--

CREATE TABLE IF NOT EXISTS `reser_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`location_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `reser_modules`
--

CREATE TABLE `reser_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_modules`
--

INSERT INTO `reser_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_config', 'module_config_desc', 100, 'config'),
('module_customers', 'module_customers_desc', 10, 'customers'),
('module_employees', 'module_employees_desc', 80, 'employees'),
('module_giftcards', 'module_giftcards_desc', 90, 'giftcards'),
('module_items', 'module_items_desc', 20, 'items'),
('module_item_kits', 'module_item_kits_desc', 30, 'item_kits'),
('module_receivings', 'module_receivings_desc', 60, 'receivings'),
('module_reports', 'module_reports_desc', 50, 'reports'),
('module_sales', 'module_sales_desc', 70, 'sales'),
('module_suppliers', 'module_suppliers_desc', 40, 'suppliers');

-- --------------------------------------------------------

--
-- Table structure for table `reser_people`
--

CREATE TABLE `reser_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reser_people`
--

INSERT INTO `reser_people` (`first_name`, `last_name`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
('John', 'Doe', '555-555-5555', 'admin@pappastech.com', 'Address 1', '', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reser_permissions`
--

CREATE TABLE `reser_permissions` (
  `module_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`module_id`,`person_id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_permissions`
--

INSERT INTO `reser_permissions` (`module_id`, `person_id`) VALUES
('config', 1),
('customers', 1),
('employees', 1),
('giftcards', 1),
('items', 1),
('item_kits', 1),
('receivings', 1),
('reports', 1),
('sales', 1),
('suppliers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reser_receivings`
--

CREATE TABLE `reser_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `reser_receivings`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_receivings_items`
--

CREATE TABLE `reser_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_receivings_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_sales`
--

CREATE TABLE `reser_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `reser_sales`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_sales_items`
--

CREATE TABLE `reser_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `item_location` (`item_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_sales_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_sales_items_taxes`
--

CREATE TABLE `reser_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_sales_items_taxes`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_sales_payments`
--

CREATE TABLE `reser_sales_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`),
  KEY `sale_id` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_sales_payments`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_sales_suspended`
--

CREATE TABLE `reser_sales_suspended` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `reser_sales_suspended`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_sales_suspended_items`
--

CREATE TABLE `reser_sales_suspended_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_sales_suspended_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_sales_suspended_items_taxes`
--

CREATE TABLE `reser_sales_suspended_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_sales_suspended_items_taxes`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_sales_suspended_payments`
--

CREATE TABLE `reser_sales_suspended_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_sales_suspended_payments`
--


-- --------------------------------------------------------

--
-- Table structure for table `reser_sessions`
--

CREATE TABLE `reser_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_sessions`
--

-- --------------------------------------------------------

--
-- Table structure for table `reser_stock_locations`
--

CREATE TABLE `reser_stock_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8;

--
-- Dumping data for table `reser_stock_locations`
--

INSERT INTO `reser_stock_locations` ( `deleted`, `location_name` ) VALUES ('0', 'stock');

-- --------------------------------------------------------

--
-- Table structure for table `reser_suppliers`
--

CREATE TABLE `reser_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reser_suppliers`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `reser_customers`
--
ALTER TABLE `reser_customers`
  ADD CONSTRAINT `reser_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `reser_people` (`person_id`);

--
-- Constraints for table `reser_employees`
--
ALTER TABLE `reser_employees`
  ADD CONSTRAINT `reser_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `reser_people` (`person_id`);

--
-- Constraints for table `reser_inventory`
--
ALTER TABLE `reser_inventory`
  ADD CONSTRAINT `reser_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `reser_items` (`item_id`),
  ADD CONSTRAINT `reser_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `reser_employees` (`person_id`);

--
-- Constraints for table `reser_items`
--
ALTER TABLE `reser_items`
  ADD CONSTRAINT `reser_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `reser_suppliers` (`person_id`);

--
-- Constraints for table `reser_items_taxes`
--
ALTER TABLE `reser_items_taxes`
  ADD CONSTRAINT `reser_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `reser_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `reser_item_kit_items`
--
ALTER TABLE `reser_item_kit_items`
  ADD CONSTRAINT `reser_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `reser_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reser_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `reser_items` (`item_id`)  ON DELETE CASCADE;

--
-- Constraints for table `reser_permissions`
--
ALTER TABLE `reser_permissions`
  ADD CONSTRAINT `reser_permissions_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `reser_employees` (`person_id`),
  ADD CONSTRAINT `reser_permissions_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `reser_modules` (`module_id`);

--
-- Constraints for table `reser_receivings`
--
ALTER TABLE `reser_receivings`
  ADD CONSTRAINT `reser_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `reser_employees` (`person_id`),
  ADD CONSTRAINT `reser_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `reser_suppliers` (`person_id`);

--
-- Constraints for table `reser_receivings_items`
--
ALTER TABLE `reser_receivings_items`
  ADD CONSTRAINT `reser_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `reser_items` (`item_id`),
  ADD CONSTRAINT `reser_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `reser_receivings` (`receiving_id`);

--
-- Constraints for table `reser_sales`
--
ALTER TABLE `reser_sales`
  ADD CONSTRAINT `reser_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `reser_employees` (`person_id`),
  ADD CONSTRAINT `reser_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `reser_customers` (`person_id`);

--
-- Constraints for table `reser_sales_items`
--
ALTER TABLE `reser_sales_items`
  ADD CONSTRAINT `reser_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `reser_items` (`item_id`),
  ADD CONSTRAINT `reser_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `reser_sales` (`sale_id`),
  ADD CONSTRAINT `reser_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `reser_stock_locations` (`location_id`);

--
-- Constraints for table `reser_sales_items_taxes`
--
ALTER TABLE `reser_sales_items_taxes`
  ADD CONSTRAINT `reser_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `reser_sales_items` (`sale_id`),
  ADD CONSTRAINT `reser_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `reser_items` (`item_id`);

--
-- Constraints for table `reser_sales_payments`
--
ALTER TABLE `reser_sales_payments`
  ADD CONSTRAINT `reser_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `reser_sales` (`sale_id`);

--
-- Constraints for table `reser_sales_suspended`
--
ALTER TABLE `reser_sales_suspended`
  ADD CONSTRAINT `reser_sales_suspended_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `reser_employees` (`person_id`),
  ADD CONSTRAINT `reser_sales_suspended_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `reser_customers` (`person_id`);

--
-- Constraints for table `reser_sales_suspended_items`
--
ALTER TABLE `reser_sales_suspended_items`
  ADD CONSTRAINT `reser_sales_suspended_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `reser_items` (`item_id`),
  ADD CONSTRAINT `reser_sales_suspended_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `reser_sales_suspended` (`sale_id`),
  ADD CONSTRAINT `reser_sales_suspended_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `reser_stock_locations` (`location_id`);

--
-- Constraints for table `reser_sales_suspended_items_taxes`
--
ALTER TABLE `reser_sales_suspended_items_taxes`
  ADD CONSTRAINT `reser_sales_suspended_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `reser_sales_suspended_items` (`sale_id`),
  ADD CONSTRAINT `reser_sales_suspended_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `reser_items` (`item_id`);

--
-- Constraints for table `reser_sales_suspended_payments`
--
ALTER TABLE `reser_sales_suspended_payments`
  ADD CONSTRAINT `reser_sales_suspended_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `reser_sales_suspended` (`sale_id`);

--
-- Constraints for table `reser_item_quantities`
--
ALTER TABLE `reser_item_quantities`
  ADD CONSTRAINT `reser_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `reser_items` (`item_id`),
  ADD CONSTRAINT `reser_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `reser_stock_locations` (`location_id`);

--
-- Constraints for table `reser_suppliers`
--
ALTER TABLE `reser_suppliers`
  ADD CONSTRAINT `reser_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `reser_people` (`person_id`);