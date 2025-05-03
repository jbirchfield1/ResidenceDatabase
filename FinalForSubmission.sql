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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,4,'Utility',500.00,'2023-01-10',1,NULL),(2,4,'Labor',800.00,'2023-01-20',1,NULL),(3,4,'Insurance',1200.00,'2023-02-01',1,NULL),(4,4,'Parts',600.00,'2023-02-15',1,NULL),(5,4,'Mortgage',2500.00,'2023-03-01',1,NULL),(6,5,'Utility',450.00,'2023-01-15',2,NULL),(7,5,'Labor',900.00,'2023-02-01',2,NULL),(8,5,'Insurance',1100.00,'2023-02-10',2,NULL),(9,5,'Parts',700.00,'2023-02-25',2,NULL),(10,5,'Mortgage',2400.00,'2023-03-05',2,NULL),(11,6,'Utility',480.00,'2023-01-20',3,NULL),(12,6,'Labor',850.00,'2023-02-05',3,NULL),(13,6,'Insurance',1150.00,'2023-02-15',3,NULL),(14,6,'Parts',650.00,'2023-03-01',3,NULL),(15,6,'Mortgage',2300.00,'2023-03-10',3,NULL),(16,1,'Utility',375.00,'2024-01-23',1,10),(17,1,'Labor',825.00,'2024-02-25',1,10),(18,1,'Insurance',1175.00,'2024-02-17',1,10),(19,1,'Parts',700.00,'2024-03-11',1,10),(20,1,'Mortgage',2425.00,'2024-04-10',1,10),(21,2,'Utility',475.00,'2024-01-15',2,11),(22,2,'Labor',900.00,'2024-01-25',2,11),(23,2,'Insurance',1200.00,'2024-03-17',2,11),(24,2,'Parts',715.00,'2024-03-07',2,11),(25,2,'Mortgage',2330.00,'2024-02-22',2,11),(26,3,'Utility',400.00,'2024-03-15',3,12),(27,3,'Labor',850.00,'2024-02-18',3,12),(28,3,'Insurance',1125.00,'2024-03-23',3,12),(29,3,'Parts',650.00,'2024-04-15',3,12),(30,3,'Mortgage',2500.00,'2024-01-14',3,12),(31,NULL,'Office Supplies',500.00,'2024-03-20',2,NULL),(32,1,'Utility',1175.00,'2024-02-23',1,10),(33,1,'Labor',825.00,'2024-02-25',1,10),(34,1,'Mortgage',1853.00,'2024-02-10',1,10),(35,1,'Labor',1250.00,'2024-01-12',1,10),(36,1,'Insurance',1444.00,'2024-01-14',1,10),(37,1,'Parts',2145.00,'2024-01-26',1,10),(38,1,'Mortgage',2629.00,'2024-01-07',1,10),(39,1,'Utility',2027.00,'2024-03-08',1,10),(40,1,'Labor',1091.00,'2024-03-11',1,10),(41,1,'Insurance',2688.00,'2024-03-10',1,10),(42,1,'Mortgage',2520.00,'2024-03-08',1,10),(43,2,'Insurance',2827.00,'2024-01-13',2,11),(44,2,'Parts',2369.00,'2024-01-26',2,11),(45,2,'Mortgage',2551.00,'2024-01-10',2,11),(46,2,'Utility',615.00,'2024-03-12',2,11),(47,2,'Labor',1175.00,'2024-03-08',2,11),(48,2,'Mortgage',1706.00,'2024-03-16',2,11),(49,2,'Utility',434.00,'2024-02-26',2,11),(50,2,'Labor',919.00,'2024-02-10',2,11),(51,2,'Insurance',2228.00,'2024-02-16',2,11),(52,2,'Parts',1419.00,'2024-02-05',2,11),(53,3,'Utility',640.00,'2024-01-02',3,12),(54,3,'Labor',1443.00,'2024-01-28',3,12),(55,3,'Insurance',1207.00,'2024-01-22',3,12),(56,3,'Parts',733.00,'2024-01-21',3,12),(57,3,'Utility',950.00,'2024-02-11',3,12),(58,3,'Insurance',1012.00,'2024-02-20',3,12),(59,3,'Parts',743.00,'2024-02-09',3,12),(60,3,'Mortgage',1041.00,'2024-02-07',3,12),(61,3,'Labor',2140.00,'2024-03-21',3,12),(62,3,'Parts',1191.00,'2024-03-24',3,12),(63,3,'Mortgage',1649.00,'2024-03-31',3,12),(64,4,'Utility',818.00,'2024-01-11',1,NULL),(65,4,'Labor',2096.00,'2024-01-25',1,NULL),(66,4,'Insurance',1759.00,'2024-01-27',1,NULL),(67,4,'Parts',2477.00,'2024-01-15',1,NULL),(68,4,'Mortgage',1940.00,'2024-01-20',1,NULL),(69,4,'Utility',342.00,'2024-02-18',1,NULL),(70,4,'Labor',1862.00,'2024-02-16',1,NULL),(71,4,'Insurance',503.00,'2024-02-27',1,NULL),(72,4,'Parts',1114.00,'2024-02-11',1,NULL),(73,4,'Mortgage',1105.00,'2024-02-13',1,NULL),(74,4,'Utility',2116.00,'2024-03-01',1,NULL),(75,4,'Labor',1928.00,'2024-03-17',1,NULL),(76,4,'Insurance',1396.00,'2024-03-12',1,NULL),(77,4,'Parts',1771.00,'2024-03-07',1,NULL),(78,4,'Mortgage',777.00,'2024-03-30',1,NULL),(79,5,'Utility',375.00,'2024-01-18',2,NULL),(80,5,'Labor',2244.00,'2024-01-11',2,NULL),(81,5,'Insurance',1486.00,'2024-01-16',2,NULL),(82,5,'Parts',400.00,'2024-01-20',2,NULL),(83,5,'Mortgage',1094.00,'2024-01-26',2,NULL),(84,5,'Utility',1002.00,'2024-02-03',2,NULL),(85,5,'Labor',988.00,'2024-02-15',2,NULL),(86,5,'Insurance',2446.00,'2024-02-14',2,NULL),(87,5,'Parts',1048.00,'2024-02-24',2,NULL),(88,5,'Mortgage',744.00,'2024-02-28',2,NULL),(89,5,'Utility',1210.00,'2024-03-26',2,NULL),(90,5,'Labor',2272.00,'2024-03-01',2,NULL),(91,5,'Insurance',346.00,'2024-03-12',2,NULL),(92,5,'Parts',422.00,'2024-03-14',2,NULL),(93,5,'Mortgage',473.00,'2024-03-31',2,NULL),(94,6,'Utility',1842.00,'2024-01-27',3,NULL),(95,6,'Labor',1731.00,'2024-01-12',3,NULL),(96,6,'Insurance',2270.00,'2024-01-28',3,NULL),(97,6,'Parts',2184.00,'2024-01-01',3,NULL),(98,6,'Mortgage',1569.00,'2024-01-15',3,NULL),(99,6,'Utility',444.00,'2024-02-22',3,NULL),(100,6,'Labor',1335.00,'2024-02-12',3,NULL),(101,6,'Insurance',837.00,'2024-02-07',3,NULL),(102,6,'Parts',1150.00,'2024-02-24',3,NULL),(103,6,'Mortgage',1764.00,'2024-02-21',3,NULL),(104,6,'Utility',1095.00,'2024-03-26',3,NULL),(105,6,'Labor',332.00,'2024-03-09',3,NULL),(106,6,'Insurance',779.00,'2024-03-05',3,NULL),(107,6,'Parts',1380.00,'2024-03-25',3,NULL),(108,6,'Mortgage',1827.00,'2024-03-05',3,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,1,'House','824 Elm Street'),(2,2,'House','405 Birch Street'),(3,3,'House','159 Cedar Street'),(4,1,'Apartment Complex','187 Arkansas Avenue'),(5,2,'Apartment Complex','164 O Street'),(6,3,'Apartment Complex','382 Joyce Street'),(7,1,'House','305 Acacia Street');
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentpayment`
--

LOCK TABLES `rentpayment` WRITE;
/*!40000 ALTER TABLE `rentpayment` DISABLE KEYS */;
INSERT INTO `rentpayment` VALUES (1,1,4,1500.00,'2023-01-01'),(2,1,4,1500.00,'2023-02-01'),(3,2,4,1600.00,'2023-02-15'),(4,2,4,1600.00,'2023-03-15'),(5,3,4,1550.00,'2023-03-20'),(6,3,4,1550.00,'2023-04-20'),(7,4,5,1400.00,'2023-01-20'),(8,4,5,1400.00,'2023-02-20'),(9,5,5,1425.00,'2024-02-05'),(10,5,5,1425.00,'2024-03-05'),(11,6,5,1450.00,'2024-03-25'),(12,6,5,1450.00,'2024-04-25'),(13,7,6,1550.00,'2024-01-25'),(14,7,6,1550.00,'2024-02-25'),(15,8,6,1600.00,'2024-02-10'),(16,8,6,1600.00,'2024-03-10'),(17,9,6,1575.00,'2024-03-30'),(18,9,6,1575.00,'2024-04-30'),(19,10,2,890.00,'2024-03-15'),(20,11,3,1387.00,'2024-03-19'),(21,10,2,890.00,'2024-04-15'),(22,11,3,1387.00,'2024-04-20'),(54,1,4,1500.00,'2024-01-01'),(55,1,4,1500.00,'2024-02-01'),(56,1,4,1500.00,'2024-03-01'),(57,2,4,1600.00,'2024-01-15'),(58,2,4,1600.00,'2024-02-15'),(59,2,4,1600.00,'2024-03-15'),(60,3,4,1550.00,'2024-01-20'),(61,3,4,1550.00,'2024-02-20'),(62,3,4,1550.00,'2024-03-20'),(63,4,5,1400.00,'2024-01-20'),(64,4,5,1400.00,'2024-02-20'),(65,4,5,1400.00,'2024-03-20'),(66,5,5,1425.00,'2024-01-05'),(69,6,5,1450.00,'2024-01-25'),(70,6,5,1450.00,'2024-02-25'),(74,7,6,1550.00,'2024-03-25'),(75,8,6,1600.00,'2024-01-10'),(78,9,6,1575.00,'2024-01-30'),(79,9,6,1575.00,'2024-02-28'),(81,10,2,890.00,'2024-01-15'),(82,10,2,890.00,'2024-02-15'),(83,11,3,1387.00,'2024-01-20'),(84,11,3,1387.00,'2024-02-20');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residences`
--

