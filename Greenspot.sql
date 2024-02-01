-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: greenspot
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `idCustomer` int NOT NULL,
  `customerName` varchar(45) NOT NULL,
  PRIMARY KEY (`idCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (100988,'F'),(111000,'E'),(196777,'C'),(198765,'A'),(202900,'B'),(277177,'D');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `itemNum` int NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `vendor` varchar(200) NOT NULL,
  `itemType` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  PRIMARY KEY (`itemNum`)
) ENGINE=InnoDB AUTO_INCREMENT=2002 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1000,'Bennet Farm free-range eggs','Bennet Farms, Rt. 17 Evansville, IL 55446','Dairy','D12','dozen'),(1100,'Freshness White beans','Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678','Canned','a2','12 ounce can'),(1222,'Freshness Green beans','Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678','Canned','a3','12 ounce can'),(1223,'Freshness Green beans','Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678','Canned','a7','36 oz can'),(1224,'Freshness Wax beans','Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678','Canned','a3','12 ounce can'),(2000,'Ruby\'s Kale','Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567','Produce','p12','bunch'),(2001,'Ruby\'s Organic Kale','Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567','Produce','po2','bunch');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `purchaseNum` varchar(30) NOT NULL,
  `itemNumP` int NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `purchaseDate` date NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`purchaseNum`),
  KEY `itemNum_idx` (`itemNumP`),
  CONSTRAINT `itemNumP` FOREIGN KEY (`itemNumP`) REFERENCES `products` (`itemNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES ('P1',1000,2.35,'2022-02-01',25),('P2',1100,0.69,'2022-02-02',40),('P3',1222,0.59,'2022-02-10',40),('P4',1223,1.75,'2022-02-10',10),('P5',1224,0.65,'2022-02-10',30),('P6',2000,1.29,'2022-02-12',25),('P7',2001,2.19,'2022-02-12',20),('P8',1223,1.80,'2022-02-15',10);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `salesNum` varchar(45) NOT NULL,
  `dateSold` date NOT NULL,
  `idCustomer` int DEFAULT NULL,
  PRIMARY KEY (`salesNum`),
  KEY `idCustomer_idx` (`idCustomer`),
  CONSTRAINT `idCustomer` FOREIGN KEY (`idCustomer`) REFERENCES `customer` (`idCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES ('S1','2022-02-02',198765),('S2','2022-02-02',NULL),('S3','2022-02-02',202900),('S4','2022-02-04',196777),('S5','2022-02-07',198765),('S6','2022-02-11',277177),('S7','2022-02-11',NULL);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesdetails`
--

DROP TABLE IF EXISTS `salesdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesdetails` (
  `salesNum` varchar(45) NOT NULL,
  `itemNumSales` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`salesNum`,`itemNumSales`),
  KEY `itemNumSales_idx` (`itemNumSales`),
  CONSTRAINT `itemNumSales` FOREIGN KEY (`itemNumSales`) REFERENCES `products` (`itemNum`),
  CONSTRAINT `salesNum` FOREIGN KEY (`salesNum`) REFERENCES `sales` (`salesNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesdetails`
--

LOCK TABLES `salesdetails` WRITE;
/*!40000 ALTER TABLE `salesdetails` DISABLE KEYS */;
INSERT INTO `salesdetails` VALUES ('S1',1000,5.49,2),('S2',2000,3.99,2),('S3',1100,1.49,2),('S4',1000,5.99,2),('S5',1100,1.49,8),('S6',1000,5.49,4),('S7',1100,1.49,4);
/*!40000 ALTER TABLE `salesdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `stockID` int NOT NULL,
  `itenNumStock` int NOT NULL,
  `quantity` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`stockID`),
  KEY `itemNumStock_idx` (`itenNumStock`),
  CONSTRAINT `itemNumStock` FOREIGN KEY (`itenNumStock`) REFERENCES `products` (`itemNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (11,1000,29,'2022-02-01'),(12,1000,27,'2022-02-02'),(13,2000,3,'2022-02-02'),(14,1100,13,'2022-02-02'),(15,1100,53,'2022-02-02'),(16,1000,25,'2022-02-04'),(17,1100,45,'2022-02-07'),(18,1222,59,'2022-02-10');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 16:10:54
