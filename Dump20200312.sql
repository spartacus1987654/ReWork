CREATE DATABASE  IF NOT EXISTS `universita2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universita2`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: universita2
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `appello`
--

DROP TABLE IF EXISTS `appello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appello` (
  `idAppello` int NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Materia` int DEFAULT NULL,
  `aula` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idAppello`),
  KEY `da appello a corso_idx` (`Materia`),
  CONSTRAINT `da appello a corso` FOREIGN KEY (`Materia`) REFERENCES `corso` (`idcorso`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appello`
--

LOCK TABLES `appello` WRITE;
/*!40000 ALTER TABLE `appello` DISABLE KEYS */;
INSERT INTO `appello` (`idAppello`, `Data`, `Materia`, `aula`) VALUES (1,'2019-10-25',1,'Magna'),(2,'2019-12-01',2,'Grande'),(3,'2019-12-11',6,'Verde'),(48,'2019-10-25',5,'Aula1');
/*!40000 ALTER TABLE `appello` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corso`
--

DROP TABLE IF EXISTS `corso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corso` (
  `idcorso` int NOT NULL AUTO_INCREMENT,
  `Materia` varchar(25) DEFAULT NULL,
  `Cattedra` int DEFAULT NULL,
  PRIMARY KEY (`idcorso`),
  KEY `da corso a prof_idx` (`Cattedra`),
  CONSTRAINT `da corso a prof` FOREIGN KEY (`Cattedra`) REFERENCES `professore` (`idProfessore`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corso`
--

LOCK TABLES `corso` WRITE;
/*!40000 ALTER TABLE `corso` DISABLE KEYS */;
INSERT INTO `corso` (`idcorso`, `Materia`, `Cattedra`) VALUES (1,'Analisi I',5000),(2,'Fisica',5001),(5,'Fisica Tecnica',5002),(6,'Analisi II',5003);
/*!40000 ALTER TABLE `corso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazione`
--

DROP TABLE IF EXISTS `prenotazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazione` (
  `idpren` int NOT NULL AUTO_INCREMENT,
  `stud_prenotato` int DEFAULT NULL,
  `app_prenotato` int DEFAULT NULL,
  PRIMARY KEY (`idpren`),
  KEY `da prenotazione a stud_idx` (`stud_prenotato`),
  KEY `da prenotazione ad app_idx` (`app_prenotato`),
  CONSTRAINT `da prenotazione a stud` FOREIGN KEY (`stud_prenotato`) REFERENCES `studente` (`Matricola`),
  CONSTRAINT `da prenotazione ad app` FOREIGN KEY (`app_prenotato`) REFERENCES `appello` (`idAppello`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazione`
--

LOCK TABLES `prenotazione` WRITE;
/*!40000 ALTER TABLE `prenotazione` DISABLE KEYS */;
INSERT INTO `prenotazione` (`idpren`, `stud_prenotato`, `app_prenotato`) VALUES (6,1001,3),(7,1000,48);
/*!40000 ALTER TABLE `prenotazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professore`
--

DROP TABLE IF EXISTS `professore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professore` (
  `idProfessore` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varbinary(50) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProfessore`)
) ENGINE=InnoDB AUTO_INCREMENT=5007 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professore`
--

LOCK TABLES `professore` WRITE;
/*!40000 ALTER TABLE `professore` DISABLE KEYS */;
INSERT INTO `professore` (`idProfessore`, `username`, `password`, `nome`, `cognome`) VALUES (5000,'prof1',_binary 'ê©\0\Z¯â®ø´^≠Ñ>MÙ]','Giovanni','Boccaccio'),(5001,'prof2',_binary 'π2òıO˘è\ÓªAù\÷kÚ6+','Massimo','Pericolo'),(5002,'prof3',_binary '3\È\ﬁ?õ%Gk43\"n®Û','Luigi','Iuspa'),(5003,'prof4',_binary ')\“\'©\„tZ\ÏY®=5°M\¬','Fabio','Caressa'),(5004,'prof5',_binary '\‹ÒÉ\”“°\‚ENPv8XÄw','carlo','casa'),(5005,'prof6',_binary '∏O§-\Ì,x\«ßßˆê7','carlo','casa');
/*!40000 ALTER TABLE `professore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studente`
--

DROP TABLE IF EXISTS `studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studente` (
  `Matricola` int NOT NULL AUTO_INCREMENT,
  `username` varchar(10) DEFAULT NULL,
  `password` varbinary(50) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Matricola`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studente`
--

LOCK TABLES `studente` WRITE;
/*!40000 ALTER TABLE `studente` DISABLE KEYS */;
INSERT INTO `studente` (`Matricola`, `username`, `password`, `nome`, `cognome`) VALUES (1000,'stud1',_binary 'î\0úó¨⁄µ¯øG\\bîoV≤','Mario','Bruno'),(1001,'stud2',_binary 'Dvß>\»èøt?°6\·1õ','Jessica','Salzano');
/*!40000 ALTER TABLE `studente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-12 16:53:21
