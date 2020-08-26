CREATE DATABASE  IF NOT EXISTS `ql_maybay` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ql_maybay`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: ql_maybay
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `chuyen_bay`
--

DROP TABLE IF EXISTS `chuyen_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuyen_bay` (
  `machuyenbay` int NOT NULL AUTO_INCREMENT,
  `ngaykhoihanh` date NOT NULL,
  `giocatcanh` time NOT NULL,
  `mamaybay` int NOT NULL,
  `matuyenbay` int NOT NULL,
  `ghichu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`machuyenbay`),
  KEY `mamaybay` (`mamaybay`),
  KEY `matuyenbay` (`matuyenbay`),
  CONSTRAINT `chuyen_bay_ibfk_1` FOREIGN KEY (`mamaybay`) REFERENCES `may_bay` (`mamaybay`),
  CONSTRAINT `chuyen_bay_ibfk_2` FOREIGN KEY (`matuyenbay`) REFERENCES `tuyen_bay` (`matuyenbay`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyen_bay`
--

LOCK TABLES `chuyen_bay` WRITE;
/*!40000 ALTER TABLE `chuyen_bay` DISABLE KEYS */;
INSERT INTO `chuyen_bay` VALUES (1,'2017-06-15','12:00:00',1,1,'asadasd'),(2,'2020-07-03','09:00:00',2,2,'asdasd');
/*!40000 ALTER TABLE `chuyen_bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_tai_khoan`
--

DROP TABLE IF EXISTS `loai_tai_khoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_tai_khoan` (
  `maloai` int NOT NULL AUTO_INCREMENT,
  `tenloai` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_tai_khoan`
--

LOCK TABLES `loai_tai_khoan` WRITE;
/*!40000 ALTER TABLE `loai_tai_khoan` DISABLE KEYS */;
INSERT INTO `loai_tai_khoan` VALUES (1,'admin'),(2,'nhanvien'),(3,'khachhang');
/*!40000 ALTER TABLE `loai_tai_khoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_ve`
--

DROP TABLE IF EXISTS `loai_ve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_ve` (
  `maloaive` int NOT NULL AUTO_INCREMENT,
  `tenloaive` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloaive`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_ve`
--

LOCK TABLES `loai_ve` WRITE;
/*!40000 ALTER TABLE `loai_ve` DISABLE KEYS */;
INSERT INTO `loai_ve` VALUES (1,'loai 1'),(2,'loai 2');
/*!40000 ALTER TABLE `loai_ve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `may_bay`
--

DROP TABLE IF EXISTS `may_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `may_bay` (
  `mamaybay` int NOT NULL AUTO_INCREMENT,
  `tenmaybay` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenhang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`mamaybay`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `may_bay`
--

LOCK TABLES `may_bay` WRITE;
/*!40000 ALTER TABLE `may_bay` DISABLE KEYS */;
INSERT INTO `may_bay` VALUES (1,'vietjet1','vietjet'),(2,'vietjet2','vietjet'),(3,'vietjet3','vietjet');
/*!40000 ALTER TABLE `may_bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_dung` (
  `manguoidung` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cmnd` int NOT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diachi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioitinh` tinyint(1) NOT NULL,
  PRIMARY KEY (`manguoidung`),
  CONSTRAINT `nguoi_dung_chk_1` CHECK ((`gioitinh` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
INSERT INTO `nguoi_dung` VALUES (1,'admin',123123,'123123','admin','admin',1);
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_bay`
--

DROP TABLE IF EXISTS `san_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `san_bay` (
  `masanbay` int NOT NULL AUTO_INCREMENT,
  `tensanbay` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diadiem` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`masanbay`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_bay`
--

LOCK TABLES `san_bay` WRITE;
/*!40000 ALTER TABLE `san_bay` DISABLE KEYS */;
INSERT INTO `san_bay` VALUES (1,'Tân sơn nhất','HCM'),(2,'Nội bài','HN'),(3,'Sân bay đà nẵng','DN');
/*!40000 ALTER TABLE `san_bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_cho_ngoi`
--

DROP TABLE IF EXISTS `so_cho_ngoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_cho_ngoi` (
  `machuyenbay` int NOT NULL,
  `maloaive` int NOT NULL,
  `soluong` int NOT NULL,
  `giave` decimal(11,2) NOT NULL,
  PRIMARY KEY (`machuyenbay`,`maloaive`),
  KEY `maloaive` (`maloaive`),
  CONSTRAINT `so_cho_ngoi_ibfk_1` FOREIGN KEY (`machuyenbay`) REFERENCES `chuyen_bay` (`machuyenbay`),
  CONSTRAINT `so_cho_ngoi_ibfk_2` FOREIGN KEY (`maloaive`) REFERENCES `loai_ve` (`maloaive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_cho_ngoi`
--

LOCK TABLES `so_cho_ngoi` WRITE;
/*!40000 ALTER TABLE `so_cho_ngoi` DISABLE KEYS */;
INSERT INTO `so_cho_ngoi` VALUES (1,1,20,200.00),(1,2,40,100.00),(2,1,15,400.00),(2,2,55,150.00);
/*!40000 ALTER TABLE `so_cho_ngoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tai_khoan`
--

DROP TABLE IF EXISTS `tai_khoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tai_khoan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tentaikhoan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matkhau` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `manguoidung` int NOT NULL,
  `maloai` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manguoidung` (`manguoidung`),
  KEY `maloai` (`maloai`),
  CONSTRAINT `tai_khoan_ibfk_1` FOREIGN KEY (`manguoidung`) REFERENCES `nguoi_dung` (`manguoidung`),
  CONSTRAINT `tai_khoan_ibfk_2` FOREIGN KEY (`maloai`) REFERENCES `loai_tai_khoan` (`maloai`),
  CONSTRAINT `tai_khoan_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoan`
--

LOCK TABLES `tai_khoan` WRITE;
/*!40000 ALTER TABLE `tai_khoan` DISABLE KEYS */;
INSERT INTO `tai_khoan` VALUES (1,'admin','202cb962ac59075b964b07152d234b70',1,1,1);
/*!40000 ALTER TABLE `tai_khoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuyen_bay`
--

DROP TABLE IF EXISTS `tuyen_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuyen_bay` (
  `matuyenbay` int NOT NULL AUTO_INCREMENT,
  `thoigianbay` int NOT NULL,
  `masanbaycatcanh` int NOT NULL,
  `masanbayhacanh` int NOT NULL,
  PRIMARY KEY (`matuyenbay`),
  KEY `masanbaycatcanh` (`masanbaycatcanh`),
  KEY `masanbayhacanh` (`masanbayhacanh`),
  CONSTRAINT `tuyen_bay_ibfk_1` FOREIGN KEY (`masanbaycatcanh`) REFERENCES `san_bay` (`masanbay`),
  CONSTRAINT `tuyen_bay_ibfk_2` FOREIGN KEY (`masanbayhacanh`) REFERENCES `san_bay` (`masanbay`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuyen_bay`
--

LOCK TABLES `tuyen_bay` WRITE;
/*!40000 ALTER TABLE `tuyen_bay` DISABLE KEYS */;
INSERT INTO `tuyen_bay` VALUES (1,200,1,3),(2,350,1,2);
/*!40000 ALTER TABLE `tuyen_bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ve_may_bay`
--

DROP TABLE IF EXISTS `ve_may_bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ve_may_bay` (
  `mave` int NOT NULL AUTO_INCREMENT,
  `ngaykhoitao` datetime NOT NULL,
  `maloaive` int NOT NULL,
  `machuyenbay` int NOT NULL,
  `manguoidung` int NOT NULL,
  `lydohuy` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phihuy` decimal(11,2) DEFAULT NULL,
  `giamgia` float DEFAULT NULL,
  PRIMARY KEY (`mave`),
  KEY `maloaive` (`maloaive`),
  KEY `machuyenbay` (`machuyenbay`),
  KEY `manguoidung` (`manguoidung`),
  CONSTRAINT `ve_may_bay_ibfk_1` FOREIGN KEY (`maloaive`) REFERENCES `loai_ve` (`maloaive`),
  CONSTRAINT `ve_may_bay_ibfk_2` FOREIGN KEY (`machuyenbay`) REFERENCES `chuyen_bay` (`machuyenbay`),
  CONSTRAINT `ve_may_bay_ibfk_3` FOREIGN KEY (`manguoidung`) REFERENCES `nguoi_dung` (`manguoidung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ve_may_bay`
--

LOCK TABLES `ve_may_bay` WRITE;
/*!40000 ALTER TABLE `ve_may_bay` DISABLE KEYS */;
/*!40000 ALTER TABLE `ve_may_bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ql_maybay'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-24  9:28:41
