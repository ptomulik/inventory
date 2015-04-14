-- MySQL dump 10.13  Distrib 5.5.42, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: inventory
-- ------------------------------------------------------
-- Server version	5.5.42-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agreements`
--

DROP TABLE IF EXISTS `agreements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agreements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Main Key',
  `agreement_id` varchar(100) COLLATE utf8_polish_ci NOT NULL COMMENT 'Agreement Identifier',
  `agreement_date` date NOT NULL COMMENT 'Agreement Date',
  `agreement_subject` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'Agreement Subject',
  `agreement_file` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `agreement_comment` text COLLATE utf8_polish_ci COMMENT 'Agreement Comments',
  PRIMARY KEY (`id`),
  UNIQUE KEY `agreement_id` (`agreement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `category_name` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `category_comment` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `committees`
--

DROP TABLE IF EXISTS `committees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `committee_id` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `committee_name` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `committee_start_date` date DEFAULT NULL,
  `committee_comment` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `committee_id` (`committee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `committees_persons`
--

DROP TABLE IF EXISTS `committees_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committees_persons` (
  `committee_id` int(10) unsigned NOT NULL,
  `person_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`committee_id`,`person_id`),
  KEY `committee_id` (`committee_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `committees_persons_ibfk_1` FOREIGN KEY (`committee_id`) REFERENCES `committees` (`id`),
  CONSTRAINT `committees_persons_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `config_name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `config_value` varchar(1024) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_id` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_subject` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `delivery_supplier` int(10) unsigned DEFAULT NULL,
  `delivery_agreement` int(10) unsigned DEFAULT NULL,
  `delivery_comment` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_id` (`delivery_id`),
  KEY `delivery_supplier` (`delivery_supplier`),
  KEY `delivery_agreement` (`delivery_agreement`),
  CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`delivery_supplier`) REFERENCES `suppliers` (`id`),
  CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`delivery_agreement`) REFERENCES `agreements` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `group_name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `group_creation_date` date DEFAULT NULL,
  `group_comment` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Main key for the table',
  `item_id` varchar(100) COLLATE utf8_polish_ci NOT NULL COMMENT 'Item Identifier',
  `item_name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'Item Name',
  `item_quantity` decimal(10,4) NOT NULL DEFAULT '1.0000' COMMENT 'Item Quantity',
  `item_quantity_unit` int(10) unsigned DEFAULT NULL,
  `item_delivery` int(10) unsigned DEFAULT NULL COMMENT 'Item Delivery',
  `item_purchase` int(10) unsigned DEFAULT NULL COMMENT 'Item Purchase',
  `item_price` decimal(65,2) DEFAULT NULL COMMENT 'Item Price',
  `item_value` decimal(65,2) DEFAULT NULL COMMENT 'Item Value',
  `item_location` int(10) unsigned DEFAULT NULL COMMENT 'Item Location',
  `item_date` date DEFAULT NULL,
  `item_comment` text COLLATE utf8_polish_ci COMMENT 'Item Comments',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`),
  KEY `item_delivery` (`item_delivery`),
  KEY `item_purchase` (`item_purchase`),
  KEY `item_location` (`item_location`),
  KEY `item_quantity_unit` (`item_quantity_unit`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`item_delivery`) REFERENCES `deliveries` (`id`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`item_purchase`) REFERENCES `purchases` (`id`),
  CONSTRAINT `items_ibfk_4` FOREIGN KEY (`item_location`) REFERENCES `locations` (`id`),
  CONSTRAINT `items_ibfk_6` FOREIGN KEY (`item_quantity_unit`) REFERENCES `quantity_units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=861 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `items_categories`
--

