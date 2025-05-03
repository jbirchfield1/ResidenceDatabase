CREATE DATABASE  IF NOT EXISTS `final_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `final_project`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: final_project
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `companyId` int NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) NOT NULL,
  `companyAddress` varchar(255) NOT NULL,
  `contactInfo` varchar(255) NOT NULL,
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Google','1600 Ampitheatre Parkway, Mountain View, CA','(650)253-0000'),(2,'Intercontinental Hotels Group','Three Ravinia Drive Suite 100 Atlanta, GA','(770)604-2000'),(3,'Lincoln Property Company','8111 Douglas Avenue, Suite 600 Dallas, TX','(214)740-3300');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `expenseId` int NOT NULL AUTO_INCREMENT,
  `propertyId` int DEFAULT NULL,
  `expenseType` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `expenseDate` date NOT NULL,
  `companyId` int DEFAULT NULL,
  `resNumber` int DEFAULT NULL,
  PRIMARY KEY (`expenseId`),
  KEY `propertyId` (`propertyId`),
  KEY `companyId` (`companyId`),
  KEY `resNumber` (`resNumber`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`propertyId`) REFERENCES `properties` (`propertyId`),
  CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `properties` (`companyId`),
  CONSTRAINT `expenses_ibfk_3` FOREIGN KEY (`resNumber`) REFERENCES `residences` (`resId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,4,'Utility',500.00,'2023-01-10',1,NULL),(2,4,'Labor',800.00,'2023-01-20',1,NULL),(3,4,'Insurance',1200.00,'2023-02-01',1,NULL),(4,4,'Parts',600.00,'2023-02-15',1,NULL),(5,4,'Mortgage',2500.00,'2023-03-01',1,NULL),(6,5,'Utility',450.00,'2023-01-15',2,NULL),(7,5,'Labor',900.00,'2023-02-01',2,NULL),(8,5,'Insurance',1100.00,'2023-02-10',2,NULL),(9,5,'Parts',700.00,'2023-02-25',2,NULL),(10,5,'Mortgage',2400.00,'2023-03-05',2,NULL),(11,6,'Utility',480.00,'2023-01-20',3,NULL),(12,6,'Labor',850.00,'2023-02-05',3,NULL),(13,6,'Insurance',1150.00,'2023-02-15',3,NULL),(14,6,'Parts',650.00,'2023-03-01',3,NULL),(15,6,'Mortgage',2300.00,'2023-03-10',3,NULL),(16,1,'Utility',375.00,'2024-01-23',1,10),(17,1,'Labor',825.00,'2024-02-25',1,10),(18,1,'Insurance',1175.00,'2024-02-17',1,10),(19,1,'Parts',700.00,'2024-03-11',1,10),(20,1,'Mortgage',2425.00,'2024-04-10',1,10),(21,2,'Utility',475.00,'2024-01-15',2,11),(22,2,'Labor',900.00,'2024-01-25',2,11),(23,2,'Insurance',1200.00,'2024-03-17',2,11),(24,2,'Parts',715.00,'2024-03-07',2,11),(25,2,'Mortgage',2330.00,'2024-02-22',2,11),(26,3,'Utility',400.00,'2024-03-15',3,12),(27,3,'Labor',850.00,'2024-02-18',3,12),(28,3,'Insurance',1125.00,'2024-03-23',3,12),(29,3,'Parts',650.00,'2024-04-15',3,12),(30,3,'Mortgage',2500.00,'2024-01-14',3,12),(31,NULL,'Office Supplies',500.00,'2024-03-20',2,NULL);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `propertyId` int NOT NULL AUTO_INCREMENT,
  `companyId` int DEFAULT NULL,
  `propertyType` enum('House','Apartment Complex') NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`propertyId`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,1,'House','824 Elm Street'),(2,2,'House','405 Birch Street'),(3,3,'House','159 Cedar Street'),(4,1,'Apartment Complex','187 Arkansas Avenue'),(5,2,'Apartment Complex','164 O Street'),(6,3,'Apartment Complex','382 Joyce Street');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentchanges`
--

DROP TABLE IF EXISTS `rentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentchanges` (
  `changeId` int NOT NULL AUTO_INCREMENT,
  `residenceId` int NOT NULL,
  `oldMortgage` decimal(10,2) DEFAULT NULL,
  `newMortgage` decimal(10,2) DEFAULT NULL,
  `changeDate` date DEFAULT NULL,
  PRIMARY KEY (`changeId`),
  KEY `residenceId` (`residenceId`),
  CONSTRAINT `rentchanges_ibfk_1` FOREIGN KEY (`residenceId`) REFERENCES `residences` (`resId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentchanges`
--

LOCK TABLES `rentchanges` WRITE;
/*!40000 ALTER TABLE `rentchanges` DISABLE KEYS */;
INSERT INTO `rentchanges` VALUES (1,10,1013.00,500.00,'2024-04-25'),(2,11,890.00,900.00,'2024-04-25');
/*!40000 ALTER TABLE `rentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentpayment`
--

DROP TABLE IF EXISTS `rentpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentpayment` (
  `paymentId` int NOT NULL AUTO_INCREMENT,
  `tenantId` int DEFAULT NULL,
  `propertyId` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paymentDate` date NOT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `tenantId` (`tenantId`),
  KEY `propertyId` (`propertyId`),
  CONSTRAINT `rentpayment_ibfk_1` FOREIGN KEY (`tenantId`) REFERENCES `tenants` (`tenantId`),
  CONSTRAINT `rentpayment_ibfk_2` FOREIGN KEY (`propertyId`) REFERENCES `properties` (`propertyId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentpayment`
--

LOCK TABLES `rentpayment` WRITE;
/*!40000 ALTER TABLE `rentpayment` DISABLE KEYS */;
INSERT INTO `rentpayment` VALUES (1,1,4,1500.00,'2023-01-01'),(2,1,4,1500.00,'2023-02-01'),(3,2,4,1600.00,'2023-02-15'),(4,2,4,1600.00,'2023-03-15'),(5,3,4,1550.00,'2023-03-20'),(6,3,4,1550.00,'2023-04-20'),(7,4,5,1400.00,'2023-01-20'),(8,4,5,1400.00,'2023-02-20'),(9,5,5,1425.00,'2024-02-05'),(10,5,5,1425.00,'2024-03-05'),(11,6,5,1450.00,'2024-03-25'),(12,6,5,1450.00,'2024-04-25'),(13,7,6,1550.00,'2024-01-25'),(14,7,6,1550.00,'2024-02-25'),(15,8,6,1600.00,'2024-02-10'),(16,8,6,1600.00,'2024-03-10'),(17,9,6,1575.00,'2024-03-30'),(18,9,6,1575.00,'2024-04-30'),(19,10,2,890.00,'2024-03-15'),(20,11,3,1387.00,'2024-03-19'),(21,10,2,890.00,'2024-04-15'),(22,11,3,1387.00,'2024-04-20');
/*!40000 ALTER TABLE `rentpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residences`
--

DROP TABLE IF EXISTS `residences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residences` (
  `resId` int NOT NULL AUTO_INCREMENT,
  `propertyId` int DEFAULT NULL,
  `purchaseDate` date DEFAULT NULL,
  `purchasePrice` decimal(10,2) DEFAULT NULL,
  `mortgage` decimal(10,2) DEFAULT NULL,
  `numberOfRooms` int DEFAULT NULL,
  `numberOfBathrooms` int DEFAULT NULL,
  `squareFootage` int DEFAULT NULL,
  `residenceType` enum('House','Apartment') NOT NULL,
  PRIMARY KEY (`resId`),
  KEY `propertyId` (`propertyId`),
  CONSTRAINT `residences_ibfk_1` FOREIGN KEY (`propertyId`) REFERENCES `properties` (`propertyId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residences`
--

LOCK TABLES `residences` WRITE;
/*!40000 ALTER TABLE `residences` DISABLE KEYS */;
INSERT INTO `residences` VALUES (1,4,'2023-01-15',30000.00,1500.00,2,1,800,'Apartment'),(2,4,'2023-02-05',320000.00,1600.00,3,2,900,'Apartment'),(3,4,'2023-03-28',310000.00,1550.00,2,1,850,'Apartment'),(4,5,'2023-01-20',280000.00,1400.00,3,2,1000,'Apartment'),(5,5,'2023-02-05',285000.00,1425.00,2,1,850,'Apartment'),(6,5,'2023-03-25',290000.00,1450.00,3,2,950,'Apartment'),(7,6,'2023-01-25',310000.00,1550.00,3,2,950,'Apartment'),(8,6,'2023-02-10',320000.00,1600.00,2,1,800,'Apartment'),(9,6,'2023-03-30',315000.00,1575.00,3,2,900,'Apartment'),(10,1,'2017-03-05',250000.00,500.00,3,2,1800,'House'),(11,2,'2018-06-10',220000.00,900.00,2,1,1600,'House'),(12,3,'2019-09-15',275000.00,1387.00,4,3,2100,'House');
/*!40000 ALTER TABLE `residences` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_rent_changes` AFTER UPDATE ON `residences` FOR EACH ROW BEGIN
   
    IF NEW.mortgage <> OLD.mortgage THEN
        INSERT INTO rentChanges (residenceId, oldMortgage, newMortgage, changeDate)
        VALUES (NEW.resId, OLD.mortgage, NEW.mortgage, CURDATE());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tenanthistory`
--

DROP TABLE IF EXISTS `tenanthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenanthistory` (
  `tHistoryId` int NOT NULL AUTO_INCREMENT,
  `tenantID` int DEFAULT NULL,
  `propertyId` int DEFAULT NULL,
  `moveInDate` date NOT NULL,
  `moveOutDate` date DEFAULT NULL,
  `resNumber` int DEFAULT NULL,
  `numberOfMembers` int NOT NULL,
  PRIMARY KEY (`tHistoryId`),
  KEY `tenantID` (`tenantID`),
  KEY `propertyId` (`propertyId`,`resNumber`),
  CONSTRAINT `tenanthistory_ibfk_1` FOREIGN KEY (`tenantID`) REFERENCES `tenants` (`tenantId`),
  CONSTRAINT `tenanthistory_ibfk_2` FOREIGN KEY (`propertyId`) REFERENCES `properties` (`propertyId`),
  CONSTRAINT `tenanthistory_ibfk_3` FOREIGN KEY (`propertyId`, `resNumber`) REFERENCES `residences` (`propertyId`, `resId`),
  CONSTRAINT `tenanthistory_ibfk_4` FOREIGN KEY (`propertyId`, `resNumber`) REFERENCES `residences` (`propertyId`, `resId`),
  CONSTRAINT `tenanthistory_ibfk_5` FOREIGN KEY (`propertyId`, `resNumber`) REFERENCES `residences` (`propertyId`, `resId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenanthistory`
--

LOCK TABLES `tenanthistory` WRITE;
/*!40000 ALTER TABLE `tenanthistory` DISABLE KEYS */;
INSERT INTO `tenanthistory` VALUES (1,1,4,'2023-01-15','2023-12-28',1,1),(2,2,4,'2023-02-01','2024-02-01',2,2),(3,3,4,'2023-03-20','2024-03-20',3,2),(4,4,5,'2023-01-20','2024-01-20',4,3),(5,5,5,'2023-02-05',NULL,5,1),(6,6,5,'2023-03-25',NULL,6,2),(7,7,6,'2023-01-25',NULL,7,3),(8,8,6,'2023-02-10',NULL,8,3),(9,9,6,'2023-03-30',NULL,9,2),(10,10,2,'2023-12-10',NULL,11,3),(11,11,3,'2021-01-13',NULL,12,5);
/*!40000 ALTER TABLE `tenanthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenants` (
  `tenantId` int NOT NULL AUTO_INCREMENT,
  `TenantName` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `leaseStartDate` date NOT NULL,
  `leaseEndDate` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tenantId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
INSERT INTO `tenants` VALUES (1,'Josh Birchfield','(479) 123-4567','2023-01-01','2023-12-31','jbirchfield@gmail.com'),(2,'Alan Young','(479) 325-5678','2023-02-15','2024-02-14','ayoung@gmail.com'),(3,'Ben Edens','(808) 314-1934','2023-03-01','2024-03-01','bedens@gmail.com'),(4,'Oswald Fiddledink','(193) 164-0834','2023-04-01','2024-04-01','ofiddledink@gmail.com'),(5,'David Swasnik','(739) 468-1638','2023-05-15','2024-05-15','dswasnik@gmail.com'),(6,'Suzie Greenick','(167) 803-0846','2023-06-01','2024-06-01','sgreenick@gmail.com'),(7,'Luke Greyrat','(186) 694-2069','2023-07-15','2024-07-15','lgreyrat@gmail.com'),(8,'Zackary White','(381) 465-4381','2023-08-01','2024-08-01','zwhite@gmail.com'),(9,'Nathaniel Brown','(012) 010-0102','2023-09-01','2024-09-01','nbrown@gmail.com'),(10,'Olivia Voldaren','(164) 068-0420','2023-10-01','2024-10-01','ovoldaren@gmail.com'),(11,'Jace Beleren','(672)198-0186','2020-11-29','2024-06-29','jbeleren@gmail.com');
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'final_project'
--

--
-- Dumping routines for database 'final_project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-25 20:07:06
