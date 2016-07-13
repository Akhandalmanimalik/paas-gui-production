-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pass_overlay
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `acl`
--

DROP TABLE IF EXISTS `acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl` (
  `acl_id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_name` varchar(20) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `createdDTM` datetime NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`acl_id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `acl_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl`
--

LOCK TABLES `acl` WRITE;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;
INSERT INTO `acl` VALUES (3,'acl',7,'2016-06-15 20:35:23','acl37 descri'),(4,'acl2',7,'2016-06-19 23:04:35','acl22 desc'),(40,'acl40',2,'2016-06-25 18:57:26','acl40 des'),(42,'acl41',2,'2016-06-25 19:02:34','acl41 desc'),(46,'acl42',2,'2016-06-27 18:36:54','acl42'),(47,'prod_demo',7,'2016-07-02 17:06:36','prod_demo'),(48,'prod_rule',7,'2016-07-02 17:19:50','prod_rule'),(49,'we',7,'2016-07-02 17:23:35','we'),(50,'prodacl',7,'2016-07-02 17:27:18','prodacl'),(51,'prod-demo',7,'2016-07-02 17:45:23','prod-demo'),(52,'testingACL',7,'2016-07-03 16:59:03','testingACL'),(53,'acl21',7,'2016-07-04 18:13:33',NULL),(54,'acl',7,'2016-07-05 18:52:21','dasd'),(55,'sdfsdf',7,'2016-07-05 18:52:43','sdf'),(56,'aclCheck',7,'2016-07-10 15:08:57','acl desc'),(57,'aclCheck2',7,'2016-07-10 15:19:33','acl'),(58,'aclCheck3',7,'2016-07-10 15:50:49','kg'),(59,'aclCheck4',7,'2016-07-10 15:55:14','dedsdfsdf'),(60,'aclname1',7,'2016-07-10 16:00:24','ssdf'),(61,'acl12',7,'2016-07-10 16:27:17','acl'),(62,'new acl',7,'2016-07-11 11:01:22','acl'),(63,'acl02',7,'2016-07-11 11:06:51','acl'),(64,'test',7,'2016-07-11 11:09:36','test'),(65,'test1',7,'2016-07-11 11:17:11','test1'),(66,'acl03',7,'2016-07-11 11:27:59','acl'),(67,'acl test',7,'2016-07-12 15:33:17','acl'),(68,'aclname',7,'2016-07-12 15:48:37','acl'),(69,'acl1',7,'2016-07-12 15:51:51','acl');
/*!40000 ALTER TABLE `acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(30) DEFAULT NULL,
  `registry_url` varchar(50) DEFAULT NULL,
  `tag` varchar(30) NOT NULL COMMENT 'tag selected from docker hub registory',
  `run` varchar(150) NOT NULL COMMENT 'command to specified run application inside docker container',
  `host_name` varchar(50) DEFAULT NULL COMMENT 'Host name given by tenant Ex: local host',
  `host_port` int(11) NOT NULL COMMENT 'Host port given by tenant',
  `container_port` int(11) NOT NULL COMMENT 'Container port is given by tenant ( application is running is exposed with port)',
  `protocol_type` varchar(20) DEFAULT NULL,
  `port_index` int(11) NOT NULL DEFAULT '0' COMMENT 'Value given by tenant to marathan heath check up',
  `path` varchar(100) DEFAULT NULL COMMENT 'path given by tenant',
  `interval_seconds` int(11) NOT NULL DEFAULT '3600' COMMENT 'Value given by tenant to marathan heath check up',
  `timeout_seconds` int(11) NOT NULL DEFAULT '3600' COMMENT 'Value given by tenant to marathan heath check up',
  `max_consecutive_failures` int(11) NOT NULL DEFAULT '3600' COMMENT 'Value given by tenant to marathan heath check up',
  `grace_period_seconds` int(11) NOT NULL DEFAULT '3600' COMMENT 'Value given by tenant to marathan heath check up',
  `ignore_http1xx` int(11) DEFAULT NULL COMMENT 'Value given by tenant to marathan heath check up',
  `instance_count` int(11) NOT NULL COMMENT 'total application instance running defulat will one',
  `host_path` varchar(20) DEFAULT NULL,
  `container_path` varchar(20) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `subnet_id` int(11) NOT NULL COMMENT 'application deploayed given subnets id',
  `createdDTM` datetime DEFAULT NULL,
  `tenant_id` int(11) NOT NULL,
  `registry_id` int(11) NOT NULL,
  `container_id` int(11) NOT NULL,
  `apps_id` int(11) NOT NULL,
  `instance_id` varchar(20) NOT NULL,
  PRIMARY KEY (`app_id`),
  UNIQUE KEY `instance_id` (`instance_id`),
  KEY `subnet_id_idx` (`subnet_id`),
  KEY `registry_id` (`registry_id`),
  KEY `tenant_id` (`tenant_id`),
  KEY `container_id` (`container_id`),
  KEY `application_ibfk_6` (`apps_id`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`registry_id`) REFERENCES `image_registry` (`id`),
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`),
  CONSTRAINT `application_ibfk_4` FOREIGN KEY (`container_id`) REFERENCES `container_type` (`id`),
  CONSTRAINT `application_ibfk_6` FOREIGN KEY (`apps_id`) REFERENCES `applications` (`apps_id`) ON DELETE CASCADE,
  CONSTRAINT `subnet_id_app_FK` FOREIGN KEY (`subnet_id`) REFERENCES `subnet` (`subnet_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_variable`
--

DROP TABLE IF EXISTS `application_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varible_name` varchar(30) NOT NULL COMMENT 'Varible name given in application by tenant',
  `varible_value` varchar(150) NOT NULL COMMENT 'variable value  given in application by tenant',
  `app_id` int(11) NOT NULL COMMENT 'varibales are linked to the given application id',
  `createdDTM` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_id_idx` (`app_id`),
  CONSTRAINT `app_id_enironemnet_FK` FOREIGN KEY (`app_id`) REFERENCES `application` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_variable`
--

LOCK TABLES `application_variable` WRITE;
/*!40000 ALTER TABLE `application_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `apps_id` int(11) NOT NULL AUTO_INCREMENT,
  `applications_name` varchar(40) NOT NULL COMMENT 'Name  for  applictions given',
  `description` varchar(100) DEFAULT NULL,
  `tenant_id` int(11) NOT NULL COMMENT 'tenant referring  to applications',
  PRIMARY KEY (`apps_id`),
  KEY `tenant_id_apps_fk` (`tenant_id`),
  CONSTRAINT `tenant_id_apps_fk` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (2,'tomcat','test',12),(40,'purchase','syml purchase',2),(41,'Tomcat',NULL,7),(42,'Tomcat01','Tomcat01',7),(94,'testApp2',NULL,7),(95,'testApp3',NULL,7),(96,'testAppl4',NULL,7),(97,'TestApp',NULL,7),(98,'TestApp',NULL,7),(99,'Checking',NULL,7),(100,'TestApplication',NULL,7);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `container_type`
--

DROP TABLE IF EXISTS `container_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_type` varchar(20) DEFAULT NULL,
  `memory` int(11) NOT NULL COMMENT 'memory values ex : 1024',
  `tenan_id` int(11) NOT NULL,
  `createdDTM` datetime DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenat_id_idx` (`tenan_id`),
  CONSTRAINT `tenat_id_continer_type_FK` FOREIGN KEY (`tenan_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container_type`
--

LOCK TABLES `container_type` WRITE;
/*!40000 ALTER TABLE `container_type` DISABLE KEYS */;
INSERT INTO `container_type` VALUES (4,'512 MB',512,7,'2016-06-09 19:47:32','about tomcat123'),(5,'1 GB',1024,7,'2016-06-09 20:00:39','description of catalina5'),(8,'300 MB',300,2,'2016-06-27 15:53:31','300 MB'),(18,'200 MB',200,7,'2016-06-29 14:35:01','test');
/*!40000 ALTER TABLE `container_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environments`
--

DROP TABLE IF EXISTS `environments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `environments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `environment_name` varchar(20) DEFAULT NULL,
  `tenant_id` int(11) NOT NULL COMMENT 'tenant who created environment',
  `createdDTM` datetime NOT NULL,
  `description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenant_id_idx` (`tenant_id`),
  CONSTRAINT `tenant_id_environments_FK` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environments`
--

LOCK TABLES `environments` WRITE;
/*!40000 ALTER TABLE `environments` DISABLE KEYS */;
INSERT INTO `environments` VALUES (38,'dev38',2,'2016-06-27 18:24:23','developmente'),(39,'dev399',2,'2016-06-27 19:16:20','development'),(40,'env40',2,'2016-06-27 19:20:28','env40'),(45,'prod-environment',7,'2016-07-02 17:27:18',NULL),(46,'prod-demo',7,'2016-07-02 17:45:23','prod-demo'),(47,'testing',7,'2016-07-03 16:59:03','testing'),(48,'dev',7,'2016-07-04 18:13:33','asd'),(49,'devCheck',7,'2016-07-10 15:08:57','development'),(50,'devChec2',7,'2016-07-10 15:19:33','dev'),(51,'devCheck3',7,'2016-07-10 15:50:49','ghhg'),(52,'devCheck4',7,'2016-07-10 15:55:14','dev'),(53,'dev5',7,'2016-07-10 16:00:24','d'),(54,'sdf',7,'2016-07-10 16:23:09','sdfsdf'),(55,'dev11',7,'2016-07-10 16:25:00','dev'),(56,'dev12',7,'2016-07-10 16:27:17','dev'),(57,'new dev1',7,'2016-07-11 11:01:22','dev'),(58,'dev02',7,'2016-07-11 11:06:51','dev'),(59,'test',7,'2016-07-11 11:09:36','test'),(60,'test1',7,'2016-07-11 11:17:11','test1'),(61,'dev03',7,'2016-07-11 11:27:59','dev'),(62,'devs',7,'2016-07-12 15:33:17','dev'),(63,'dev2',7,'2016-07-12 15:48:37','dev'),(64,'dev1',7,'2016-07-12 15:51:51','dev'),(65,'dev3',7,'2016-07-12 19:24:05','dev');
/*!40000 ALTER TABLE `environments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_registry`
--

DROP TABLE IF EXISTS `image_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registory_name` varchar(30) NOT NULL COMMENT 'Docker Registory name given by tenant',
  `registory_url` varchar(50) NOT NULL COMMENT 'Docker Registory URL given by tenant  Ex.index.docker.io',
  `version` varchar(10) DEFAULT NULL COMMENT 'docker  registry  Api version given by tenant',
  `user_name` varchar(30) NOT NULL COMMENT 'User Name of Docker Hub Registory given by tenant',
  `password` varchar(30) NOT NULL COMMENT 'password of docker Hub Registory given by tenant',
  `tenant_id` int(11) NOT NULL COMMENT 'tenant Id referred  Docker Hub Registory',
  `createDTM` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tenant_id_idx` (`tenant_id`),
  CONSTRAINT `tenant_id_Image_registory_Fk` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_registry`
--

LOCK TABLES `image_registry` WRITE;
/*!40000 ALTER TABLE `image_registry` DISABLE KEYS */;
INSERT INTO `image_registry` VALUES (20,'vikash','vikashsingh005/pass',NULL,'vikashsingh005','bizruntime@123',7,'2016-06-10 21:42:13'),(25,'imageReg25','imageurl','1.0','image25','image25',2,'2016-06-27 14:28:34'),(26,'image266','imageurl26','1.0','image26uname','image26',2,'2016-06-27 14:30:09'),(27,'image27','image27url','2.0','image27u','image27',2,'2016-06-27 14:36:08'),(28,'image28','imageurl28','1.0','image28uname','image28',2,'2016-06-27 14:42:22'),(29,'imageRe29','imageReg29url','1.0','image29uname','image29',2,'2016-06-27 14:46:56'),(30,'imageReg30','repository30','2.0','username30','image30',2,'2016-06-27 15:15:02'),(31,'paas','paas','2.0','test','test',7,'2016-06-28 14:25:12'),(32,'imageRegTest','data/test','1.0','tester','tester',7,'2016-07-03 15:35:44'),(33,'testReg','data/test','1.0','uname1','uname1',7,'2016-07-03 15:40:14'),(34,'ImageRegistry','url','1.0','uname12','uname12',7,'2016-07-04 18:54:46'),(35,'imageTest1','dockerURL','1.0','abcdef@gmail.com','Malik@123',7,'2016-07-11 17:38:26'),(36,'DockerName222','dockerURL','1.0','abcdef@gmail.coms','Malik@123',7,'2016-07-11 17:43:21'),(37,'DockerName2','dockerURL','1.0','abcdef@gmail.com1','Malik@123',7,'2016-07-11 17:48:37'),(38,'aaa','sd','1.0','abcdef@gmail.comsqa','Malik@123a',7,'2016-07-11 17:51:57'),(39,'sdf','sdf','1.0','sdfdsf','sdfdfs',7,'2016-07-11 18:09:17'),(40,'DockerName1','dockerURL','2.0','abcdef@gmail.com','Malik@123',7,'2016-07-11 18:24:43'),(41,'sd','dockerURL','1.0','aaaaa','Bizruntime@123',7,'2016-07-11 18:26:07'),(42,'sdfsdf','sdf','1.0','akhandalmani','Bizruntime@123',7,'2016-07-11 18:29:48'),(43,'acl','dockerURL','1.0','abcdef@gmail.com','Malik@123s',7,'2016-07-11 18:44:46'),(44,'sdfsdf','dockerURL','1.0','abcdef@gmail.com','Malik@123',7,'2016-07-11 18:48:29');
/*!40000 ALTER TABLE `image_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inoutbound_rule`
--

DROP TABLE IF EXISTS `inoutbound_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inoutbound_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `protocol` varchar(30) NOT NULL,
  `protocol_range` varchar(30) NOT NULL,
  `inoutbound_type` varchar(15) NOT NULL,
  `source_ip` varchar(20) NOT NULL,
  `createDTM` datetime NOT NULL,
  `acl_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `acl_id` (`acl_id`),
  CONSTRAINT `inoutbound_rule_ibfk_1` FOREIGN KEY (`acl_id`) REFERENCES `acl` (`acl_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inoutbound_rule`
--

LOCK TABLES `inoutbound_rule` WRITE;
/*!40000 ALTER TABLE `inoutbound_rule` DISABLE KEYS */;
INSERT INTO `inoutbound_rule` VALUES (3,'http','tcp','0-6555','Out Bound','192.168.1.12','2016-06-21 19:28:45',4,'Allow'),(8,'TCP','Allow','All','In Bound','123.23.232.3','2016-06-22 18:50:08',3,'Deny'),(9,'UDP','Any Where','0-6555','Out Bound','123.23.232.32','2016-06-22 18:50:35',3,'Deny'),(10,'ftp','tcp','0','In Bound','123.23.232.33','2016-06-22 18:51:05',4,'Deny'),(11,'ftp','tcp','0','Out Bound','123.23.232.44','2016-06-22 18:51:25',4,'Allow'),(12,'HTTP','All Traffic','0-6555','In Bound','192.123.11.1','2016-06-25 18:59:27',40,'Allow'),(13,'TCP','All','0-6555','Out Bound','192.123.11.12','2016-06-25 19:00:14',40,'Deny'),(14,'UDP','Any Where','0-6555','In Bound','192.168.12.12','2016-06-25 19:20:18',40,'Deny'),(15,'HTTP','Allow','All','In Bound','192.122.1.12','2016-06-25 19:40:24',42,'Allow'),(17,'UDP','Any Where','All','Out Bound','192.122.1.122','2016-06-25 19:43:36',42,'Deny'),(18,'TCP','Allow','0-6555','Out Bound','123.123.122.212','2016-06-25 20:03:51',42,'Deny'),(19,'TCP','All Traffic','0-6555','In Bound','12.32.432.123','2016-06-25 20:08:43',42,'Deny'),(20,'HTTP','All','0-6555','In Bound','123.321.454.7','2016-06-25 20:28:05',42,'Allow'),(22,'TCP','All','0-6555','In Bound','123.321.454.7','2016-06-25 20:37:54',42,'Allow'),(24,'HTTP','All Traffic','0-6555','In Bound','123123123','2016-06-27 20:13:49',46,'Allow'),(25,'TCP','All Traffic','0-6555','Out Bound','132341112','2016-06-27 20:29:44',46,'Allow'),(26,'HTTP','All Traffic','All','In Bound','23234234324','2016-06-27 20:32:04',46,'Allow'),(29,'HTTP','All','All','Out Bound','234234234234','2016-06-27 20:48:45',40,'Allow');
/*!40000 ALTER TABLE `inoutbound_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `tenant_id` int(11) NOT NULL COMMENT 'tenant id ',
  `admin_id` int(11) NOT NULL COMMENT 'adminId  of tenant ',
  `email_id` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL COMMENT 'password given by tenant',
  `role_id` int(11) NOT NULL COMMENT 'role assigned to tenant',
  `createdDTM` datetime DEFAULT NULL,
  PRIMARY KEY (`tenant_id`,`admin_id`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`),
  KEY `admin_id_idx` (`admin_id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `admin_id_fk` FOREIGN KEY (`admin_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tenant_id_FK` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (2,2,'biz@gmail.com','BizRuntime',1,'2016-06-24 10:46:19'),(6,6,'abcdef@gmail.com','Malik@123',1,'2016-05-19 14:49:34'),(7,7,'manoj.prajapati@bizruntime.com','5f57c08b0edde89daf27cf82c746120d',1,'2016-05-19 18:07:24'),(9,9,'akhandalmani.malik@bizruntime.com','542e0376196b65b34d5fbd8302cdc2b6',1,'2016-05-20 12:19:16'),(10,10,'umar.faraz@gmail.com','622b67c6c6ed251c7ebac0fd9564f24e',1,'2016-05-31 14:48:29'),(11,11,'umar.faraz1@gmail.com','Umarfaraz123',1,'2016-05-31 14:58:46'),(12,12,'umar.faraz123@gmail.com','Umarfaraz123',1,'2016-05-31 15:00:59');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL COMMENT 'role name given defulat ex: admin, devops',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'devops');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subnet`
--

DROP TABLE IF EXISTS `subnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subnet` (
  `subnet_id` int(11) NOT NULL AUTO_INCREMENT,
  `subnet_name` varchar(20) NOT NULL COMMENT 'subnet name given by tenant',
  `cidr` varchar(20) DEFAULT NULL,
  `tenant_id` int(11) NOT NULL COMMENT 'tenant is linked with subnet which is created by him',
  `envirnoment_id` int(11) NOT NULL,
  `createdDTM` datetime NOT NULL,
  `vpc_id` int(11) DEFAULT NULL,
  `acl_id` int(11) NOT NULL,
  PRIMARY KEY (`subnet_id`),
  KEY `tenant_id_idx` (`tenant_id`),
  KEY `environment_id_Fk_idx` (`envirnoment_id`),
  KEY `vpc_id` (`vpc_id`),
  KEY `acl_id` (`acl_id`),
  CONSTRAINT `environment_id_Fk` FOREIGN KEY (`envirnoment_id`) REFERENCES `environments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `subnet_ibfk_1` FOREIGN KEY (`vpc_id`) REFERENCES `vpc` (`vpc_id`),
  CONSTRAINT `subnet_ibfk_2` FOREIGN KEY (`acl_id`) REFERENCES `acl` (`acl_id`),
  CONSTRAINT `tenant_id_subnet_Fk` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subnet`
--

LOCK TABLES `subnet` WRITE;
/*!40000 ALTER TABLE `subnet` DISABLE KEYS */;
INSERT INTO `subnet` VALUES (17,'devsubmet13','123',2,38,'2016-06-27 18:25:13',48,40),(19,'devsubnet21','10.10.10.0/24',2,38,'2016-06-27 18:43:32',48,40),(89,'devSubnet','10.10.10.0/24',7,48,'2016-07-10 00:18:43',49,54),(90,'devSubnet2','10.10.10.0/24',7,48,'2016-07-10 01:07:30',49,54),(94,'devSubnet03','10.10.10.0/24',7,61,'2016-07-11 11:27:59',78,66),(96,'devSubnetTesting12','10.10.10.0/24',7,45,'2016-07-11 15:23:50',49,54),(97,'devSubnet111','10.10.10.0/24',7,46,'2016-07-11 15:25:06',49,54),(98,'devSub','10.10.10.0/24',7,47,'2016-07-11 15:34:18',50,54),(99,'devSubnet2','10.10.10.0/24',7,47,'2016-07-11 15:38:57',50,4),(105,'subnet','10.10.10.0/24',7,49,'2016-07-11 16:35:55',61,53),(106,'devSubnet122','10.10.10.0/24',7,53,'2016-07-11 17:19:06',49,58),(107,'devSubnet','10.10.10.0/24',7,56,'2016-07-11 17:19:47',62,54),(109,'devSubnet11','10.10.10.0/24',7,46,'2016-07-11 17:42:57',52,55),(116,'devSubnetTest','10.10.10.0/24',7,48,'2016-07-12 13:32:32',51,54),(117,'devSubnetTes','10.10.10.0/24',7,62,'2016-07-12 15:33:17',79,67),(118,'devSubnet02','10.10.10.0/24',7,63,'2016-07-12 15:48:37',80,68),(119,'devSubnet1','10.10.10.0/24',7,64,'2016-07-12 15:51:51',81,69),(120,'subnetTest1','10.10.10.0/24',7,45,'2016-07-12 18:43:59',49,54),(121,'devSubnet3','10.10.10.0/24',7,56,'2016-07-12 19:24:43',49,53);
/*!40000 ALTER TABLE `subnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant` (
  `tenant_id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(20) NOT NULL COMMENT 'tenant name ',
  `tenant_email` varchar(50) DEFAULT NULL,
  `company_name` varchar(40) NOT NULL COMMENT 'tenant company name',
  `company_address` varchar(80) NOT NULL COMMENT 'tenant company address',
  `createdDTM` datetime NOT NULL,
  PRIMARY KEY (`tenant_id`),
  UNIQUE KEY `tenant_email_UNIQUE` (`tenant_email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` VALUES (2,'BizRuntime','bizruntime@gmail.com','Bizruntime','Sarjapur','2016-05-18 20:30:42'),(3,'tenant2','aaa@gmailcom','Bizruntime It','Wipro Gate','2016-05-19 12:49:13'),(4,'tenant1','pqr@gmailcom','Bizruntime Hro','Dodakanneli','2016-05-19 14:40:20'),(5,'tenant2','abc@gmail.com','Bizruntime Hro','Dodakanneli','2016-05-19 14:43:39'),(6,'tenant1','abcdef@gmail.com','Bizruntime Hro','Dodakanneli','2016-05-19 14:49:34'),(7,'tenant1','manoj.prajapati@bizruntime.com','Biz','Bangalore','2016-05-19 18:07:24'),(8,'tenant1','abcd@gmailcom','BizRuntime IT Services pvt ltd','Bangalore','2016-05-20 12:14:50'),(9,'tenant1','akhandalmani.malik@bizruntime.com','BizRuntime IT Services pvt ltd','Bangalore','2016-05-20 12:19:16'),(10,'umar','umar.faraz@gmail.com','oracle','itpl','2016-05-31 14:48:29'),(11,'umar1','umar.faraz1@gmail.com','oracle1','itpl','2016-05-31 14:58:46'),(12,'umar2','umar.faraz123@gmail.com','huwai','china','2016-05-31 15:00:59');
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpc`
--

DROP TABLE IF EXISTS `vpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vpc` (
  `vpc_id` int(11) NOT NULL AUTO_INCREMENT,
  `vpc_name` varchar(20) NOT NULL,
  `createdDTM` datetime DEFAULT NULL,
  `tenant_id` int(11) NOT NULL,
  `acl_id` int(11) DEFAULT NULL,
  `cidr` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`vpc_id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `vpc_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpc`
--

LOCK TABLES `vpc` WRITE;
/*!40000 ALTER TABLE `vpc` DISABLE KEYS */;
INSERT INTO `vpc` VALUES (41,'vpcname41','2016-06-22 21:16:36',6,0,NULL),(48,'vpcnam48','2016-06-25 18:18:42',2,46,NULL),(49,'vpcdemo','2016-07-02 17:45:23',7,0,NULL),(50,'vpc_demo02','2016-07-02 17:46:14',7,51,'vpc_demo02'),(51,'vpctest','2016-07-03 15:02:09',7,3,'10.10.10.0/24'),(52,'vpcname41','2016-07-03 15:07:45',7,3,'10.10.10.0/24'),(56,'vpcdemo03','2016-07-03 16:53:27',7,3,'20.20.20.0/24'),(57,'vpcdemo04','2016-07-03 16:59:03',7,54,'10.10.10.0/24'),(61,'vpctest222','2016-07-05 13:15:19',7,3,'10.10.10.0/24'),(62,'vpctes','2016-07-05 13:16:07',7,4,'10.10.10.0/24'),(78,'vpc03','2016-07-11 11:27:59',7,0,NULL),(79,'vpc','2016-07-12 15:33:17',7,0,NULL),(80,'newVpc','2016-07-12 15:48:37',7,0,NULL),(81,'vpc1','2016-07-12 15:51:51',7,0,NULL);
/*!40000 ALTER TABLE `vpc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-13 14:42:00