DROP TABLE IF EXISTS `items_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_categories` (
  `item_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`,`category_id`),
  KEY `item_id` (`item_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `items_categories_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `items_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `items_groups`
--

DROP TABLE IF EXISTS `items_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_groups` (
  `item_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `item_group_comment` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`item_id`,`group_id`),
  KEY `item_id` (`item_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `items_groups_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `items_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `licitations`
--

DROP TABLE IF EXISTS `licitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licitations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `licitation_id` varchar(100) COLLATE utf8_polish_ci NOT NULL COMMENT 'Licitation Identifier',
  `licitation_subject` varchar(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Licitation Subject',
  `licitation_announced_date` date DEFAULT NULL COMMENT 'Licitation Announcement Date',
  `licitation_date` date DEFAULT NULL,
  `licitation_committee` int(10) unsigned DEFAULT NULL,
  `licitation_specs_doc` longblob,
  `licitation_specs_doc_type` enum('pdf','djvu','doc','docx','rtf','png','jpg','tiff','bmp') COLLATE utf8_polish_ci DEFAULT NULL,
  `licitation_comment` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `licitation_id` (`licitation_id`),
  KEY `licitation_committee` (`licitation_committee`),
  KEY `licitation_committee_2` (`licitation_committee`),
  CONSTRAINT `licitations_ibfk_1` FOREIGN KEY (`licitation_committee`) REFERENCES `committees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `licitations_agreements`
--

DROP TABLE IF EXISTS `licitations_agreements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licitations_agreements` (
  `licitation_id` int(10) unsigned NOT NULL,
  `agreement_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`licitation_id`,`agreement_id`),
  KEY `licitation_id` (`licitation_id`),
  KEY `agreement_id` (`agreement_id`),
  CONSTRAINT `licitations_agreements_ibfk_1` FOREIGN KEY (`licitation_id`) REFERENCES `licitations` (`id`),
  CONSTRAINT `licitations_agreements_ibfk_2` FOREIGN KEY (`agreement_id`) REFERENCES `agreements` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liquidation_items`
--

DROP TABLE IF EXISTS `liquidation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquidation_items` (
  `liquidation_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `liquidation_active` tinyint(1) DEFAULT NULL,
  `liquidation_quantity` decimal(10,4) DEFAULT NULL,
  `item_liquidation_reason` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `liquidation_id` (`liquidation_id`,`item_id`),
  KEY `item_id` (`item_id`),
  KEY `liquidation_id_2` (`liquidation_id`),
  CONSTRAINT `liquidation_items_ibfk_1` FOREIGN KEY (`liquidation_id`) REFERENCES `liquidations` (`id`),
  CONSTRAINT `liquidation_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liquidations`
--

DROP TABLE IF EXISTS `liquidations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquidations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `liquidation_id` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `liquidation_subject` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `liquidation_date` date NOT NULL,
  `liquidation_our_committee` int(10) unsigned DEFAULT NULL,
  `liquidation_their_committee` int(10) unsigned DEFAULT NULL,
  `liquidation_comment` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `liquidation_id` (`liquidation_id`),
  KEY `liquidation_our_committee` (`liquidation_our_committee`),
  KEY `liquidation_their_committee` (`liquidation_their_committee`),
  CONSTRAINT `liquidations_ibfk_1` FOREIGN KEY (`liquidation_our_committee`) REFERENCES `committees` (`id`),
  CONSTRAINT `liquidations_ibfk_2` FOREIGN KEY (`liquidation_their_committee`) REFERENCES `committees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loan_item` int(10) unsigned NOT NULL,
  `loan_item_quantity` int(11) NOT NULL DEFAULT '1',
  `loan_borrower_person` int(10) unsigned NOT NULL,
  `loan_lender_person` int(10) unsigned DEFAULT NULL,
  `loan_start_date` date NOT NULL,
  `loan_end_date` date DEFAULT NULL,
  `loan_returned` tinyint(1) DEFAULT NULL,
  `loan_returned_date` date DEFAULT NULL,
  `loan_comment` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`),
  KEY `loan_item` (`loan_item`),
  KEY `loan_to_person` (`loan_borrower_person`),
  KEY `loan_by_person` (`loan_lender_person`),
  KEY `loan_item_2` (`loan_item`),
  KEY `loan_borrowing_person` (`loan_borrower_person`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`loan_item`) REFERENCES `items` (`id`),
  CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`loan_borrower_person`) REFERENCES `persons` (`id`),
  CONSTRAINT `loans_ibfk_3` FOREIGN KEY (`loan_lender_person`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `location_comment` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_id` (`location_id`),
  UNIQUE KEY `location_id_2` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person_items`
--

DROP TABLE IF EXISTS `person_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_items` (
  `person_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `person_id` (`person_id`,`item_id`),
  CONSTRAINT `person_items_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `person_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `person_givenname` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `person_surname` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `person_email` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `person_phone` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `person_comment` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persons_locations`
--

DROP TABLE IF EXISTS `persons_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_locations` (
  `person_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`person_id`,`location_id`),
  KEY `person_id` (`person_id`,`location_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `persons_locations_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `persons_locations_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'Purchase Identifier',
  `purchase_subject` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'Purchase Subject',
  `purchase_date` date NOT NULL COMMENT 'Purchase Date',
  `purchase_buyer_person` int(10) unsigned DEFAULT NULL COMMENT 'Purchase Buyer Person',
  `purchase_buyer_commitee` int(10) unsigned DEFAULT NULL COMMENT 'Purchase Buyer Committee',
  `purchase_supplier` int(10) unsigned DEFAULT NULL COMMENT 'Purchase Supplier',
  `purchase_comment` text COLLATE utf8_polish_ci COMMENT 'Purchase Comments',
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_id` (`purchase_id`),
  KEY `purchase_buyer_person` (`purchase_buyer_person`),
  KEY `purchase_buyer_commitee` (`purchase_buyer_commitee`),
  KEY `purchase_supplier` (`purchase_supplier`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`purchase_buyer_person`) REFERENCES `persons` (`id`),
  CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`purchase_buyer_commitee`) REFERENCES `committees` (`id`),
  CONSTRAINT `purchases_ibfk_3` FOREIGN KEY (`purchase_supplier`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quantity_units`
--

DROP TABLE IF EXISTS `quantity_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quantity_units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity_unit_id` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `quantity_unit_comment` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategories` (
  `supercategory_id` int(10) unsigned NOT NULL,
  `subcategory_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`supercategory_id`,`subcategory_id`),
  KEY `supergroup_id` (`supercategory_id`,`subcategory_id`),
  KEY `supergroup_id_2` (`supercategory_id`),
  KEY `subgroup_id` (`subcategory_id`),
  CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`supercategory_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `subcategories_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'Supplier Identifier',
  `supplier_name` varchar(255) COLLATE utf8_polish_ci NOT NULL COMMENT 'Supplier Name',
  `supplier_address` text COLLATE utf8_polish_ci COMMENT 'Supplier Address',
  `supplier_email` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'Supplier Email',
  `supplier_www` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'Supplier WWW',
  `supplier_contact` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'Supplier Contact',
  `supplier_comment` text COLLATE utf8_polish_ci COMMENT 'Supplier Comments',
  PRIMARY KEY (`id`),
  UNIQUE KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-14 11:00:11
