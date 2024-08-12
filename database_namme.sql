-- MySQL dump 10.13  Distrib 5.7.39, for osx10.12 (x86_64)
--
-- Host: localhost    Database: image-progate
-- ------------------------------------------------------
-- Server version	5.7.39

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
-- Table structure for table `bougu`
--

DROP TABLE IF EXISTS `bougu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bougu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namae` text NOT NULL,
  `bougyo` int(11) NOT NULL,
  `nedan` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bougu`
--

LOCK TABLES `bougu` WRITE;
/*!40000 ALTER TABLE `bougu` DISABLE KEYS */;
INSERT INTO `bougu` VALUES (1,'木の盾',5,3000);
/*!40000 ALTER TABLE `bougu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buki`
--

DROP TABLE IF EXISTS `buki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namae` text NOT NULL,
  `kougeki` int(11) NOT NULL,
  `nedan` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buki`
--

LOCK TABLES `buki` WRITE;
/*!40000 ALTER TABLE `buki` DISABLE KEYS */;
INSERT INTO `buki` VALUES (1,'木の棒',5,3000),(2,'高級なはたき',10,5000);
/*!40000 ALTER TABLE `buki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hata`
--

DROP TABLE IF EXISTS `hata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namae` text NOT NULL,
  `iryoku` int(11) NOT NULL,
  `nedan` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hata`
--

LOCK TABLES `hata` WRITE;
/*!40000 ALTER TABLE `hata` DISABLE KEYS */;
INSERT INTO `hata` VALUES (1,'白旗',5,2000);
/*!40000 ALTER TABLE `hata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hei`
--

DROP TABLE IF EXISTS `hei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namae` text NOT NULL,
  `kougeki` int(11) NOT NULL,
  `bougyo` int(11) NOT NULL,
  `hiyou` int(11) NOT NULL,
  `kaikyuu` int(11) NOT NULL,
  `hituyousute` int(11) NOT NULL,
  `nouryokumemo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hei`
--

LOCK TABLES `hei` WRITE;
/*!40000 ALTER TABLE `hei` DISABLE KEYS */;
INSERT INTO `hei` VALUES (1,'農民',80,0,50,0,0,'攻撃力を参照して物理攻撃をする'),(2,'武士(歩兵）',100,20,70,5000,0,'攻撃力を参照して物理攻撃をする'),(3,'弓兵（弓）',40,50,50,100,0,'攻撃力を参照して物理攻撃をする');
/*!40000 ALTER TABLE `hei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageName` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (116,'neko.jpeg'),(117,'è±è.jpeg'),(118,'gapu.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syomotu`
--

DROP TABLE IF EXISTS `syomotu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syomotu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namae` text NOT NULL,
  `iryoku` int(11) NOT NULL,
  `nedan` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syomotu`
--

LOCK TABLES `syomotu` WRITE;
/*!40000 ALTER TABLE `syomotu` DISABLE KEYS */;
INSERT INTO `syomotu` VALUES (1,'初心者向けの指南書',5,2000);
/*!40000 ALTER TABLE `syomotu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teki`
--

DROP TABLE IF EXISTS `teki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reberu` int(11) NOT NULL,
  `namae2` varchar(15) NOT NULL,
  `kougeki2` int(11) NOT NULL,
  `bougyo2` int(11) NOT NULL,
  `heisuu2` int(11) NOT NULL,
  `okane` int(11) NOT NULL,
  `kome` int(11) NOT NULL,
  `keikenti` int(11) NOT NULL,
  `memo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teki`
--

LOCK TABLES `teki` WRITE;
/*!40000 ALTER TABLE `teki` DISABLE KEYS */;
INSERT INTO `teki` VALUES (1,1,'スライム',60,0,20,100,0,8,'物理攻撃を仕掛けてくる相手\r\n初めはこれに勝てるようになってから。'),(2,3,'ゴブリン',70,20,40,200,100,10,'物理攻撃を仕掛けてくる相手\r\n油断は禁物');
/*!40000 ALTER TABLE `teki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `userID` text NOT NULL,
  `pass` text NOT NULL,
  `gazou` varchar(50) NOT NULL DEFAULT 'neko.jpeg',
  `kougekiryoku` int(11) NOT NULL DEFAULT '100',
  `bougyoryoku` int(11) NOT NULL DEFAULT '100',
  `mahoukougeki` int(11) NOT NULL DEFAULT '100',
  `mahoubougyo` int(11) NOT NULL DEFAULT '100',
  `syozikin` int(11) NOT NULL DEFAULT '3000',
  `kome` int(11) NOT NULL DEFAULT '3000',
  `bukinonamae` varchar(15) NOT NULL DEFAULT 'なし',
  `buki` int(11) NOT NULL DEFAULT '0',
  `bougunonamae` varchar(15) NOT NULL DEFAULT 'なし',
  `bougu` int(11) NOT NULL DEFAULT '0',
  `syomotunonamae` varchar(15) NOT NULL DEFAULT 'なし',
  `syomotu` int(11) NOT NULL DEFAULT '0',
  `hatanonamae` varchar(15) NOT NULL DEFAULT 'なし',
  `hata` int(11) NOT NULL DEFAULT '0',
  `heisyu` varchar(15) NOT NULL DEFAULT 'なし',
  `heisuu` int(11) NOT NULL DEFAULT '0',
  `kaikyuu` int(11) NOT NULL DEFAULT '0',
  `sentou` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (9,'es','es','$2b$10$A2eBE3tYVbZqurAI11eQ7u9h9Quu7v.GVRAEJCxVBeQuIY/ofYIja','neko.jpeg',144,112,105,102,3500,3000,'木の棒',5,'木の盾',5,'初心者向けの指南書',5,'白旗',5,'農民',44,304,1);
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

-- Dump completed on 2024-08-12 14:34:21
