-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: financial_domain
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `car_loan`
--

DROP TABLE IF EXISTS `car_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CfdId` int(11) NOT NULL,
  `drivers_license_number` varchar(45) NOT NULL,
  `insurance_name` varchar(45) NOT NULL,
  `insurance_policy_number` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `CfdId_UNIQUE` (`CfdId`),
  UNIQUE KEY `drivers_license_number_UNIQUE` (`drivers_license_number`),
  CONSTRAINT `CfdId` FOREIGN KEY (`CfdId`) REFERENCES `customer_financial_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_loan`
--

LOCK TABLES `car_loan` WRITE;
/*!40000 ALTER TABLE `car_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `primary_address` varchar(65) NOT NULL,
  `secondary_address` varchar(45) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(30) NOT NULL,
  `zipcode` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `customerId_UNIQUE` (`customerId`),
  CONSTRAINT `customerId` FOREIGN KEY (`customerId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_financial_details`
--

DROP TABLE IF EXISTS `customer_financial_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_financial_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_Id` int(11) NOT NULL,
  `ssn` int(11) NOT NULL,
  `tax_Id` varchar(15) DEFAULT NULL,
  `annual_pay` double NOT NULL,
  `total_withholding_stock_value` double DEFAULT NULL,
  `number_of_cars` int(11) NOT NULL,
  `total_cars_value` double NOT NULL,
  `total_asset_value` double NOT NULL,
  `total_debt_value` double NOT NULL,
  `gross_family_income` double NOT NULL,
  `loan_type` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `customerId_UNIQUE` (`customer_Id`),
  UNIQUE KEY `ssn_UNIQUE` (`ssn`),
  UNIQUE KEY `tax_Id_UNIQUE` (`tax_Id`),
  CONSTRAINT `customer_Id` FOREIGN KEY (`customer_Id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_financial_details`
--

LOCK TABLES `customer_financial_details` WRITE;
/*!40000 ALTER TABLE `customer_financial_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_financial_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_mortgage`
--

DROP TABLE IF EXISTS `home_mortgage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_mortgage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cfd_Id` int(11) NOT NULL,
  `persons_in_family` int(11) NOT NULL,
  `insurance_name` varchar(45) NOT NULL,
  `insurance_policy_num` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `CfdId_UNIQUE` (`Cfd_Id`),
  CONSTRAINT `Cfd_Id` FOREIGN KEY (`Cfd_Id`) REFERENCES `customer_financial_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_mortgage`
--

LOCK TABLES `home_mortgage` WRITE;
/*!40000 ALTER TABLE `home_mortgage` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_mortgage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-27  8:15:58
