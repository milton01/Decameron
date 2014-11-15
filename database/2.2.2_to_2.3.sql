CREATE TABLE IF NOT EXISTS `decameron_stock_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `decameron_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`location_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

ALTER TABLE decameron_inventory
 ADD COLUMN trans_location int(11) NOT NULL,
 ADD KEY `trans_location` (`trans_location`),
 ADD CONSTRAINT `decameron_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `decameron_stock_locations` (`location_id`); 

-- ALTER TABLE decameron_items DROP COLUMN location;

INSERT INTO `decameron_stock_locations` ( `deleted`, `location_name` ) VALUES ('0', 'stock');

ALTER TABLE decameron_receivings_items
 ADD COLUMN item_location int(11) NOT NULL,
 ADD KEY `item_location` (`item_location`),
 ADD CONSTRAINT `decameron_receivings_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `decameron_stock_locations` (`location_id`);
 

ALTER TABLE decameron_sales_items
 ADD COLUMN item_location int(11) NOT NULL,
 ADD KEY `item_location` (`item_location`),
 ADD KEY `sale_id` (`sale_id`),
 ADD CONSTRAINT `decameron_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `decameron_stock_locations` (`location_id`);

ALTER TABLE decameron_sales_items_taxes
 ADD KEY `sale_id` (`sale_id`);

ALTER TABLE decameron_sales_payments
 ADD KEY `sale_id` (`sale_id`);

ALTER TABLE decameron_sales_suspended_items
 ADD COLUMN item_location int(11) NOT NULL,
 ADD KEY `item_location` (`item_location`),
 ADD KEY `sale_id` (`sale_id`),
 ADD CONSTRAINT `decameron_sales_suspended_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `decameron_stock_locations` (`location_id`);

ALTER TABLE `decameron_item_quantities`
  ADD CONSTRAINT `decameron_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `decameron_items` (`item_id`),
  ADD CONSTRAINT `decameron_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `decameron_stock_locations` (`location_id`);