LOCK TABLES `residences` WRITE;
/*!40000 ALTER TABLE `residences` DISABLE KEYS */;
INSERT INTO `residences` VALUES (1,4,'2023-01-15',30000.00,1500.00,2,1,800,'Apartment'),(2,4,'2023-02-05',320000.00,1600.00,3,2,900,'Apartment'),(3,4,'2023-03-28',310000.00,1550.00,2,1,850,'Apartment'),(4,5,'2023-01-20',280000.00,1400.00,3,2,1000,'Apartment'),(5,5,'2023-02-05',285000.00,1425.00,2,1,850,'Apartment'),(6,5,'2023-03-25',290000.00,1450.00,3,2,950,'Apartment'),(7,6,'2023-01-25',310000.00,1550.00,3,2,950,'Apartment'),(8,6,'2023-02-10',320000.00,1600.00,2,1,800,'Apartment'),(9,6,'2023-03-30',315000.00,1575.00,3,2,900,'Apartment'),(10,1,'2017-03-05',250000.00,500.00,3,2,1800,'House'),(11,2,'2018-06-10',220000.00,900.00,2,1,1600,'House'),(12,3,'2019-09-15',275000.00,1387.00,4,3,2100,'House'),(13,7,'2020-03-28',280000.00,1750.00,5,3,2200,'House');
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

-- Dump completed on 2024-05-07  8:43:08
