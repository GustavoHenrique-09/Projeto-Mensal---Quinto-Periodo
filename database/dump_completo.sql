/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.10-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: berenice
-- ------------------------------------------------------
-- Server version	11.4.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Current Database: `berenice`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `berenice` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `berenice`;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_added` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(1,'2026-04-29 23:32:28.274714','teste',10),
(2,'2026-05-15 01:42:53.068117','ps2',300),
(3,'2026-05-15 01:42:53.424831','ps2',300),
(4,'2026-05-15 01:42:55.095528','ps2',300),
(5,'2026-06-03 22:07:30.140815','mousepad Razer',50),
(6,'2026-06-09 19:26:39.544416','televisao',2000),
(7,'2026-06-09 22:41:30.938042','jaqueta',300);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ROLE_USER','ROLE_ADMIN') NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Administrador','$2a$10$STOG8uDLih6afbDI5gc1xez96o2dL9oBh3Gqdmj8ZsCdg4QrH3RQW','ROLE_ADMIN','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `keycloak`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `keycloak` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `keycloak`;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text DEFAULT NULL,
  `REPRESENTATION` text DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  `DETAILS_JSON` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` tinyint(1) NOT NULL DEFAULT 0,
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES
('00cf78b6-255b-4270-8102-d4d3159ebd81',NULL,'federated-jwt','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','982eaab7-81bf-4a70-a11b-c89311e0540f',2,50,0,NULL,NULL),
('07cd6613-544c-45ad-9ac1-1bef2c4de588',NULL,'idp-create-user-if-unique','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','931bbab9-5b97-45f2-9b3e-215ff8a1aaf4',2,10,0,NULL,'72b4dd2a-1499-4e4e-b3be-4f2ecb1ca873'),
('0915d0b2-a385-49e0-a98e-8d4047cc96be',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f4a563bd-18e0-4be9-874d-5522d9843038',1,40,1,'dc5c4712-e87b-4a7c-91bd-f32da386f595',NULL),
('09407b72-4bdf-4bc8-9ab3-5017c0fa1574',NULL,'conditional-user-configured','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f88e1234-d8fd-4f03-94dd-62d2ffca071b',0,10,0,NULL,NULL),
('10c9f17a-20c5-413f-96e5-336d0dbc3338',NULL,NULL,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','d6090a55-4d5f-492b-9e34-4edcc5f36dcd',1,20,1,'8898132c-0d0b-4ed0-bab9-22485c8a42b7',NULL),
('16bfaaaa-77e2-4c92-9e3f-f954506f6ddd',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','c919e3c8-52bb-4749-bd40-bf0e80af7bad',2,30,1,'d6b2c116-7a5f-41b8-91ac-78c38674a0e6',NULL),
('1a76bd33-682e-4ba5-883c-c41496bfd7af',NULL,'http-basic-authenticator','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','1ea4a2a1-2f10-4e8c-a27d-f064939a7274',0,10,0,NULL,NULL),
('244b5076-1d30-4794-8dbb-d2c088ecb048',NULL,'conditional-credential','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','844cfce2-5c6b-422b-b285-74398c08f3e3',0,20,0,NULL,'6652d5b6-46a6-49b6-b77b-c9655f3365aa'),
('2b4483de-3be3-454a-838c-225d95db85c6',NULL,'idp-email-verification','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','517659bd-c57b-461f-9592-2e02a770ac1c',2,10,0,NULL,NULL),
('2ebbc08f-97e3-44a8-a6d9-97ea4352a55a',NULL,'identity-provider-redirector','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','c919e3c8-52bb-4749-bd40-bf0e80af7bad',2,25,0,NULL,NULL),
('2fb83515-b146-46c2-b6ac-3b54fd604d3c',NULL,'registration-user-creation','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','19925387-53e9-4da0-baa1-5a3bdc83fb4c',0,20,0,NULL,NULL),
('303fe49f-969d-4860-841a-618331519b1c',NULL,'auth-recovery-authn-code-form','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','ec8b7dc1-baba-493c-b576-a7868489fa05',3,50,0,NULL,NULL),
('320ef3f2-851d-4672-8f16-25a9f8563e32',NULL,'registration-recaptcha-action','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','19925387-53e9-4da0-baa1-5a3bdc83fb4c',3,60,0,NULL,NULL),
('32104a17-9575-46e2-9628-6d5576cf6c14',NULL,'webauthn-authenticator','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','2057abf2-32f6-4d79-a0f6-1f46b5a6a915',3,40,0,NULL,NULL),
('3450af51-0c8d-49aa-b445-f5368c8b5289',NULL,'auth-username-password-form','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','d6b2c116-7a5f-41b8-91ac-78c38674a0e6',0,10,0,NULL,NULL),
('356ab460-026b-4e57-9487-34bcd6ad0725',NULL,NULL,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','64c0f382-49f7-441d-9e63-5abc1480990e',2,30,1,'8ad01141-add6-4e7b-b722-ab374b3080d6',NULL),
('36cc87f5-fadd-4ce1-be39-a287ef21b32a',NULL,NULL,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','33d077b2-f372-4987-8a67-c9bd83e8ca98',2,20,1,'d6090a55-4d5f-492b-9e34-4edcc5f36dcd',NULL),
('3b6d09b9-777b-4413-b104-aa5ba21c3c28',NULL,'reset-credentials-choose-user','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f4a563bd-18e0-4be9-874d-5522d9843038',0,10,0,NULL,NULL),
('3b999275-4be8-4ca0-877a-365490923408',NULL,'registration-terms-and-conditions','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','19925387-53e9-4da0-baa1-5a3bdc83fb4c',3,70,0,NULL,NULL),
('3c9d8f29-06ce-4553-9359-96f647e3c079',NULL,'direct-grant-validate-otp','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','9acea4ae-5ec2-44a3-8611-3c4e2091507a',0,20,0,NULL,NULL),
('3ee2333e-9780-4594-bd27-6bb6ef09a88b',NULL,'client-x509','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f1088438-def1-4337-a6c0-710f7488489a',2,40,0,NULL,NULL),
('42c98636-eaf2-405d-b0f9-c5b6929147e4',NULL,'idp-email-verification','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','33d077b2-f372-4987-8a67-c9bd83e8ca98',2,10,0,NULL,NULL),
('43b60c28-0dc3-433f-979f-54b935d45bfe',NULL,'auth-otp-form','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','844cfce2-5c6b-422b-b285-74398c08f3e3',2,30,0,NULL,NULL),
('44747d99-b277-4d6b-9372-b2dfcf2d78f9',NULL,'direct-grant-validate-password','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','dcce4c9a-5a82-4bf7-8b04-aef074fb9801',0,20,0,NULL,NULL),
('47888a25-51ab-453d-9258-2da1694d01d6',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','55408152-63b9-4138-9c74-4fedb62727f8',0,20,1,'517659bd-c57b-461f-9592-2e02a770ac1c',NULL),
('487ed50c-0fa7-4124-8e61-c2919d6e2ffc',NULL,'auth-recovery-authn-code-form','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','844cfce2-5c6b-422b-b285-74398c08f3e3',3,50,0,NULL,NULL),
('4923a4e7-4c72-40cc-a444-9b0186cad410',NULL,'registration-password-action','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','82d17c7f-3583-4cd1-ac8b-ab00433294f9',0,50,0,NULL,NULL),
('4a9d5058-cb96-45c0-a6ea-80575d1df39c',NULL,'conditional-user-configured','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','450474c0-a63b-4569-b9dc-c83ba2b4e526',0,10,0,NULL,NULL),
('4f6adbd2-f6db-4256-adf6-a1205759177b',NULL,'client-secret-jwt','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','982eaab7-81bf-4a70-a11b-c89311e0540f',2,30,0,NULL,NULL),
('5031f498-f876-486b-b6ae-b2c1578bcd65',NULL,'registration-terms-and-conditions','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','82d17c7f-3583-4cd1-ac8b-ab00433294f9',3,70,0,NULL,NULL),
('532d65d0-33c1-4370-86cc-e0968701f163',NULL,'conditional-user-configured','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','ec8b7dc1-baba-493c-b576-a7868489fa05',0,10,0,NULL,NULL),
('534bc982-ca46-4bde-a060-3dffe84e4820',NULL,'idp-add-organization-member','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','9b489ccd-43b2-41ca-ae39-327fde0db1fa',0,20,0,NULL,NULL),
('55e7908a-d032-4e18-8e41-31e9a00fcab1',NULL,'client-secret-jwt','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f1088438-def1-4337-a6c0-710f7488489a',2,30,0,NULL,NULL),
('584b8c31-1437-41c1-bd30-f3f1e00101ca',NULL,'conditional-user-configured','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','844cfce2-5c6b-422b-b285-74398c08f3e3',0,10,0,NULL,NULL),
('5981e4b1-ce83-4164-b736-96ca6be85160',NULL,'direct-grant-validate-otp','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','450474c0-a63b-4569-b9dc-c83ba2b4e526',0,20,0,NULL,NULL),
('5cb6f103-c7da-4cae-996a-ae848dabe871',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','2569b223-47d2-45da-afe9-8ab847fc4a32',1,60,1,'9b489ccd-43b2-41ca-ae39-327fde0db1fa',NULL),
('5fa4f289-1bae-4983-adc5-1e1eed2c9515',NULL,'docker-http-basic-authenticator','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','97858a4b-935e-4ad8-a5f2-bc43510e841f',0,10,0,NULL,NULL),
('62761046-6384-4476-9123-adec1c7e322c',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','c919e3c8-52bb-4749-bd40-bf0e80af7bad',2,26,1,'0b53eec5-3239-401c-a8d8-702abb38f946',NULL),
('62ccc77d-eb15-4308-8356-beb834ba3afb',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','d6b2c116-7a5f-41b8-91ac-78c38674a0e6',1,20,1,'2057abf2-32f6-4d79-a0f6-1f46b5a6a915',NULL),
('67018317-68fb-4e1a-a875-89cb5ec46eff',NULL,'auth-otp-form','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','ec8b7dc1-baba-493c-b576-a7868489fa05',2,30,0,NULL,NULL),
('6835d8f9-19c1-446d-b1e7-6c43ac902efc',NULL,'direct-grant-validate-password','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','309c1a81-f18e-444d-8962-ae3e50181b39',0,20,0,NULL,NULL),
('6e964553-d55b-4131-9347-01aef5c36a14',NULL,'registration-page-form','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','b3f99c08-9099-4417-9ab1-07310d62f963',0,10,1,'82d17c7f-3583-4cd1-ac8b-ab00433294f9',NULL),
('719decd1-af91-44fa-abf9-b5999a7e904a',NULL,'reset-otp','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','5d8af649-f2ad-4904-98dd-f931d6427043',0,20,0,NULL,NULL),
('778cf8bf-7502-490d-becf-f86ddc778c0e',NULL,'http-basic-authenticator','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','63429152-e91f-4d54-84aa-da8198c53565',0,10,0,NULL,NULL),
('78f82f82-e9b6-4f57-8197-1364bc90e31d',NULL,'reset-credential-email','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f4a563bd-18e0-4be9-874d-5522d9843038',0,20,0,NULL,NULL),
('7a68f493-c61d-4f7c-9bd7-70f8f63ae082',NULL,'client-x509','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','982eaab7-81bf-4a70-a11b-c89311e0540f',2,40,0,NULL,NULL),
('7b829bb6-617a-4856-a520-8d7f222007d9',NULL,'idp-confirm-link','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','55408152-63b9-4138-9c74-4fedb62727f8',0,10,0,NULL,NULL),
('7d7d1233-bb71-4ddd-8b0b-668857a8ca62',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','8d8be6ef-d405-42cf-bc47-620396d19bcd',2,20,1,'55408152-63b9-4138-9c74-4fedb62727f8',NULL),
('7dccd70d-ebae-49b6-847d-d939cba6b547',NULL,'reset-credential-email','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','3838fdad-d4e3-4f52-897a-a7eef9af65fc',0,20,0,NULL,NULL),
('7e7b1222-921a-461b-8491-ea7e264946dc',NULL,'federated-jwt','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f1088438-def1-4337-a6c0-710f7488489a',2,50,0,NULL,NULL),
('7ed78037-c0ea-41d4-8312-b64777b13500',NULL,'idp-create-user-if-unique','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','8d8be6ef-d405-42cf-bc47-620396d19bcd',2,10,0,NULL,'084e71d4-568e-4872-a80a-b4574c7f0121'),
('81c9be60-74b7-4a1a-945e-425e242f6774',NULL,'conditional-credential','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','8898132c-0d0b-4ed0-bab9-22485c8a42b7',0,20,0,NULL,'247d1ded-b72e-4af0-849e-17f76a7c9fc5'),
('83588ebf-e88f-48c6-bc1c-8f1cf90824bd',NULL,'client-jwt','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f1088438-def1-4337-a6c0-710f7488489a',2,20,0,NULL,NULL),
('85cc2b7b-7aeb-4593-b199-9edcbaf1350b',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','517659bd-c57b-461f-9592-2e02a770ac1c',2,20,1,'8c76ace5-a726-4e90-af7e-9bdfeacd28d1',NULL),
('87395d21-78cb-48cf-bfec-ef8b046410ca',NULL,'organization','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f88e1234-d8fd-4f03-94dd-62d2ffca071b',2,20,0,NULL,NULL),
('88df07d9-f71e-4a9e-93ca-01561bd396a9',NULL,'idp-review-profile','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','198749c8-9d7e-44be-8261-112c7fff13ea',0,10,0,NULL,'f8cfa146-6700-4eb9-8a52-55973b94cb25'),
('8b56a1d6-bb70-419d-bda0-a4cd9af2833e',NULL,'webauthn-authenticator','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','844cfce2-5c6b-422b-b285-74398c08f3e3',3,40,0,NULL,NULL),
('8b629411-89b5-4ef7-ab19-f0562fadd4aa',NULL,'direct-grant-validate-username','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','dcce4c9a-5a82-4bf7-8b04-aef074fb9801',0,10,0,NULL,NULL),
('9197211b-cee9-473e-8daf-8b192b5a79f7',NULL,'registration-password-action','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','19925387-53e9-4da0-baa1-5a3bdc83fb4c',0,50,0,NULL,NULL),
('92f85600-ace6-412c-8f3c-4b37123b065f',NULL,'auth-cookie','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','64c0f382-49f7-441d-9e63-5abc1480990e',2,10,0,NULL,NULL),
('94fa88d9-ce5a-4edd-956e-1aefca746378',NULL,'idp-review-profile','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','2569b223-47d2-45da-afe9-8ab847fc4a32',0,10,0,NULL,'d33b63e9-5204-4c69-a4a5-5765398e46d0'),
('9610d9e9-a45b-47d8-8e30-670821f6cafb',NULL,'idp-username-password-form','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','8c76ace5-a726-4e90-af7e-9bdfeacd28d1',0,10,0,NULL,NULL),
('96657d7d-f08d-45cb-bc8b-3c36b7169ad7',NULL,'webauthn-authenticator','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','ec8b7dc1-baba-493c-b576-a7868489fa05',3,40,0,NULL,NULL),
('969a839d-84d4-40ef-aa38-09bc4b3a9968',NULL,'reset-otp','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','dc5c4712-e87b-4a7c-91bd-f32da386f595',0,20,0,NULL,NULL),
('99e8fe0d-fd5c-44c1-a5b0-05a199b31a6c',NULL,NULL,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','6e034d00-7d3e-4106-b387-3559a137c383',0,20,1,'33d077b2-f372-4987-8a67-c9bd83e8ca98',NULL),
('9c18d633-db7f-430b-966d-1966eb514eb3',NULL,'auth-recovery-authn-code-form','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','8898132c-0d0b-4ed0-bab9-22485c8a42b7',3,50,0,NULL,NULL),
('9f60b01c-0269-4731-bd15-ebd3a3982f3d',NULL,'client-secret','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','982eaab7-81bf-4a70-a11b-c89311e0540f',2,10,0,NULL,NULL),
('a0c0318b-14fd-43b6-a49f-d7c807afaa58',NULL,'conditional-user-configured','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','2057abf2-32f6-4d79-a0f6-1f46b5a6a915',0,10,0,NULL,NULL),
('a4688f75-4f04-4aad-8bcc-21ea415fb8e7',NULL,'conditional-user-configured','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','dc5c4712-e87b-4a7c-91bd-f32da386f595',0,10,0,NULL,NULL),
('a6c004f2-9658-491e-b8a6-8fe04e456e15',NULL,NULL,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','dcce4c9a-5a82-4bf7-8b04-aef074fb9801',1,30,1,'9acea4ae-5ec2-44a3-8611-3c4e2091507a',NULL),
('ad4ac9b2-2d7f-4140-aa96-dbfdde7bb4c7',NULL,'auth-spnego','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','c919e3c8-52bb-4749-bd40-bf0e80af7bad',3,20,0,NULL,NULL),
('ad59cb4c-5788-44fa-8f70-62c1c3bf68b5',NULL,NULL,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','8ad01141-add6-4e7b-b722-ab374b3080d6',1,20,1,'ec8b7dc1-baba-493c-b576-a7868489fa05',NULL),
('af3d9160-9053-46b5-8a44-8e3f472474cc',NULL,'auth-spnego','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','64c0f382-49f7-441d-9e63-5abc1480990e',3,20,0,NULL,NULL),
('b18d8012-d430-441e-a140-a21b7c5af149',NULL,'conditional-user-configured','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','9acea4ae-5ec2-44a3-8611-3c4e2091507a',0,10,0,NULL,NULL),
('b978f902-13d1-4148-81e4-61dbbcfebe09',NULL,'idp-confirm-link','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','6e034d00-7d3e-4106-b387-3559a137c383',0,10,0,NULL,NULL),
('bdb98681-e954-48d4-8ff6-80d89586bdd3',NULL,'reset-password','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f4a563bd-18e0-4be9-874d-5522d9843038',0,30,0,NULL,NULL),
('be898ebe-0722-4488-b2d2-1a8fc8b7a420',NULL,'auth-otp-form','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','8898132c-0d0b-4ed0-bab9-22485c8a42b7',2,30,0,NULL,NULL),
('c109f103-dc4d-4d4d-ad24-ed6bd0ff22f0',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','8c76ace5-a726-4e90-af7e-9bdfeacd28d1',1,20,1,'844cfce2-5c6b-422b-b285-74398c08f3e3',NULL),
('c19f6430-c724-45ab-92c4-23de1d5e2036',NULL,NULL,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','3838fdad-d4e3-4f52-897a-a7eef9af65fc',1,40,1,'5d8af649-f2ad-4904-98dd-f931d6427043',NULL),
('c7869f95-2fe3-49fc-b6f9-9751eac81c1f',NULL,'direct-grant-validate-username','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','309c1a81-f18e-444d-8962-ae3e50181b39',0,10,0,NULL,NULL),
('c8e66b00-de79-425a-ae28-410bda38afdd',NULL,'conditional-user-configured','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','8898132c-0d0b-4ed0-bab9-22485c8a42b7',0,10,0,NULL,NULL),
('c9d81ce2-a4cc-4be7-ad89-72fc09a58410',NULL,'registration-recaptcha-action','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','82d17c7f-3583-4cd1-ac8b-ab00433294f9',3,60,0,NULL,NULL),
('cda88d88-cca9-4909-9f2a-cb1db652dcd4',NULL,'conditional-credential','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','2057abf2-32f6-4d79-a0f6-1f46b5a6a915',0,20,0,NULL,'f9d8072c-b4e9-44ee-9a47-f2c2c1dfd5ed'),
('d45c2f31-f469-4ea8-98d9-77305b3ce258',NULL,'auth-recovery-authn-code-form','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','2057abf2-32f6-4d79-a0f6-1f46b5a6a915',3,50,0,NULL,NULL),
('d6e5417c-20ea-453a-a4de-118a4fe1e688',NULL,'auth-cookie','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','c919e3c8-52bb-4749-bd40-bf0e80af7bad',2,10,0,NULL,NULL),
('d8171c2e-2dfa-47d0-b29c-0e8c37251840',NULL,NULL,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','198749c8-9d7e-44be-8261-112c7fff13ea',0,20,1,'931bbab9-5b97-45f2-9b3e-215ff8a1aaf4',NULL),
('dcf3664a-db01-4b7a-ad66-0425686ba5c7',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','2569b223-47d2-45da-afe9-8ab847fc4a32',0,20,1,'8d8be6ef-d405-42cf-bc47-620396d19bcd',NULL),
('de1c8e75-abe4-48b5-869a-d3fb4fc3b8fa',NULL,'reset-password','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','3838fdad-d4e3-4f52-897a-a7eef9af65fc',0,30,0,NULL,NULL),
('e12385b2-a77e-4a34-9a35-e1e3af8e03ea',NULL,'client-jwt','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','982eaab7-81bf-4a70-a11b-c89311e0540f',2,20,0,NULL,NULL),
('e25639b4-de0f-4d87-83d3-95132fb656b3',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','309c1a81-f18e-444d-8962-ae3e50181b39',1,30,1,'450474c0-a63b-4569-b9dc-c83ba2b4e526',NULL),
('e268e6c5-dcb1-42b2-bfed-18503059f186',NULL,'idp-username-password-form','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','d6090a55-4d5f-492b-9e34-4edcc5f36dcd',0,10,0,NULL,NULL),
('e2bc44c6-4cb2-4009-8aef-f2b96c6d0506',NULL,NULL,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','931bbab9-5b97-45f2-9b3e-215ff8a1aaf4',2,20,1,'6e034d00-7d3e-4106-b387-3559a137c383',NULL),
('ebabcf60-e111-4f1f-8571-0c775bff78b9',NULL,'webauthn-authenticator','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','8898132c-0d0b-4ed0-bab9-22485c8a42b7',3,40,0,NULL,NULL),
('ebe2d53b-7323-46a8-a7f1-fb47100b43bb',NULL,'conditional-user-configured','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','9b489ccd-43b2-41ca-ae39-327fde0db1fa',0,10,0,NULL,NULL),
('ed290a46-08b2-44d6-b264-b9c53d3208e0',NULL,'identity-provider-redirector','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','64c0f382-49f7-441d-9e63-5abc1480990e',2,25,0,NULL,NULL),
('eeb98d49-f51e-43a7-bf26-2b5624b328d9',NULL,'client-secret','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f1088438-def1-4337-a6c0-710f7488489a',2,10,0,NULL,NULL),
('efbeb129-21e5-4a2f-b0c6-33901c026cb0',NULL,'docker-http-basic-authenticator','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','3d47b3ff-7941-40c0-9b71-7d4ecfd9f87b',0,10,0,NULL,NULL),
('f0c0d130-17b6-45fa-82e7-baf7500c05a6',NULL,'reset-credentials-choose-user','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','3838fdad-d4e3-4f52-897a-a7eef9af65fc',0,10,0,NULL,NULL),
('f145c26c-1048-4e2e-8c3a-19bcee520c7e',NULL,'registration-user-creation','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','82d17c7f-3583-4cd1-ac8b-ab00433294f9',0,20,0,NULL,NULL),
('f17ab4d9-48a3-4cea-968f-075403a5a612',NULL,'conditional-credential','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','ec8b7dc1-baba-493c-b576-a7868489fa05',0,20,0,NULL,'23b52caf-27ad-4afb-9273-33da7966fc64'),
('f2916934-86b7-416a-ac4d-3dcc799e348a',NULL,'auth-username-password-form','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','8ad01141-add6-4e7b-b722-ab374b3080d6',0,10,0,NULL,NULL),
('fa331631-90d9-4446-a69a-71a256d76a33',NULL,NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','0b53eec5-3239-401c-a8d8-702abb38f946',1,10,1,'f88e1234-d8fd-4f03-94dd-62d2ffca071b',NULL),
('fb34e94b-c9bd-46ea-b2a6-0706c52a2ff0',NULL,'conditional-user-configured','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','5d8af649-f2ad-4904-98dd-f931d6427043',0,10,0,NULL,NULL),
('fd7d2731-1196-4102-ad1e-9a065e975087',NULL,'auth-otp-form','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','2057abf2-32f6-4d79-a0f6-1f46b5a6a915',2,30,0,NULL,NULL),
('fd883c58-456e-4813-a98e-413f81d5ad44',NULL,'registration-page-form','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','246af0c1-e276-4bc5-a7a4-d107c6fbc0cc',0,10,1,'19925387-53e9-4da0-baa1-5a3bdc83fb4c',NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` tinyint(1) NOT NULL DEFAULT 0,
  `BUILT_IN` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES
('0b53eec5-3239-401c-a8d8-702abb38f946','Organization',NULL,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1),
('198749c8-9d7e-44be-8261-112c7fff13ea','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',1,1),
('19925387-53e9-4da0-baa1-5a3bdc83fb4c','registration form','Registration form','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','form-flow',0,1),
('1ea4a2a1-2f10-4e8c-a27d-f064939a7274','saml ecp','SAML ECP Profile Authentication Flow','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',1,1),
('2057abf2-32f6-4d79-a0f6-1f46b5a6a915','Browser - Conditional 2FA','Flow to determine if any 2FA is required for the authentication','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1),
('246af0c1-e276-4bc5-a7a4-d107c6fbc0cc','registration','Registration flow','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',1,1),
('2569b223-47d2-45da-afe9-8ab847fc4a32','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',1,1),
('309c1a81-f18e-444d-8962-ae3e50181b39','direct grant','OpenID Connect Resource Owner Grant','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',1,1),
('33d077b2-f372-4987-8a67-c9bd83e8ca98','Account verification options','Method with which to verify the existing account','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',0,1),
('3838fdad-d4e3-4f52-897a-a7eef9af65fc','reset credentials','Reset credentials for a user if they forgot their password or something','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',1,1),
('3d47b3ff-7941-40c0-9b71-7d4ecfd9f87b','docker auth','Used by Docker clients to authenticate against the IDP','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',1,1),
('450474c0-a63b-4569-b9dc-c83ba2b4e526','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1),
('517659bd-c57b-461f-9592-2e02a770ac1c','Account verification options','Method with which to verify the existing account','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1),
('55408152-63b9-4138-9c74-4fedb62727f8','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1),
('5d8af649-f2ad-4904-98dd-f931d6427043','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',0,1),
('63429152-e91f-4d54-84aa-da8198c53565','saml ecp','SAML ECP Profile Authentication Flow','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',1,1),
('64c0f382-49f7-441d-9e63-5abc1480990e','browser','Browser based authentication','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',1,1),
('6e034d00-7d3e-4106-b387-3559a137c383','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',0,1),
('82d17c7f-3583-4cd1-ac8b-ab00433294f9','registration form','Registration form','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','form-flow',0,1),
('844cfce2-5c6b-422b-b285-74398c08f3e3','First broker login - Conditional 2FA','Flow to determine if any 2FA is required for the authentication','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1),
('8898132c-0d0b-4ed0-bab9-22485c8a42b7','First broker login - Conditional 2FA','Flow to determine if any 2FA is required for the authentication','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',0,1),
('8ad01141-add6-4e7b-b722-ab374b3080d6','forms','Username, password, otp and other auth forms.','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',0,1),
('8c76ace5-a726-4e90-af7e-9bdfeacd28d1','Verify Existing Account by Re-authentication','Reauthentication of existing account','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1),
('8d8be6ef-d405-42cf-bc47-620396d19bcd','User creation or linking','Flow for the existing/non-existing user alternatives','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1),
('931bbab9-5b97-45f2-9b3e-215ff8a1aaf4','User creation or linking','Flow for the existing/non-existing user alternatives','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',0,1),
('97858a4b-935e-4ad8-a5f2-bc43510e841f','docker auth','Used by Docker clients to authenticate against the IDP','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',1,1),
('982eaab7-81bf-4a70-a11b-c89311e0540f','clients','Base authentication for clients','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','client-flow',1,1),
('9acea4ae-5ec2-44a3-8611-3c4e2091507a','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',0,1),
('9b489ccd-43b2-41ca-ae39-327fde0db1fa','First Broker Login - Conditional Organization','Flow to determine if the authenticator that adds organization members is to be used','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1),
('b3f99c08-9099-4417-9ab1-07310d62f963','registration','Registration flow','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',1,1),
('c919e3c8-52bb-4749-bd40-bf0e80af7bad','browser','Browser based authentication','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',1,1),
('d6090a55-4d5f-492b-9e34-4edcc5f36dcd','Verify Existing Account by Re-authentication','Reauthentication of existing account','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',0,1),
('d6b2c116-7a5f-41b8-91ac-78c38674a0e6','forms','Username, password, otp and other auth forms.','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1),
('dc5c4712-e87b-4a7c-91bd-f32da386f595','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1),
('dcce4c9a-5a82-4bf7-8b04-aef074fb9801','direct grant','OpenID Connect Resource Owner Grant','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',1,1),
('ec8b7dc1-baba-493c-b576-a7868489fa05','Browser - Conditional 2FA','Flow to determine if any 2FA is required for the authentication','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','basic-flow',0,1),
('f1088438-def1-4337-a6c0-710f7488489a','clients','Base authentication for clients','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','client-flow',1,1),
('f4a563bd-18e0-4be9-874d-5522d9843038','reset credentials','Reset credentials for a user if they forgot their password or something','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',1,1),
('f88e1234-d8fd-4f03-94dd-62d2ffca071b','Browser - Conditional Organization','Flow to determine if the organization identity-first login is to be used','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','basic-flow',0,1);
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES
('084e71d4-568e-4872-a80a-b4574c7f0121','create unique user config','fb1ad2cb-3389-46ca-ac4c-eebb9309d896'),
('23b52caf-27ad-4afb-9273-33da7966fc64','browser-conditional-credential','32498a75-22fb-4e5e-9e38-d5a29eb8e76d'),
('247d1ded-b72e-4af0-849e-17f76a7c9fc5','first-broker-login-conditional-credential','32498a75-22fb-4e5e-9e38-d5a29eb8e76d'),
('6652d5b6-46a6-49b6-b77b-c9655f3365aa','first-broker-login-conditional-credential','fb1ad2cb-3389-46ca-ac4c-eebb9309d896'),
('72b4dd2a-1499-4e4e-b3be-4f2ecb1ca873','create unique user config','32498a75-22fb-4e5e-9e38-d5a29eb8e76d'),
('d33b63e9-5204-4c69-a4a5-5765398e46d0','review profile config','fb1ad2cb-3389-46ca-ac4c-eebb9309d896'),
('f8cfa146-6700-4eb9-8a52-55973b94cb25','review profile config','32498a75-22fb-4e5e-9e38-d5a29eb8e76d'),
('f9d8072c-b4e9-44ee-9a47-f2c2c1dfd5ed','browser-conditional-credential','fb1ad2cb-3389-46ca-ac4c-eebb9309d896');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES
('084e71d4-568e-4872-a80a-b4574c7f0121','false','require.password.update.after.registration'),
('23b52caf-27ad-4afb-9273-33da7966fc64','webauthn-passwordless','credentials'),
('247d1ded-b72e-4af0-849e-17f76a7c9fc5','webauthn-passwordless','credentials'),
('6652d5b6-46a6-49b6-b77b-c9655f3365aa','webauthn-passwordless','credentials'),
('72b4dd2a-1499-4e4e-b3be-4f2ecb1ca873','false','require.password.update.after.registration'),
('d33b63e9-5204-4c69-a4a5-5765398e46d0','missing','update.profile.on.first.login'),
('f8cfa146-6700-4eb9-8a52-55973b94cb25','missing','update.profile.on.first.login'),
('f9d8072c-b4e9-44ee-9a47-f2c2c1dfd5ed','webauthn-passwordless','credentials');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_BROKER_LINK_USER_ID` (`USER_ID`),
  KEY `IDX_BROKER_LINK_IDENTITY_PROVIDER` (`REALM_ID`,`IDENTITY_PROVIDER`,`BROKER_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `FULL_SCOPE_ALLOWED` tinyint(1) NOT NULL DEFAULT 0,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` tinyint(1) NOT NULL DEFAULT 0,
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` tinyint(1) NOT NULL DEFAULT 0,
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` tinyint(1) NOT NULL DEFAULT 0,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT 0,
  `FRONTCHANNEL_LOGOUT` tinyint(1) NOT NULL DEFAULT 0,
  `CONSENT_REQUIRED` tinyint(1) NOT NULL DEFAULT 0,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` tinyint(1) NOT NULL DEFAULT 1,
  `IMPLICIT_FLOW_ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `DIRECT_ACCESS_GRANTS_ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `ALWAYS_DISPLAY_IN_CONSOLE` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES
('06b6d456-eb05-45ac-9a78-7730e73e8adc',1,1,'admin-cli',0,1,NULL,NULL,0,NULL,0,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026',1,0,'account',0,1,NULL,'/realms/master/account/',0,NULL,0,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),
('258b9538-e7ba-43c5-abaa-022b5d453331',1,0,'account',0,1,NULL,'/realms/Sistemas/account/',0,NULL,0,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),
('270dd870-2d46-401b-b5ab-83c25e27ed48',1,1,'admin-cli',0,1,NULL,NULL,0,NULL,0,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8',1,1,'berenice-client',0,1,NULL,'https://frontberenice.projeto.com',0,'',0,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','openid-connect',-1,1,0,'',0,'client-secret','','',NULL,1,0,1,0),
('801777b9-a574-4683-8225-0ec1d8f99acb',1,1,'sistemaCliente',0,0,'lkbL6pmDrRcPfAHANS2mSxT3g8Hh4w0J','https://frontberenice.projeto.com',0,'',0,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','openid-connect',-1,1,0,'',0,'client-secret','','',NULL,1,0,1,0),
('8ca1e477-dae0-45d0-b167-997db465ca12',1,1,'security-admin-console',0,1,NULL,'/admin/Sistemas/console/',0,NULL,0,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11',1,1,'security-admin-console',0,1,NULL,'/admin/master/console/',0,NULL,0,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),
('c2a0b5e7-f7c0-42df-84a1-798329993145',1,0,'Sistemas-realm',0,0,NULL,NULL,1,NULL,0,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL,0,0,0,'Sistemas Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),
('d4f7f599-f325-4129-9cd3-225e205f5a9e',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057',1,0,'account-console',0,1,NULL,'/realms/master/account/',0,NULL,0,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),
('e71b59bc-4185-488d-9249-1d709e21041a',1,0,'master-realm',0,0,NULL,NULL,1,NULL,0,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL,0,0,0,'master Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),
('f5c04237-cd54-43b2-8042-72e903ae1d9b',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','openid-connect',0,0,0,'${client_realm-management}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),
('f777ba74-83ca-4a1d-9189-af8f84e30891',1,0,'account-console',0,1,NULL,'/realms/Sistemas/account/',0,NULL,0,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0);
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES
('06b6d456-eb05-45ac-9a78-7730e73e8adc','client.use.lightweight.access.token.enabled','true'),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','post.logout.redirect.uris','+'),
('258b9538-e7ba-43c5-abaa-022b5d453331','post.logout.redirect.uris','+'),
('270dd870-2d46-401b-b5ab-83c25e27ed48','client.use.lightweight.access.token.enabled','true'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','backchannel.logout.revoke.offline.tokens','false'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','backchannel.logout.session.required','true'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','client.secret.creation.time','1778717976'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','display.on.consent.screen','false'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','dpop.bound.access.tokens','false'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','frontchannel.logout.session.required','true'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','logout.confirmation.enabled','false'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','oauth2.device.authorization.grant.enabled','false'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','oauth2.jwt.authorization.grant.enabled','false'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','oidc.ciba.grant.enabled','false'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','realm_client','false'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','standard.token.exchange.enabled','false'),
('801777b9-a574-4683-8225-0ec1d8f99acb','backchannel.logout.revoke.offline.tokens','false'),
('801777b9-a574-4683-8225-0ec1d8f99acb','backchannel.logout.session.required','true'),
('801777b9-a574-4683-8225-0ec1d8f99acb','client.secret.creation.time','1777421513'),
('801777b9-a574-4683-8225-0ec1d8f99acb','display.on.consent.screen','false'),
('801777b9-a574-4683-8225-0ec1d8f99acb','dpop.bound.access.tokens','false'),
('801777b9-a574-4683-8225-0ec1d8f99acb','frontchannel.logout.session.required','true'),
('801777b9-a574-4683-8225-0ec1d8f99acb','logout.confirmation.enabled','false'),
('801777b9-a574-4683-8225-0ec1d8f99acb','oauth2.device.authorization.grant.enabled','false'),
('801777b9-a574-4683-8225-0ec1d8f99acb','oauth2.jwt.authorization.grant.enabled','false'),
('801777b9-a574-4683-8225-0ec1d8f99acb','oidc.ciba.grant.enabled','false'),
('801777b9-a574-4683-8225-0ec1d8f99acb','realm_client','false'),
('801777b9-a574-4683-8225-0ec1d8f99acb','standard.token.exchange.enabled','false'),
('8ca1e477-dae0-45d0-b167-997db465ca12','client.use.lightweight.access.token.enabled','true'),
('8ca1e477-dae0-45d0-b167-997db465ca12','pkce.code.challenge.method','S256'),
('8ca1e477-dae0-45d0-b167-997db465ca12','post.logout.redirect.uris','+'),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','client.use.lightweight.access.token.enabled','true'),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','pkce.code.challenge.method','S256'),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','post.logout.redirect.uris','+'),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','pkce.code.challenge.method','S256'),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','post.logout.redirect.uris','+'),
('f777ba74-83ca-4a1d-9189-af8f84e30891','pkce.code.challenge.method','S256'),
('f777ba74-83ca-4a1d-9189-af8f84e30891','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES
('0409d05f-e0fd-40a3-bd28-3e0a3ed3f43f','service_account','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','Specific scope for a client enabled for service accounts','openid-connect'),
('04319a53-b1ef-432d-b98b-a99e4291f1f9','role_list','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','SAML role list','saml'),
('0fd4f7d4-e11b-40fe-a61b-02d51ed0343f','profile','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','OpenID Connect built-in scope: profile','openid-connect'),
('275a60e5-c381-4d2c-bbfd-6231d2d21fc6','address','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','OpenID Connect built-in scope: address','openid-connect'),
('29c597e9-6739-4e5b-9556-906b075c7f8a','basic','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','OpenID Connect scope for add all basic claims to the token','openid-connect'),
('30c6049b-f4c2-4b86-a44e-dff1c26ccaeb','acr','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),
('357096f2-27de-4c9a-9ac1-2a7b9650f67c','roles','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','OpenID Connect scope for add user roles to the access token','openid-connect'),
('3680e960-f0b4-4ff3-a7c5-c25347e2e49f','web-origins','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),
('4d696bc8-8a83-414d-96a8-270255799d4e','email','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','OpenID Connect built-in scope: email','openid-connect'),
('771fa2c6-bfba-4812-b632-df9e38b810ea','saml_organization','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','Organization Membership','saml'),
('7d400ce4-c351-44f9-9ce9-88609f7d48c6','profile','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','OpenID Connect built-in scope: profile','openid-connect'),
('88965281-e613-42de-80d2-5659ed95acab','offline_access','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','OpenID Connect built-in scope: offline_access','openid-connect'),
('88a028d2-a3ae-4ff7-aa97-f28ca7c0d568','acr','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),
('89168e1e-0004-4b69-a189-f531e619938f','role_list','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','SAML role list','saml'),
('8cee2229-b7c8-4177-af89-3df62643a74f','offline_access','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','OpenID Connect built-in scope: offline_access','openid-connect'),
('8ede126d-5803-4937-b7ed-ed825d3d6e3d','basic','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','OpenID Connect scope for add all basic claims to the token','openid-connect'),
('98a54925-b8c7-4824-8843-3ee27c5806e1','microprofile-jwt','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','Microprofile - JWT built-in scope','openid-connect'),
('c05c2082-d001-4a42-b42f-4103f888f5cd','saml_organization','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','Organization Membership','saml'),
('c32d814a-e0bc-4345-88f8-1096fa6e6054','service_account','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','Specific scope for a client enabled for service accounts','openid-connect'),
('c49ea892-4c40-48f7-a343-5205be54b974','web-origins','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),
('c5e0b1b4-10ee-44bb-9874-12ba09bb809f','organization','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','Additional claims about the organization a subject belongs to','openid-connect'),
('ce3458b8-31c0-430c-9ea6-c2b31704a4d3','roles','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','OpenID Connect scope for add user roles to the access token','openid-connect'),
('cf1d04f1-c137-4791-923a-8b638e53b984','phone','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','OpenID Connect built-in scope: phone','openid-connect'),
('d2c0ca9e-f806-485b-8069-03779d967e54','microprofile-jwt','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','Microprofile - JWT built-in scope','openid-connect'),
('dc327106-d8d8-4efa-ad9f-feb84e83c41c','phone','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','OpenID Connect built-in scope: phone','openid-connect'),
('ea494ea0-b528-4203-97a4-64b4dbefad89','address','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','OpenID Connect built-in scope: address','openid-connect'),
('fb74f341-5cb1-4b29-96a6-62c13f6d3b99','email','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','OpenID Connect built-in scope: email','openid-connect'),
('ff56aae2-1087-4cc1-be6d-a01ae641221b','organization','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','Additional claims about the organization a subject belongs to','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES
('0409d05f-e0fd-40a3-bd28-3e0a3ed3f43f','false','display.on.consent.screen'),
('0409d05f-e0fd-40a3-bd28-3e0a3ed3f43f','false','include.in.token.scope'),
('04319a53-b1ef-432d-b98b-a99e4291f1f9','${samlRoleListScopeConsentText}','consent.screen.text'),
('04319a53-b1ef-432d-b98b-a99e4291f1f9','true','display.on.consent.screen'),
('0fd4f7d4-e11b-40fe-a61b-02d51ed0343f','${profileScopeConsentText}','consent.screen.text'),
('0fd4f7d4-e11b-40fe-a61b-02d51ed0343f','true','display.on.consent.screen'),
('0fd4f7d4-e11b-40fe-a61b-02d51ed0343f','true','include.in.token.scope'),
('275a60e5-c381-4d2c-bbfd-6231d2d21fc6','${addressScopeConsentText}','consent.screen.text'),
('275a60e5-c381-4d2c-bbfd-6231d2d21fc6','true','display.on.consent.screen'),
('275a60e5-c381-4d2c-bbfd-6231d2d21fc6','true','include.in.token.scope'),
('29c597e9-6739-4e5b-9556-906b075c7f8a','false','display.on.consent.screen'),
('29c597e9-6739-4e5b-9556-906b075c7f8a','false','include.in.token.scope'),
('30c6049b-f4c2-4b86-a44e-dff1c26ccaeb','false','display.on.consent.screen'),
('30c6049b-f4c2-4b86-a44e-dff1c26ccaeb','false','include.in.token.scope'),
('357096f2-27de-4c9a-9ac1-2a7b9650f67c','${rolesScopeConsentText}','consent.screen.text'),
('357096f2-27de-4c9a-9ac1-2a7b9650f67c','true','display.on.consent.screen'),
('357096f2-27de-4c9a-9ac1-2a7b9650f67c','false','include.in.token.scope'),
('3680e960-f0b4-4ff3-a7c5-c25347e2e49f','','consent.screen.text'),
('3680e960-f0b4-4ff3-a7c5-c25347e2e49f','false','display.on.consent.screen'),
('3680e960-f0b4-4ff3-a7c5-c25347e2e49f','false','include.in.token.scope'),
('4d696bc8-8a83-414d-96a8-270255799d4e','${emailScopeConsentText}','consent.screen.text'),
('4d696bc8-8a83-414d-96a8-270255799d4e','true','display.on.consent.screen'),
('4d696bc8-8a83-414d-96a8-270255799d4e','true','include.in.token.scope'),
('771fa2c6-bfba-4812-b632-df9e38b810ea','false','display.on.consent.screen'),
('7d400ce4-c351-44f9-9ce9-88609f7d48c6','${profileScopeConsentText}','consent.screen.text'),
('7d400ce4-c351-44f9-9ce9-88609f7d48c6','true','display.on.consent.screen'),
('7d400ce4-c351-44f9-9ce9-88609f7d48c6','true','include.in.token.scope'),
('88965281-e613-42de-80d2-5659ed95acab','${offlineAccessScopeConsentText}','consent.screen.text'),
('88965281-e613-42de-80d2-5659ed95acab','true','display.on.consent.screen'),
('88a028d2-a3ae-4ff7-aa97-f28ca7c0d568','false','display.on.consent.screen'),
('88a028d2-a3ae-4ff7-aa97-f28ca7c0d568','false','include.in.token.scope'),
('89168e1e-0004-4b69-a189-f531e619938f','${samlRoleListScopeConsentText}','consent.screen.text'),
('89168e1e-0004-4b69-a189-f531e619938f','true','display.on.consent.screen'),
('8cee2229-b7c8-4177-af89-3df62643a74f','${offlineAccessScopeConsentText}','consent.screen.text'),
('8cee2229-b7c8-4177-af89-3df62643a74f','true','display.on.consent.screen'),
('8ede126d-5803-4937-b7ed-ed825d3d6e3d','false','display.on.consent.screen'),
('8ede126d-5803-4937-b7ed-ed825d3d6e3d','false','include.in.token.scope'),
('98a54925-b8c7-4824-8843-3ee27c5806e1','false','display.on.consent.screen'),
('98a54925-b8c7-4824-8843-3ee27c5806e1','true','include.in.token.scope'),
('c05c2082-d001-4a42-b42f-4103f888f5cd','false','display.on.consent.screen'),
('c32d814a-e0bc-4345-88f8-1096fa6e6054','false','display.on.consent.screen'),
('c32d814a-e0bc-4345-88f8-1096fa6e6054','false','include.in.token.scope'),
('c49ea892-4c40-48f7-a343-5205be54b974','','consent.screen.text'),
('c49ea892-4c40-48f7-a343-5205be54b974','false','display.on.consent.screen'),
('c49ea892-4c40-48f7-a343-5205be54b974','false','include.in.token.scope'),
('c5e0b1b4-10ee-44bb-9874-12ba09bb809f','${organizationScopeConsentText}','consent.screen.text'),
('c5e0b1b4-10ee-44bb-9874-12ba09bb809f','true','display.on.consent.screen'),
('c5e0b1b4-10ee-44bb-9874-12ba09bb809f','true','include.in.token.scope'),
('ce3458b8-31c0-430c-9ea6-c2b31704a4d3','${rolesScopeConsentText}','consent.screen.text'),
('ce3458b8-31c0-430c-9ea6-c2b31704a4d3','true','display.on.consent.screen'),
('ce3458b8-31c0-430c-9ea6-c2b31704a4d3','false','include.in.token.scope'),
('cf1d04f1-c137-4791-923a-8b638e53b984','${phoneScopeConsentText}','consent.screen.text'),
('cf1d04f1-c137-4791-923a-8b638e53b984','true','display.on.consent.screen'),
('cf1d04f1-c137-4791-923a-8b638e53b984','true','include.in.token.scope'),
('d2c0ca9e-f806-485b-8069-03779d967e54','false','display.on.consent.screen'),
('d2c0ca9e-f806-485b-8069-03779d967e54','true','include.in.token.scope'),
('dc327106-d8d8-4efa-ad9f-feb84e83c41c','${phoneScopeConsentText}','consent.screen.text'),
('dc327106-d8d8-4efa-ad9f-feb84e83c41c','true','display.on.consent.screen'),
('dc327106-d8d8-4efa-ad9f-feb84e83c41c','true','include.in.token.scope'),
('ea494ea0-b528-4203-97a4-64b4dbefad89','${addressScopeConsentText}','consent.screen.text'),
('ea494ea0-b528-4203-97a4-64b4dbefad89','true','display.on.consent.screen'),
('ea494ea0-b528-4203-97a4-64b4dbefad89','true','include.in.token.scope'),
('fb74f341-5cb1-4b29-96a6-62c13f6d3b99','${emailScopeConsentText}','consent.screen.text'),
('fb74f341-5cb1-4b29-96a6-62c13f6d3b99','true','display.on.consent.screen'),
('fb74f341-5cb1-4b29-96a6-62c13f6d3b99','true','include.in.token.scope'),
('ff56aae2-1087-4cc1-be6d-a01ae641221b','${organizationScopeConsentText}','consent.screen.text'),
('ff56aae2-1087-4cc1-be6d-a01ae641221b','true','display.on.consent.screen'),
('ff56aae2-1087-4cc1-be6d-a01ae641221b','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES
('06b6d456-eb05-45ac-9a78-7730e73e8adc','0fd4f7d4-e11b-40fe-a61b-02d51ed0343f',1),
('06b6d456-eb05-45ac-9a78-7730e73e8adc','275a60e5-c381-4d2c-bbfd-6231d2d21fc6',0),
('06b6d456-eb05-45ac-9a78-7730e73e8adc','29c597e9-6739-4e5b-9556-906b075c7f8a',1),
('06b6d456-eb05-45ac-9a78-7730e73e8adc','30c6049b-f4c2-4b86-a44e-dff1c26ccaeb',1),
('06b6d456-eb05-45ac-9a78-7730e73e8adc','357096f2-27de-4c9a-9ac1-2a7b9650f67c',1),
('06b6d456-eb05-45ac-9a78-7730e73e8adc','4d696bc8-8a83-414d-96a8-270255799d4e',1),
('06b6d456-eb05-45ac-9a78-7730e73e8adc','88965281-e613-42de-80d2-5659ed95acab',0),
('06b6d456-eb05-45ac-9a78-7730e73e8adc','98a54925-b8c7-4824-8843-3ee27c5806e1',0),
('06b6d456-eb05-45ac-9a78-7730e73e8adc','c49ea892-4c40-48f7-a343-5205be54b974',1),
('06b6d456-eb05-45ac-9a78-7730e73e8adc','c5e0b1b4-10ee-44bb-9874-12ba09bb809f',0),
('06b6d456-eb05-45ac-9a78-7730e73e8adc','cf1d04f1-c137-4791-923a-8b638e53b984',0),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','0fd4f7d4-e11b-40fe-a61b-02d51ed0343f',1),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','275a60e5-c381-4d2c-bbfd-6231d2d21fc6',0),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','29c597e9-6739-4e5b-9556-906b075c7f8a',1),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','30c6049b-f4c2-4b86-a44e-dff1c26ccaeb',1),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','357096f2-27de-4c9a-9ac1-2a7b9650f67c',1),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','4d696bc8-8a83-414d-96a8-270255799d4e',1),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','88965281-e613-42de-80d2-5659ed95acab',0),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','98a54925-b8c7-4824-8843-3ee27c5806e1',0),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','c49ea892-4c40-48f7-a343-5205be54b974',1),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','c5e0b1b4-10ee-44bb-9874-12ba09bb809f',0),
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','cf1d04f1-c137-4791-923a-8b638e53b984',0),
('258b9538-e7ba-43c5-abaa-022b5d453331','3680e960-f0b4-4ff3-a7c5-c25347e2e49f',1),
('258b9538-e7ba-43c5-abaa-022b5d453331','7d400ce4-c351-44f9-9ce9-88609f7d48c6',1),
('258b9538-e7ba-43c5-abaa-022b5d453331','88a028d2-a3ae-4ff7-aa97-f28ca7c0d568',1),
('258b9538-e7ba-43c5-abaa-022b5d453331','8cee2229-b7c8-4177-af89-3df62643a74f',0),
('258b9538-e7ba-43c5-abaa-022b5d453331','8ede126d-5803-4937-b7ed-ed825d3d6e3d',1),
('258b9538-e7ba-43c5-abaa-022b5d453331','ce3458b8-31c0-430c-9ea6-c2b31704a4d3',1),
('258b9538-e7ba-43c5-abaa-022b5d453331','d2c0ca9e-f806-485b-8069-03779d967e54',0),
('258b9538-e7ba-43c5-abaa-022b5d453331','dc327106-d8d8-4efa-ad9f-feb84e83c41c',0),
('258b9538-e7ba-43c5-abaa-022b5d453331','ea494ea0-b528-4203-97a4-64b4dbefad89',0),
('258b9538-e7ba-43c5-abaa-022b5d453331','fb74f341-5cb1-4b29-96a6-62c13f6d3b99',1),
('258b9538-e7ba-43c5-abaa-022b5d453331','ff56aae2-1087-4cc1-be6d-a01ae641221b',0),
('270dd870-2d46-401b-b5ab-83c25e27ed48','3680e960-f0b4-4ff3-a7c5-c25347e2e49f',1),
('270dd870-2d46-401b-b5ab-83c25e27ed48','7d400ce4-c351-44f9-9ce9-88609f7d48c6',1),
('270dd870-2d46-401b-b5ab-83c25e27ed48','88a028d2-a3ae-4ff7-aa97-f28ca7c0d568',1),
('270dd870-2d46-401b-b5ab-83c25e27ed48','8cee2229-b7c8-4177-af89-3df62643a74f',0),
('270dd870-2d46-401b-b5ab-83c25e27ed48','8ede126d-5803-4937-b7ed-ed825d3d6e3d',1),
('270dd870-2d46-401b-b5ab-83c25e27ed48','ce3458b8-31c0-430c-9ea6-c2b31704a4d3',1),
('270dd870-2d46-401b-b5ab-83c25e27ed48','d2c0ca9e-f806-485b-8069-03779d967e54',0),
('270dd870-2d46-401b-b5ab-83c25e27ed48','dc327106-d8d8-4efa-ad9f-feb84e83c41c',0),
('270dd870-2d46-401b-b5ab-83c25e27ed48','ea494ea0-b528-4203-97a4-64b4dbefad89',0),
('270dd870-2d46-401b-b5ab-83c25e27ed48','fb74f341-5cb1-4b29-96a6-62c13f6d3b99',1),
('270dd870-2d46-401b-b5ab-83c25e27ed48','ff56aae2-1087-4cc1-be6d-a01ae641221b',0),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','3680e960-f0b4-4ff3-a7c5-c25347e2e49f',1),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','7d400ce4-c351-44f9-9ce9-88609f7d48c6',1),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','88a028d2-a3ae-4ff7-aa97-f28ca7c0d568',1),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','8cee2229-b7c8-4177-af89-3df62643a74f',0),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','8ede126d-5803-4937-b7ed-ed825d3d6e3d',1),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','ce3458b8-31c0-430c-9ea6-c2b31704a4d3',1),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','d2c0ca9e-f806-485b-8069-03779d967e54',0),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','dc327106-d8d8-4efa-ad9f-feb84e83c41c',0),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','ea494ea0-b528-4203-97a4-64b4dbefad89',0),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','fb74f341-5cb1-4b29-96a6-62c13f6d3b99',1),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','ff56aae2-1087-4cc1-be6d-a01ae641221b',0),
('801777b9-a574-4683-8225-0ec1d8f99acb','3680e960-f0b4-4ff3-a7c5-c25347e2e49f',1),
('801777b9-a574-4683-8225-0ec1d8f99acb','7d400ce4-c351-44f9-9ce9-88609f7d48c6',1),
('801777b9-a574-4683-8225-0ec1d8f99acb','88a028d2-a3ae-4ff7-aa97-f28ca7c0d568',1),
('801777b9-a574-4683-8225-0ec1d8f99acb','8cee2229-b7c8-4177-af89-3df62643a74f',0),
('801777b9-a574-4683-8225-0ec1d8f99acb','8ede126d-5803-4937-b7ed-ed825d3d6e3d',1),
('801777b9-a574-4683-8225-0ec1d8f99acb','ce3458b8-31c0-430c-9ea6-c2b31704a4d3',1),
('801777b9-a574-4683-8225-0ec1d8f99acb','d2c0ca9e-f806-485b-8069-03779d967e54',0),
('801777b9-a574-4683-8225-0ec1d8f99acb','dc327106-d8d8-4efa-ad9f-feb84e83c41c',0),
('801777b9-a574-4683-8225-0ec1d8f99acb','ea494ea0-b528-4203-97a4-64b4dbefad89',0),
('801777b9-a574-4683-8225-0ec1d8f99acb','fb74f341-5cb1-4b29-96a6-62c13f6d3b99',1),
('801777b9-a574-4683-8225-0ec1d8f99acb','ff56aae2-1087-4cc1-be6d-a01ae641221b',0),
('8ca1e477-dae0-45d0-b167-997db465ca12','3680e960-f0b4-4ff3-a7c5-c25347e2e49f',1),
('8ca1e477-dae0-45d0-b167-997db465ca12','7d400ce4-c351-44f9-9ce9-88609f7d48c6',1),
('8ca1e477-dae0-45d0-b167-997db465ca12','88a028d2-a3ae-4ff7-aa97-f28ca7c0d568',1),
('8ca1e477-dae0-45d0-b167-997db465ca12','8cee2229-b7c8-4177-af89-3df62643a74f',0),
('8ca1e477-dae0-45d0-b167-997db465ca12','8ede126d-5803-4937-b7ed-ed825d3d6e3d',1),
('8ca1e477-dae0-45d0-b167-997db465ca12','ce3458b8-31c0-430c-9ea6-c2b31704a4d3',1),
('8ca1e477-dae0-45d0-b167-997db465ca12','d2c0ca9e-f806-485b-8069-03779d967e54',0),
('8ca1e477-dae0-45d0-b167-997db465ca12','dc327106-d8d8-4efa-ad9f-feb84e83c41c',0),
('8ca1e477-dae0-45d0-b167-997db465ca12','ea494ea0-b528-4203-97a4-64b4dbefad89',0),
('8ca1e477-dae0-45d0-b167-997db465ca12','fb74f341-5cb1-4b29-96a6-62c13f6d3b99',1),
('8ca1e477-dae0-45d0-b167-997db465ca12','ff56aae2-1087-4cc1-be6d-a01ae641221b',0),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23','3680e960-f0b4-4ff3-a7c5-c25347e2e49f',1),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23','7d400ce4-c351-44f9-9ce9-88609f7d48c6',1),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23','88a028d2-a3ae-4ff7-aa97-f28ca7c0d568',1),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23','8cee2229-b7c8-4177-af89-3df62643a74f',0),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23','8ede126d-5803-4937-b7ed-ed825d3d6e3d',1),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23','ce3458b8-31c0-430c-9ea6-c2b31704a4d3',1),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23','d2c0ca9e-f806-485b-8069-03779d967e54',0),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23','dc327106-d8d8-4efa-ad9f-feb84e83c41c',0),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23','ea494ea0-b528-4203-97a4-64b4dbefad89',0),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23','fb74f341-5cb1-4b29-96a6-62c13f6d3b99',1),
('9435663b-e35e-48ba-9fcb-5ec1f024fa23','ff56aae2-1087-4cc1-be6d-a01ae641221b',0),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','0fd4f7d4-e11b-40fe-a61b-02d51ed0343f',1),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','275a60e5-c381-4d2c-bbfd-6231d2d21fc6',0),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','29c597e9-6739-4e5b-9556-906b075c7f8a',1),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','30c6049b-f4c2-4b86-a44e-dff1c26ccaeb',1),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','357096f2-27de-4c9a-9ac1-2a7b9650f67c',1),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','4d696bc8-8a83-414d-96a8-270255799d4e',1),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','88965281-e613-42de-80d2-5659ed95acab',0),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','98a54925-b8c7-4824-8843-3ee27c5806e1',0),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','c49ea892-4c40-48f7-a343-5205be54b974',1),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','c5e0b1b4-10ee-44bb-9874-12ba09bb809f',0),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','cf1d04f1-c137-4791-923a-8b638e53b984',0),
('d4f7f599-f325-4129-9cd3-225e205f5a9e','0fd4f7d4-e11b-40fe-a61b-02d51ed0343f',1),
('d4f7f599-f325-4129-9cd3-225e205f5a9e','275a60e5-c381-4d2c-bbfd-6231d2d21fc6',0),
('d4f7f599-f325-4129-9cd3-225e205f5a9e','29c597e9-6739-4e5b-9556-906b075c7f8a',1),
('d4f7f599-f325-4129-9cd3-225e205f5a9e','30c6049b-f4c2-4b86-a44e-dff1c26ccaeb',1),
('d4f7f599-f325-4129-9cd3-225e205f5a9e','357096f2-27de-4c9a-9ac1-2a7b9650f67c',1),
('d4f7f599-f325-4129-9cd3-225e205f5a9e','4d696bc8-8a83-414d-96a8-270255799d4e',1),
('d4f7f599-f325-4129-9cd3-225e205f5a9e','88965281-e613-42de-80d2-5659ed95acab',0),
('d4f7f599-f325-4129-9cd3-225e205f5a9e','98a54925-b8c7-4824-8843-3ee27c5806e1',0),
('d4f7f599-f325-4129-9cd3-225e205f5a9e','c49ea892-4c40-48f7-a343-5205be54b974',1),
('d4f7f599-f325-4129-9cd3-225e205f5a9e','c5e0b1b4-10ee-44bb-9874-12ba09bb809f',0),
('d4f7f599-f325-4129-9cd3-225e205f5a9e','cf1d04f1-c137-4791-923a-8b638e53b984',0),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','0fd4f7d4-e11b-40fe-a61b-02d51ed0343f',1),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','275a60e5-c381-4d2c-bbfd-6231d2d21fc6',0),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','29c597e9-6739-4e5b-9556-906b075c7f8a',1),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','30c6049b-f4c2-4b86-a44e-dff1c26ccaeb',1),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','357096f2-27de-4c9a-9ac1-2a7b9650f67c',1),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','4d696bc8-8a83-414d-96a8-270255799d4e',1),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','88965281-e613-42de-80d2-5659ed95acab',0),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','98a54925-b8c7-4824-8843-3ee27c5806e1',0),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','c49ea892-4c40-48f7-a343-5205be54b974',1),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','c5e0b1b4-10ee-44bb-9874-12ba09bb809f',0),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','cf1d04f1-c137-4791-923a-8b638e53b984',0),
('e71b59bc-4185-488d-9249-1d709e21041a','0fd4f7d4-e11b-40fe-a61b-02d51ed0343f',1),
('e71b59bc-4185-488d-9249-1d709e21041a','275a60e5-c381-4d2c-bbfd-6231d2d21fc6',0),
('e71b59bc-4185-488d-9249-1d709e21041a','29c597e9-6739-4e5b-9556-906b075c7f8a',1),
('e71b59bc-4185-488d-9249-1d709e21041a','30c6049b-f4c2-4b86-a44e-dff1c26ccaeb',1),
('e71b59bc-4185-488d-9249-1d709e21041a','357096f2-27de-4c9a-9ac1-2a7b9650f67c',1),
('e71b59bc-4185-488d-9249-1d709e21041a','4d696bc8-8a83-414d-96a8-270255799d4e',1),
('e71b59bc-4185-488d-9249-1d709e21041a','88965281-e613-42de-80d2-5659ed95acab',0),
('e71b59bc-4185-488d-9249-1d709e21041a','98a54925-b8c7-4824-8843-3ee27c5806e1',0),
('e71b59bc-4185-488d-9249-1d709e21041a','c49ea892-4c40-48f7-a343-5205be54b974',1),
('e71b59bc-4185-488d-9249-1d709e21041a','c5e0b1b4-10ee-44bb-9874-12ba09bb809f',0),
('e71b59bc-4185-488d-9249-1d709e21041a','cf1d04f1-c137-4791-923a-8b638e53b984',0),
('f5c04237-cd54-43b2-8042-72e903ae1d9b','3680e960-f0b4-4ff3-a7c5-c25347e2e49f',1),
('f5c04237-cd54-43b2-8042-72e903ae1d9b','7d400ce4-c351-44f9-9ce9-88609f7d48c6',1),
('f5c04237-cd54-43b2-8042-72e903ae1d9b','88a028d2-a3ae-4ff7-aa97-f28ca7c0d568',1),
('f5c04237-cd54-43b2-8042-72e903ae1d9b','8cee2229-b7c8-4177-af89-3df62643a74f',0),
('f5c04237-cd54-43b2-8042-72e903ae1d9b','8ede126d-5803-4937-b7ed-ed825d3d6e3d',1),
('f5c04237-cd54-43b2-8042-72e903ae1d9b','ce3458b8-31c0-430c-9ea6-c2b31704a4d3',1),
('f5c04237-cd54-43b2-8042-72e903ae1d9b','d2c0ca9e-f806-485b-8069-03779d967e54',0),
('f5c04237-cd54-43b2-8042-72e903ae1d9b','dc327106-d8d8-4efa-ad9f-feb84e83c41c',0),
('f5c04237-cd54-43b2-8042-72e903ae1d9b','ea494ea0-b528-4203-97a4-64b4dbefad89',0),
('f5c04237-cd54-43b2-8042-72e903ae1d9b','fb74f341-5cb1-4b29-96a6-62c13f6d3b99',1),
('f5c04237-cd54-43b2-8042-72e903ae1d9b','ff56aae2-1087-4cc1-be6d-a01ae641221b',0),
('f777ba74-83ca-4a1d-9189-af8f84e30891','3680e960-f0b4-4ff3-a7c5-c25347e2e49f',1),
('f777ba74-83ca-4a1d-9189-af8f84e30891','7d400ce4-c351-44f9-9ce9-88609f7d48c6',1),
('f777ba74-83ca-4a1d-9189-af8f84e30891','88a028d2-a3ae-4ff7-aa97-f28ca7c0d568',1),
('f777ba74-83ca-4a1d-9189-af8f84e30891','8cee2229-b7c8-4177-af89-3df62643a74f',0),
('f777ba74-83ca-4a1d-9189-af8f84e30891','8ede126d-5803-4937-b7ed-ed825d3d6e3d',1),
('f777ba74-83ca-4a1d-9189-af8f84e30891','ce3458b8-31c0-430c-9ea6-c2b31704a4d3',1),
('f777ba74-83ca-4a1d-9189-af8f84e30891','d2c0ca9e-f806-485b-8069-03779d967e54',0),
('f777ba74-83ca-4a1d-9189-af8f84e30891','dc327106-d8d8-4efa-ad9f-feb84e83c41c',0),
('f777ba74-83ca-4a1d-9189-af8f84e30891','ea494ea0-b528-4203-97a4-64b4dbefad89',0),
('f777ba74-83ca-4a1d-9189-af8f84e30891','fb74f341-5cb1-4b29-96a6-62c13f6d3b99',1),
('f777ba74-83ca-4a1d-9189-af8f84e30891','ff56aae2-1087-4cc1-be6d-a01ae641221b',0);
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES
('88965281-e613-42de-80d2-5659ed95acab','c9d4140e-cb74-4ee4-92d0-cd5a5cff38fe'),
('8cee2229-b7c8-4177-af89-3df62643a74f','a34523b5-18b9-4b47-9eb5-9e7664d8e63a');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES
('024c4ac1-8b13-44f4-be01-ff94bd298233','hmac-generated-hs512','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','hmac-generated','org.keycloak.keys.KeyProvider','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL),
('17687014-6cfe-45be-8251-56229e8a930e','Allowed Protocol Mapper Types','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','anonymous'),
('25555477-ce73-4ff7-82b3-c6704233811d','Allowed Protocol Mapper Types','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','anonymous'),
('2b6b4ff4-8ef9-490f-b841-f7b9fef4419f','Allowed Registration Web Origins','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','registration-web-origins','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','authenticated'),
('31250b3e-7b0b-4aa1-af42-405f708f88fd','Allowed Registration Web Origins','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','registration-web-origins','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','authenticated'),
('329ca7bd-609f-4c2f-900e-b8c78e6cef13','rsa-generated','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','rsa-generated','org.keycloak.keys.KeyProvider','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',NULL),
('3f2adcee-b069-4b76-994d-43f6c711e5b1','Allowed Protocol Mapper Types','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','authenticated'),
('456c9dbb-24ea-4326-bb83-e3aa4eddcb4a','Consent Required','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','anonymous'),
('48b658e0-e134-4a57-8447-e5ae0fba5c33','aes-generated','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','aes-generated','org.keycloak.keys.KeyProvider','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL),
('4b637a3a-eaaf-455e-9fb5-859e66eed07c',NULL,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL),
('4e2646ad-8fda-4c7e-b44e-05c821b2596d','Allowed Client Scopes','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','authenticated'),
('5131d381-7249-4a11-9844-54850bfa3e79','rsa-enc-generated','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','rsa-enc-generated','org.keycloak.keys.KeyProvider','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',NULL),
('59eb421c-fd01-4ccb-b2c0-f56a9091c9fd','hmac-generated-hs512','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','hmac-generated','org.keycloak.keys.KeyProvider','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',NULL),
('66f4b43a-7b82-4fa0-939f-3e8d33eea021','aes-generated','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','aes-generated','org.keycloak.keys.KeyProvider','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',NULL),
('6860516f-ea39-4fcb-b664-31298caf1f0b','Allowed Registration Web Origins','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','registration-web-origins','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','anonymous'),
('74ebe2f1-2779-4fca-bc9c-89d79328cf71','Full Scope Disabled','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','anonymous'),
('835c7c6d-9f2c-4e87-ac70-cc54af576f86','Allowed Client Scopes','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','authenticated'),
('8b011e2f-128f-4ebf-b3fd-838ad3a1e2eb','Trusted Hosts','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','anonymous'),
('9aeb3634-a22f-49ba-89bf-99e5ae9a89e9','Allowed Client Scopes','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','anonymous'),
('9c793c3e-b562-4c4a-a93c-77538535c39e','Max Clients Limit','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','anonymous'),
('ad107b86-7f66-429b-842a-f83c8e40eeb4','Full Scope Disabled','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','anonymous'),
('ae9591a0-72d4-4a4a-af27-d3212e868727','rsa-enc-generated','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','rsa-enc-generated','org.keycloak.keys.KeyProvider','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL),
('b2b05efb-baac-4d48-bb0d-493dcab13515','Consent Required','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','anonymous'),
('b32c109b-20b3-4425-8d8a-48a595e6fa14','Trusted Hosts','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','anonymous'),
('b7295f6b-408c-4b72-b419-442d46ec1a87','Allowed Registration Web Origins','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','registration-web-origins','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','anonymous'),
('c050a937-fb28-422b-a3af-499f50deee33','Allowed Protocol Mapper Types','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','authenticated'),
('cf5173d9-9186-4b85-b886-c4430c3dd105','rsa-generated','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','rsa-generated','org.keycloak.keys.KeyProvider','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL),
('d5161818-cda9-4f51-826f-0e7435df0f50','Allowed Client Scopes','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','anonymous'),
('edab1597-8ef2-44a0-b6c2-0adb1145e3fa','Max Clients Limit','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES
('04983721-15ae-4713-a153-4146ad7d1db6','c050a937-fb28-422b-a3af-499f50deee33','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('0d0a6163-4260-4012-952e-10110ea4c914','5131d381-7249-4a11-9844-54850bfa3e79','certificate','MIICnzCCAYcCBgGd1pMhOjANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhTaXN0ZW1hczAeFw0yNjA0MjkwMDA5MTlaFw0zNjA0MjkwMDEwNTlaMBMxETAPBgNVBAMMCFNpc3RlbWFzMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtWvOFbqwpnkjjrkQh7BOGajCUD9HnquhkAdsDKazxh1xVgRNFSbgGRDkBjK9RoxEWwJ/g2fOobtHvEHKRmcK80FpagXdyTUboq2J3CK79QrnisHmLN7inllnquw77Vfk02SD+hGlypNcP3hna+ibzOQPaK/cKm+/u1Z68m95+5x5HfP8+25WxHfuirVWw+g5L9wUuPBFsrcYhb5Ix7qJpxdOqlnjTkax+4GJC1BRYrD87rMGfXrhRddT03NXiK7DRL+rPIMmSkRkfR0PSVfBvHFNAnfkSmI2WrKMe+LXFC2zzz2UH49uTrjbj11zP5axc7ht++IoTGua/+Jj4GA69wIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAbqJOeILIZ3FyA+RWhrK8DzyEztAX9ak+gLTSe34cxVLwhS6iNP9XuHSoN1/NKQK/cn5g/Kb6sjCnOzRWyNgYQmssMupI1xHMQ/a1Vg3EAJ48/RVdNtBH5kqnDUMSHYlqTnibtnM/ZlAefMiSCzuawZGigzxlKhQ6F7EBEKVoPOISCDLlSrPM86vICgeuxjyFthiEJnvB56/NQt8YgBmcwU5mtBMjE0A0DjpnXYesFeI2vuwcQfPOYWuNBDjsNoQbNRUJtcgLdTEwtvASex4MtnMNH34wQhvzXx0ffWKPQywTM2jNvutjYwK6a30iJzY9i/iwajMWdsphd065hAq8S'),
('163a231c-9fbd-4ecd-9f71-d72457d5c9f3','5131d381-7249-4a11-9844-54850bfa3e79','priority','100'),
('175f4450-6070-4de8-8234-28ce0fd03ede','024c4ac1-8b13-44f4-be01-ff94bd298233','algorithm','HS512'),
('17f4e6ca-57d0-4931-b89d-b0774ec8116e','c050a937-fb28-422b-a3af-499f50deee33','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('1d01ec8a-f862-4ad1-bc68-728cbd98dde0','66f4b43a-7b82-4fa0-939f-3e8d33eea021','kid','2991950b-ec9b-4a35-ae37-7e1a12e19cd6'),
('20543e1f-f246-409f-9157-5fdd163d17e3','25555477-ce73-4ff7-82b3-c6704233811d','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('25beb7bf-9a3d-4619-82b0-9265773a19ee','48b658e0-e134-4a57-8447-e5ae0fba5c33','kid','ac1a46d4-f3fc-4d49-827d-b07530ce718d'),
('27ccd912-44c2-423a-8ec4-8e33e4703308','329ca7bd-609f-4c2f-900e-b8c78e6cef13','privateKey','MIIEpAIBAAKCAQEA7Vmld3PRzraMTJxCPVR6YvKlKZDo5NQ0lAtJ8kDIdxT5T7IvU4DcjZfz/Y28gVmwG6+rrjuuNWwtHn02hR2dXt2wnFn2RYlPXFRBGIod1CBHLy7lr3IuC7Eht5YV3vM7YaSGqQ0dpFpkNFkmuNh1mftT31KI2jf2XAivLSXdxLjNCGhOyTyGCwyg1YBPV6qBEIR/QxYhAg6TlZFV3AqkyQT3nNo6sNe63B9QE8QlWpnvS781C/+AZf0LWQE8FhRHWnYre9soP0nFf/kI8GWME8k3QohKekfDy18dFXrpkZdpZ1qaGSWcFMJo9+b9gH5BCVp+fGfCowv4VK2HuKDIaQIDAQABAoIBAANqhSRnPRePzoyiuhxWXS2T5vcmcAetGzWfRPjw4EHAgkcYnjBCPEpoa7lUQyiMcSmw2VR4ZO09aZfU/wYi8zskjzBs5gvBqmv+hXJUOJIvRb8C2ojwKIQAEGdrSFTNZOcmnk6MEwdkyqjrOJC0AttMv/wInNIhOJFCCb1pXFwCss0ch0byZAftvHFoHm7ovy5CWnneYk5ABWSRCm8Vyak4L8QnNKOCysTqvsmu/ZS3LNkyGjGIV9sc/g9jgPmF+V4a6MDSaIpn6rYx23ntTbXcJUQXp5G6ybdU+vwLLmf0EnUykCsUs8EFqYxwGUn/DityDzKGHaco23smERa7NEUCgYEA/3t1DDBKofeRGdWekcBWyeVsa5IsFyAOfdAzX1kaz/cUnWWwLyG8wZpTZD3ioS3WvXdjwTomzX2Da4bsO/PZGldpDfeVFeRif99BIf8AZDgljCXfpZ66FnY9go6HKvmmY6c3gF6FbWZP+oCfZrmVqPgeTX3GN03t+uJRMmOnr3UCgYEA7dTIRe3HwwOZ0tFRziOX0CK9OqUUDwDInMULulyb5rsL+LCf0oF8d3hYLjZsrH1vYcRbnkHs8tXKHaXTfnbJa4xw9jyDCeyXCm6O373SFhrHhvNtXdl9IuKL1uhXKL43EXu89DyG2eARhZNlyekUYWErMKH/eB+3S0UGB+bFqqUCgYABtRuFJ1V4W6U2nPzgUH7D/qqI1YNB7E7sfFW7j2bkeOxEWQeiaQFP8e4Yv2kiVqIWxhN+mRrlSK92KoKtq+WJjYgANeVjLhGSdTWEOqYQBWgK1b3252aq+8NReg5hNSXtiJKQYxFVN9fU/sMR9q+PX4kkT3Dhsb2jbZvJUG0weQKBgQDVhj9UgRnjHR2Cp8lRUKVhCX9o4oKywZpbHZHc/H4/1dj2quSiovxzaomI2/YPmwJf/WHgIQIyNv0iRxotpUpLE6jregKP62jjxcTiXdL7Y4mVwIGFS9lMc6bnCGwQOU7JlJVdleXgQIqaqW4uq+NPVmTnYdoyKA9xNYQnneoDvQKBgQDIm9Yu0AR7VHm2wh3BCGcdtCBgavg+76s5Wd09yNFLZxKTzeMBr3EkZPk/VNxCSaTOPqjNI5oeeT/aj3vGWBTRolWeWxwCPlGyIekqrO9UqWRC4Lwe8+1058AuthVtFdIWBUGTGxRdzOBhgDHieL0GCLsbGLNh/7I5ygWbMhvE6A=='),
('2dcadb04-3f3a-4bc3-a663-0993062c636a','59eb421c-fd01-4ccb-b2c0-f56a9091c9fd','priority','100'),
('2f73c18e-99bc-467f-9a97-f63970f5d6ab','59eb421c-fd01-4ccb-b2c0-f56a9091c9fd','kid','6018f8ea-dcc4-41ca-b1d6-0c91e3e25b8e'),
('32845e63-7d6e-4ba1-ba5f-9c410895ea1e','8b011e2f-128f-4ebf-b3fd-838ad3a1e2eb','client-uris-must-match','true'),
('3318b4e9-fa50-40ae-8343-44b71a4a6980','c050a937-fb28-422b-a3af-499f50deee33','allowed-protocol-mapper-types','oidc-address-mapper'),
('34cba3b2-b919-439d-9f92-3327f6d9b76a','25555477-ce73-4ff7-82b3-c6704233811d','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('357acbfa-5fe2-4e80-a4e9-5b4b8d2d4f6d','835c7c6d-9f2c-4e87-ac70-cc54af576f86','allow-default-scopes','true'),
('378a243c-b49e-46c9-a0cb-47c7afdf5aea','66f4b43a-7b82-4fa0-939f-3e8d33eea021','priority','100'),
('3ad7dffc-8020-4779-98c2-dbdb25d08de3','3f2adcee-b069-4b76-994d-43f6c711e5b1','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('3c6f5662-28d6-4d7a-8ca7-d8bf2a521e25','5131d381-7249-4a11-9844-54850bfa3e79','privateKey','MIIEpAIBAAKCAQEAtWvOFbqwpnkjjrkQh7BOGajCUD9HnquhkAdsDKazxh1xVgRNFSbgGRDkBjK9RoxEWwJ/g2fOobtHvEHKRmcK80FpagXdyTUboq2J3CK79QrnisHmLN7inllnquw77Vfk02SD+hGlypNcP3hna+ibzOQPaK/cKm+/u1Z68m95+5x5HfP8+25WxHfuirVWw+g5L9wUuPBFsrcYhb5Ix7qJpxdOqlnjTkax+4GJC1BRYrD87rMGfXrhRddT03NXiK7DRL+rPIMmSkRkfR0PSVfBvHFNAnfkSmI2WrKMe+LXFC2zzz2UH49uTrjbj11zP5axc7ht++IoTGua/+Jj4GA69wIDAQABAoIBAAgF8tZD1wjLC1yGKLSngmdgxD8s8pY80ZH/Z12OiHLMMzVHpBUPDr1tDCM4s+WJJy4TMop1g845QcHnSEfMH3rZ5gyPTTCseEK92VPyoUyupRtzhHdwNVDQHrqQufxpdQWNnhySvTnz7Gd42Vy3VnSS6Bo2yiOCT6tm9rGpZm6keNDk1rClVxwS2BZzbY+hM5l8jc9kBMr3MaxbocNnANxqdPbcOt7svENNXHMdOn9AKCFdHz/Uw9NQUVAExlAnr+dDf0UxmqWAogDeQFNoAy8gusHX7P5werBGdpa2CG3QLTivi+ciwOfDMwb/rladLn+VTIDz8yuka/DbgVXNQ0kCgYEA3eFB3Yl2sQbm4PNRE4Wi9Q4jlX6gPR3hqmUomUo8YiLKwHAROYlfhfbXRIttqS4crF+Uh4Y8zNJX+RjFsbsSKStPtkw69uXKTi5f4G05DZhrOtsdPKC6KyPSMsnkp8uNIwkqmr/4hK46JWiQI9kQ5Xq+bbCqEJPQjufBfYh00OsCgYEA0VHOkkGmaJT4SuxB5w36FHaALWIiNIo8VUnG32tJ5o9ISEY/6cNJ/ixi6+zC+2z2WmBQK3E/74YQGIr5ZxFqx9PUe/VbbMytel3on2OGMyRa7vqDH3XTZp/pqoc3pL4EyKNDtTabWtDrDEgvjvg3NKGFjK51SsfN7kYqijEP2yUCgYEAk8wDutVhecR2MKwDerSO+xui+mbxyCRKeN2PcKSxmlFAq3U7FA980Ni/Rkp2DrbHpM66OphhkbIfpa8pqR1KmJ/gJjebI3GoE/HyLaWz1mmMLBVe4U7TE/91eh1gMaF2bzsg5RoxKfiAhQCk2ywxhBsCFEEU15wO1dJs4fjuj2cCgYEAy9AxKL4dz3VGMoXLQbSdTbF46zfDgI8dYhpdN4xbP9FCG4Wzk+Vgtcn4ZCp8TJ5zXdqsFTDHhW1vXMZtRAt0grBjFHP6mnzNafnomNIqiL+cf1eTt11eA24v8qiI6LNRKx+1vMw4Bvyn8aSUEkzkTC3+QNZaRP86KAlQQJC3FLUCgYA5zxcrXTH5Rnu6Ca86feb6uc+v2JlzYbrn70Lp1tyU/DtkB6E1NW2wxMXjQqdmRKPGJpVP6LH4/J86J2u8x4YvkxvpF0auawKzoc0gfHwbluEFKqCwfOONVVSTZ4fgqFspgdXOEZat5rJmQjm5/d+hdRd/gJlDU2n1Xgr5Z53E7Q=='),
('400598a8-bd5f-4a6d-a534-423b535442e8','3f2adcee-b069-4b76-994d-43f6c711e5b1','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('40de7187-5060-4c36-9448-03e0506492e4','9aeb3634-a22f-49ba-89bf-99e5ae9a89e9','allow-default-scopes','true'),
('4316065a-aae2-4ac7-b4ce-2a23dbd5619a','4e2646ad-8fda-4c7e-b44e-05c821b2596d','allow-default-scopes','true'),
('46f86c08-f8dd-4257-a1e8-cf91bc7cf831','25555477-ce73-4ff7-82b3-c6704233811d','allowed-protocol-mapper-types','saml-role-list-mapper'),
('4a507843-773c-4f2f-9b59-d61f5d893a73','329ca7bd-609f-4c2f-900e-b8c78e6cef13','certificate','MIICnzCCAYcCBgGd1pMgrzANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhTaXN0ZW1hczAeFw0yNjA0MjkwMDA5MTlaFw0zNjA0MjkwMDEwNTlaMBMxETAPBgNVBAMMCFNpc3RlbWFzMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7Vmld3PRzraMTJxCPVR6YvKlKZDo5NQ0lAtJ8kDIdxT5T7IvU4DcjZfz/Y28gVmwG6+rrjuuNWwtHn02hR2dXt2wnFn2RYlPXFRBGIod1CBHLy7lr3IuC7Eht5YV3vM7YaSGqQ0dpFpkNFkmuNh1mftT31KI2jf2XAivLSXdxLjNCGhOyTyGCwyg1YBPV6qBEIR/QxYhAg6TlZFV3AqkyQT3nNo6sNe63B9QE8QlWpnvS781C/+AZf0LWQE8FhRHWnYre9soP0nFf/kI8GWME8k3QohKekfDy18dFXrpkZdpZ1qaGSWcFMJo9+b9gH5BCVp+fGfCowv4VK2HuKDIaQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQDgeeKkDFpg6z7AAuWKU+Wg95NBZ/IYMkl3KK8zbXYW4VpbVH3N9+GoIK3v+RAfuGZ5Coz55hK/j9gYYt6QbCsrQm3sjF06Z+lVFK48YWIXqPit/c8LDBGlqmeiWm5K6Hpof4rx+J3NsdWVl/8bzzLv4cVANrovHvqCEC0/6EYVYkq/ymfaKeJzB3ViatUzhiD9dkngH/JAGcFv4+cadHPSGda/21jnS5/G+j0eJYdBn5rkVn5+opuc4ChdfA4KDJIlLowSpaKFMMxEDtrBebJr8zxAw9Zea6HtSfmFZLW1EPq8Fle9zbcg1v7Je8+JNyyXV3rjSmn5LdV5GtUblmTG'),
('4a909f16-d8ae-47c8-8952-4e9b8518a050','17687014-6cfe-45be-8251-56229e8a930e','allowed-protocol-mapper-types','saml-user-property-mapper'),
('4bdf8f6a-3398-4115-9c68-c7e2d9b004f4','17687014-6cfe-45be-8251-56229e8a930e','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('4f3167cd-fe86-4e9b-82f2-eb9edd07141f','17687014-6cfe-45be-8251-56229e8a930e','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('4fcdb4ff-1b97-48ca-aa05-1a04e2d6d130','ae9591a0-72d4-4a4a-af27-d3212e868727','keyUse','ENC'),
('565f671d-8eab-4e19-a56f-d08e758a0736','59eb421c-fd01-4ccb-b2c0-f56a9091c9fd','algorithm','HS512'),
('58fb20ed-bd55-48ea-9bca-c8a1779e72bb','c050a937-fb28-422b-a3af-499f50deee33','allowed-protocol-mapper-types','saml-role-list-mapper'),
('5ca3f822-0a3e-477d-be68-f12b1b4d693d','cf5173d9-9186-4b85-b886-c4430c3dd105','keyUse','SIG'),
('650d281a-d9e9-4e3d-b6f0-ce29dd89240f','024c4ac1-8b13-44f4-be01-ff94bd298233','secret','FjpXdBi_vW5C9wQ20d28tQ2_0UEp8ZXMFka8rLPrM8t5jr6mFsS_IqAMWqc_-JhQVWhxAHCDFihXEnoEQSOd6wS_0vTTJOuwfgutxpWlKWGDtGh_EmLO5tWOtAFj224T_wiQ1OG7-IS7K6y1cOrV1oRMQO7qYs8yL5Qe5PbO28w'),
('67279282-733c-49c0-9e5d-c957c9b92947','3f2adcee-b069-4b76-994d-43f6c711e5b1','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('6845d95e-d910-462d-bbe1-15d95c0383bb','17687014-6cfe-45be-8251-56229e8a930e','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('6925c491-15c3-423a-997a-5959917581ea','5131d381-7249-4a11-9844-54850bfa3e79','algorithm','RSA-OAEP'),
('6992ac5d-de8d-4358-a94b-a8b0b8c3d4f5','329ca7bd-609f-4c2f-900e-b8c78e6cef13','keyUse','SIG'),
('75d7b4e3-165b-4e12-8479-6167f75524ff','c050a937-fb28-422b-a3af-499f50deee33','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('7dc14cd2-7eb1-43ee-b99a-7abd5346b76d','ae9591a0-72d4-4a4a-af27-d3212e868727','privateKey','MIIEpAIBAAKCAQEAoCkyYvqjar4m52tqUkanP+Zri5HKaj4aCwUt8hrj8fc5yG6YoQg2lkdVTvvZfEUWXDiYlYcyn/xdiXNLj0S6YDl6jAvMPL+gyVbQWVXsDIPJTRJ27FabnvrsmrpeROQjA2Jye8wo65m17M3mQp+Y6jvzBC6gTcavFAv0oTAtrtkzBMAt1NT6Cj7ESnmF38uIflDGU+AoPaXe/hbK6cjtSXnil97AJV69+HHkoJDPomdhSbpFG69b5cUn7ccMwGObmYPb2wSXoxDyG6bqZMV77g45GQS08ZZpkhIFm+oAb1SPpm12V+GnIOdN3aW2013+MGThMKh4JBEdc9uL9DJ+ywIDAQABAoIBAANmTHaZ/MNq+ao6dyou6/IcL7BpoRyXNXgb0IlajvfkXqDsBA5eMJAJDJadtVSapmpa6ZY6JYkMbM0NmiiwD0eBANWdkuS/nPSZHj8/M41ic/C2xLjbvJFOOmmtLT7hTs/A4U6fNOEnXpuCFVilrzPA0pw5ald5F6wUj6+nAgxuvcbB9qJwl8T6BX6sQDmxwXlYm8/cN/x32tv10T51B47Ntxv4wkH2dLl/1cdSVL22HvoRNh0jyrx5AKjDfSOxJxDJM43aoQpk97bxASSWwxIPuCmfD/md2dF1Fgc48Ml6iQHXPxgxr8xptYNZ3D1DKuwZousKVH+ok2i2sv0Rjk0CgYEA4htKyWYdSUCmfBBeUNaKtKpOHnSMIW0rQBxQdm/ux7zIQQlQWeaSKqt6It66KvcthcV5OCn5ea8gYCfbXG1GJKcd+592dGtrzXXPYMH/WCoTXJVzmfj9MbqLOqljf0KRPvXeb5knx2B2g4HJeq+P3Rt8uq3tlyKOF8SEGO2oSq0CgYEAtVXvZ1bq9XQdsEbjQ2Z8G77ebbUIfk43kxVAW4dmwkw3O3q+DpbagjHB85AYG8ggDx61zQD3G3POn0scTuLJVdVT6FHTWeMxjdq6USi+qEK9VjQZbujguYF+PPgNTXpmXaGWYYSh12pVPKDpgUsFI0JVEppsfqCNex1QjEL3VlcCgYA74RZxN8XRvHlaqcsQhYC+T8vYbO0ffRXTKKx2cTY/V1OBRcItzM4w1rDFw05ySnuXzbBIm3UiMKrWTDffxmCpHEjodlachkZKZ0TATyAcbSgrgLjYsgP7w3dT1cAv16U3k02RKHJMbtN0CE8fWpcy6zChD6a4O8J9sOF66JWFEQKBgQCwTXrTuDf8qQZsap9u2mdz+mD7vPUjCB0UTaci1kRcSAmzNKUwPg74YjQ2ADTQXgR9bthHFtcpw7ByQ26ka+5gG2bXCyc3z6JQTway/bBQm4LGGyVXJefHtFTuJiWY3JZGFmLFMVTAwctZhQFCCZRXMZjQ2378plCoEFpN5JXhRQKBgQCqRbUsF4Ku79K4gY/8/5J6892yEG96jp7vsUAD1sWcXEl6vey6KlJI5Rp4azAYcOCXcO/52jD8WtWSo0v0IhOB3v9q+X09ZVO4dFJ+BcDCTIlrujngfwWwNYOSrRn7aiHNqRnQ2juXKkNLzPkv6qlrcWh2Y7SWe2xv/F3dXa0x1g=='),
('84dc9530-a07b-462f-8585-0edc31a43bee','25555477-ce73-4ff7-82b3-c6704233811d','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('85a53503-3f48-493b-b440-e01f2f7b2bdc','b32c109b-20b3-4425-8d8a-48a595e6fa14','client-uris-must-match','true'),
('8d789220-e9b7-40e5-8657-c4a42daa4148','3f2adcee-b069-4b76-994d-43f6c711e5b1','allowed-protocol-mapper-types','saml-user-property-mapper'),
('8e3e8c24-90bb-4e41-a1c9-21378b6f1166','4b637a3a-eaaf-455e-9fb5-859e66eed07c','kc.user.profile.config','{\"attributes\":[{\"name\":\"username\",\"displayName\":\"${username}\",\"validations\":{\"length\":{\"min\":3,\"max\":255},\"username-prohibited-characters\":{},\"up-username-not-idn-homograph\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"email\",\"displayName\":\"${email}\",\"validations\":{\"email\":{},\"length\":{\"max\":255}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"firstName\",\"displayName\":\"${firstName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"lastName\",\"displayName\":\"${lastName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false}],\"groups\":[{\"name\":\"user-metadata\",\"displayHeader\":\"User metadata\",\"displayDescription\":\"Attributes, which refer to user metadata\"}]}'),
('9585464d-d9ac-4721-a8d2-b2a2b8a10d96','c050a937-fb28-422b-a3af-499f50deee33','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('9742735c-bd35-4957-8c76-e49bc42b9814','3f2adcee-b069-4b76-994d-43f6c711e5b1','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('986281d8-03cc-4517-89c5-bbad83baefe5','3f2adcee-b069-4b76-994d-43f6c711e5b1','allowed-protocol-mapper-types','saml-role-list-mapper'),
('9ade3a19-6619-426e-bd8f-a261895eb29d','d5161818-cda9-4f51-826f-0e7435df0f50','allow-default-scopes','true'),
('a21ce66f-db36-442c-b857-b7f86a3b05c9','66f4b43a-7b82-4fa0-939f-3e8d33eea021','secret','0ve9Dfd3-QvUh6FabIrOZg'),
('a57a3309-44d6-498f-b645-48e18e299edf','cf5173d9-9186-4b85-b886-c4430c3dd105','privateKey','MIIEpAIBAAKCAQEAybFsbURIREA3g3BCi9jYC4tz7YmJdhEb9/lVOa8pbWwzh8H/dUaEUDvzl5Zf6eCXmKd8sBXI1xcJbEActe92cPoKbBQi//bPPeVQHdUViLB7QGhqkrftgoU7vZJnJfzmu0HASW5HMMV240q+CvtnF2TWK0SdVeutph8Aj135o2zpG/YPv8m4rj336jHzG0m1/SvootGetZ3VWg/B0sG/Cv+PhjpeRbl/60yFx2yxloVspYMnleq+1A/eriwLVqr/CcyaqOWginPQSFS4/WT0y32Oqv72ptPGuRLnA73oZQxOfhMOM+b9onDmkViG8UYyd3QV6OFoKq3AA2+rHfUiqwIDAQABAoIBAB3BvHJ+gX74Tnho5piFXJKPd4ITKaGusoaqVYWWLzGCpjOgTpU52ymPPsgdmncB+Lu/8ih0flYlgvFioBnDg6D1cvYxHlzPSBIks+ZC2tN43iZJgXe2BSediovUfr1fC5eTAtCSoZQzfe/YxiMOpk4QRXzKub/EbrE0n7uHLN6MXuWXD8sVdTIusG0dEcJrhFA8IbfWXzeOWZIWUjlwfTvHrwJeK6e515jmouyhYaF65y6zKK767uHehogWt9OrN/L5X80PUshFBh0qObdysXBj7MvupvVs6dobnz6qFVTR8y3hq2v5h5ShWaSxQjGVDcRd2Js5nzIipampcf3C/xkCgYEA5nszWFwmWgs+ZKPiLlOSGBxBeqIi+KPSQDWNPmuPCj8aLbNOmdhCO89EMKQytJ2fbv+qoXYyV+R22ThVHhHr12XHQaveThL3zWrzO1bjNjEmC/esr7Ind0onyz4b6U5yPRTI9vQVJRXquUKakIT0OOQ6MgY6CkZT6YmTK50sEi8CgYEA4AY+4WB7F3pOpOL8UYrC5xehb4M8HEnUqR7mUinVW/YMcLqO1aqc9bhDbrTq+cx7wAV4KpCgLgsfU0jZf01MIAlxe6kzfShMedg1fYANYkcQY9v6Kq1L0rPZrX2Hag4sxgmbmoCHfE0P5lmMB/suHdzyU0UB56Dkr2pKVMqMhEUCgYEAzWG7v2FeS575WnUveFjANvv23XDd+PMCyHTwCE+Qh3DzwwWlZTJw0xs/iJjJFmnfSOpLAtZwxiGwRqEMOF9/6dGoXbzpvGjqqQJE/PvQPNpPLRrnpyj6QjKyg0o1VRGyevuqmWWn8gQ1xiCz21SezJOTyEAEOGOzIsiVfKfyPcECgYBGuXIMkPsLVG+Tmp1x2M7jShCLNfE6NQzQP5MTCWX0XF9dD2ich/p5kKypPLCaIDZJTvC672HCZ3yCPJN9nxeTXafYFHjO4HQUW2+3qT+QcUL5Y6883ez8Hg9wuBqSHtt/wfS/+CfN1D5ayJZuxpuujdxq8XRCfgb0YigJUNC/yQKBgQCkALRCPOv08NfKFVvMtcyrVIDvHT8m5pVmD3fNbT7EV25gsYo+/DO4JFr6f3YJr5DAGAhUjMBl4sD08HWFyKkUSdi2MOcq3vVrFUHSRqcHP3VH0L7fYjJE1ydmEP1eU+YxIrxK4WDq0AvJyJWiqkWnQmmhHvdiN9wkofJQLrH7NQ=='),
('a94929f4-4414-4cf3-ac6c-21f0bf22f436','024c4ac1-8b13-44f4-be01-ff94bd298233','kid','b208b808-19e0-4d7b-9006-a03da04d7651'),
('a963d8b9-5982-40f4-98a2-581fab794baf','3f2adcee-b069-4b76-994d-43f6c711e5b1','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('a9ba6f10-0b1e-492d-b86e-c4fb0909a85a','8b011e2f-128f-4ebf-b3fd-838ad3a1e2eb','host-sending-registration-request-must-match','true'),
('a9fb1b12-dede-4277-ba5b-12719f2589c9','edab1597-8ef2-44a0-b6c2-0adb1145e3fa','max-clients','200'),
('aad4576f-f473-4571-bcdd-2578672eed5e','329ca7bd-609f-4c2f-900e-b8c78e6cef13','priority','100'),
('ac3428f8-1458-4d42-b74e-dfbcce8b21ca','cf5173d9-9186-4b85-b886-c4430c3dd105','certificate','MIICmzCCAYMCBgGd1lUPrzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjYwNDI4MjMwMTMyWhcNMzYwNDI4MjMwMzEyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDJsWxtREhEQDeDcEKL2NgLi3PtiYl2ERv3+VU5ryltbDOHwf91RoRQO/OXll/p4JeYp3ywFcjXFwlsQBy173Zw+gpsFCL/9s895VAd1RWIsHtAaGqSt+2ChTu9kmcl/Oa7QcBJbkcwxXbjSr4K+2cXZNYrRJ1V662mHwCPXfmjbOkb9g+/ybiuPffqMfMbSbX9K+ii0Z61ndVaD8HSwb8K/4+GOl5FuX/rTIXHbLGWhWylgyeV6r7UD96uLAtWqv8JzJqo5aCKc9BIVLj9ZPTLfY6q/vam08a5EucDvehlDE5+Ew4z5v2icOaRWIbxRjJ3dBXo4WgqrcADb6sd9SKrAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIZg59Ecfh3Xzv608RIvfrWEdtB742BpOs1VFOySe22G94QyxrbWoPyUM6B5Q8nS8yrOsjK06PPiZbZRDsa2HAH0hF5s1WzrD/YaXpMyoB1kfefr3TIuBj6PzWZM5j60aOxam1QF2RaQI0SrqT61O0PKEHEGnzGK2OwW0etm+SoDYP1DD3d7HUkv1YgeI1f6Q291RrTp5kt+VFYVs2ZpE9EWaBl3FCKA9oX2nvUsFTloLZIqwv+5KStZ/vqFEI+oGz/1puxBAqB/EnT8rVTPrCtHC+cWT2Yg9rdHpcnW5VafClC9jFeHROtnavstqzPzY//cJNY7kTsLACMCbQdhzk4='),
('b6de08a4-76fb-455d-b3e3-e1634079553a','ae9591a0-72d4-4a4a-af27-d3212e868727','certificate','MIICmzCCAYMCBgGd1lUQLzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjYwNDI4MjMwMTMyWhcNMzYwNDI4MjMwMzEyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCgKTJi+qNqvibna2pSRqc/5muLkcpqPhoLBS3yGuPx9znIbpihCDaWR1VO+9l8RRZcOJiVhzKf/F2Jc0uPRLpgOXqMC8w8v6DJVtBZVewMg8lNEnbsVpue+uyaul5E5CMDYnJ7zCjrmbXszeZCn5jqO/MELqBNxq8UC/ShMC2u2TMEwC3U1PoKPsRKeYXfy4h+UMZT4Cg9pd7+FsrpyO1JeeKX3sAlXr34ceSgkM+iZ2FJukUbr1vlxSftxwzAY5uZg9vbBJejEPIbpupkxXvuDjkZBLTxlmmSEgWb6gBvVI+mbXZX4acg503dpbbTXf4wZOEwqHgkER1z24v0Mn7LAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACqeI7b85kkg8wvPJt9bpkUOuAMWdVWS4B91ic2PeqC6Nzpmn4H0uj5tVDW8wmcn9H8neWVa4KkObJapA4VUmuddj305QVE7eEIByWW2yNBIufH8SfiM2Wc2rGw5i9Z54WscpAD9Oev0N4XfOgZmYddaft2ZA6K4fbYWdtRiHQaTsDnMrW+E0WQu0VQadS9TDBkqbNc2dcv8gRkz1AwMBuoWz8DpR25luV6Uv4ynhN+FJx/bOgCHUnGtHzcLNrHI+wMaZ/nfpj2IIOnQD41wGl6kriRfDbIEAUrK1xCVibdtBORN69232u80JN3Etu6e53pYnBMlIJW3wZdtaJRZq1k='),
('b91b096a-ad19-4a8d-9041-13ec71453e9f','17687014-6cfe-45be-8251-56229e8a930e','allowed-protocol-mapper-types','saml-role-list-mapper'),
('b981c0bb-813c-465d-81eb-48459dee3982','b32c109b-20b3-4425-8d8a-48a595e6fa14','host-sending-registration-request-must-match','true'),
('be6e20af-1935-4d73-a19d-14bb0508de0e','25555477-ce73-4ff7-82b3-c6704233811d','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('c18fa35b-a639-4aae-b6d7-deda0b8eae83','c050a937-fb28-422b-a3af-499f50deee33','allowed-protocol-mapper-types','saml-user-property-mapper'),
('c5ff8bd2-f759-445d-8dbb-baca469a16ca','17687014-6cfe-45be-8251-56229e8a930e','allowed-protocol-mapper-types','oidc-address-mapper'),
('c9302b24-7910-4e5c-98c3-73f65bcf4b46','17687014-6cfe-45be-8251-56229e8a930e','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('ca6f51e3-481b-48bb-a1fb-f599d09e6cfc','c050a937-fb28-422b-a3af-499f50deee33','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('cc796a90-3f81-49ab-b52e-91f1ac29a08e','59eb421c-fd01-4ccb-b2c0-f56a9091c9fd','secret','bEisBAXueXSI_qq4ZZMdj6yFLwhT8vhscgL5ccZHhfE5rG737Y1cCsYYySfoygwNLEyNiLJ5JY8YjhI-FKuQrueVMaJpyCpSDLvTWIfSwEhdpLR0ENFPhcvzulBtrhTTlPvp87U5zieC_-wi6Bv14aztxnIngpbaP5UbPA4X8wo'),
('d1885ad3-5a13-432a-b264-2c1007e7cdab','25555477-ce73-4ff7-82b3-c6704233811d','allowed-protocol-mapper-types','saml-user-property-mapper'),
('d6e7eae0-cc96-4a2d-8ad9-de8a3131415c','25555477-ce73-4ff7-82b3-c6704233811d','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('d999eb31-ce9e-449a-b2bb-c0f24d2ffe63','3f2adcee-b069-4b76-994d-43f6c711e5b1','allowed-protocol-mapper-types','oidc-address-mapper'),
('db0f2797-415b-4307-83f9-9d35ed5f7656','48b658e0-e134-4a57-8447-e5ae0fba5c33','priority','100'),
('e12708e3-17cc-4bea-a390-9fef2624cc3a','ae9591a0-72d4-4a4a-af27-d3212e868727','algorithm','RSA-OAEP'),
('e1c2ac48-20c9-4496-a0b0-12e48c750950','9c793c3e-b562-4c4a-a93c-77538535c39e','max-clients','200'),
('e2bedc1e-9a24-4928-b985-90cdf6c72b88','ae9591a0-72d4-4a4a-af27-d3212e868727','priority','100'),
('e53505ef-1d7a-4c6a-9854-527b153b5a9d','cf5173d9-9186-4b85-b886-c4430c3dd105','priority','100'),
('e6d34766-f87f-4d6c-a5c8-ea61e6468fe9','024c4ac1-8b13-44f4-be01-ff94bd298233','priority','100'),
('f1a02b5d-7d74-43c3-82dc-6d9068e1d716','48b658e0-e134-4a57-8447-e5ae0fba5c33','secret','v0T6mECr8m9kOCIKqG0k9Q'),
('f5c6b433-17db-4f15-b744-6592b215bd30','5131d381-7249-4a11-9844-54850bfa3e79','keyUse','ENC'),
('f7d92edb-fedd-4c31-bf24-f80295417227','17687014-6cfe-45be-8251-56229e8a930e','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('ff5f6472-0211-4e85-b43c-4040df29d817','25555477-ce73-4ff7-82b3-c6704233811d','allowed-protocol-mapper-types','oidc-address-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES
('0184c82b-c4bd-4d77-b38a-3ca357a6861e','631e19df-51ba-4ddb-856c-7f9b42ac3b43'),
('0184c82b-c4bd-4d77-b38a-3ca357a6861e','8d2d9e7b-cac4-49af-b44f-c82bd86e9f65'),
('2cf52e67-c15b-4f73-9e9d-d9d94a70ca27','7675c5f3-7dcd-4666-b194-40e6353a85a0'),
('2eb9d93b-1956-45d0-9dfc-b043b5a07da3','4eb8bca9-4e2f-4391-bd0b-ec396e995713'),
('3342c57e-a0d5-4947-8d51-475a26905f4f','38381f08-ccc1-425e-9567-092a7ecb4174'),
('3342c57e-a0d5-4947-8d51-475a26905f4f','b9948dce-3d2a-4443-8242-1c447efdfc67'),
('3936c5f8-6723-4b16-be11-7af194629c50','88bfc14f-840a-4abd-8833-d5134ae8b336'),
('50254feb-4f0d-49f9-a235-278c7ef90ce7','085a2695-4be9-4301-9e21-7e26dc0a9b34'),
('50254feb-4f0d-49f9-a235-278c7ef90ce7','3936c5f8-6723-4b16-be11-7af194629c50'),
('50254feb-4f0d-49f9-a235-278c7ef90ce7','7be9979a-5edc-4148-9d9c-fbf89d8fcf14'),
('50254feb-4f0d-49f9-a235-278c7ef90ce7','a34523b5-18b9-4b47-9eb5-9e7664d8e63a'),
('586807a9-7a4b-45fc-96df-6a7f4ee75216','d492f2ec-afb2-437c-a4af-806d6b07b8af'),
('605f05fd-52b9-42d8-8078-3ac132d3dd65','dd863f74-9989-4d2a-8e49-2e14a496cd56'),
('7746ddff-8114-430d-a5f7-7adefcaf8e57','cf26f916-dd3f-4c71-a6a0-65ecb0a644ea'),
('8f4352cc-291c-4a75-ac47-d23c30c2db79','841c22f8-8f04-4540-be20-c0eed4e6bec1'),
('8f4352cc-291c-4a75-ac47-d23c30c2db79','ad043e24-483a-4eb1-b828-405bbcb797ba'),
('bf9953a3-2fab-44a2-84b5-94121a36e120','c5816b1a-6cb5-48bc-8634-77f036baa8c3'),
('c13cec6c-046d-4118-b799-bb43102332dc','00b974d7-a572-4a77-bb88-1fca2ffe869f'),
('c13cec6c-046d-4118-b799-bb43102332dc','18ff4b3d-88a5-401c-9b94-8edc0889888d'),
('c13cec6c-046d-4118-b799-bb43102332dc','226ce10c-279a-465d-89a8-51eb9d986402'),
('c13cec6c-046d-4118-b799-bb43102332dc','2fc6b14a-14c0-41f1-bc3f-9fabd8077bf9'),
('c13cec6c-046d-4118-b799-bb43102332dc','3342c57e-a0d5-4947-8d51-475a26905f4f'),
('c13cec6c-046d-4118-b799-bb43102332dc','38381f08-ccc1-425e-9567-092a7ecb4174'),
('c13cec6c-046d-4118-b799-bb43102332dc','576b31ae-1830-4421-ae86-7736b9597386'),
('c13cec6c-046d-4118-b799-bb43102332dc','5b0dd670-5b97-42fd-b027-1b7c0125d0c5'),
('c13cec6c-046d-4118-b799-bb43102332dc','5e24016c-69ed-411f-904b-b4e225fbdf1b'),
('c13cec6c-046d-4118-b799-bb43102332dc','605f05fd-52b9-42d8-8078-3ac132d3dd65'),
('c13cec6c-046d-4118-b799-bb43102332dc','7c254547-51fc-4494-925c-44dc177b5e13'),
('c13cec6c-046d-4118-b799-bb43102332dc','85cc16cf-3a40-47cc-ab0b-c1f42c1b235b'),
('c13cec6c-046d-4118-b799-bb43102332dc','885c0367-da6b-486f-ab14-7d185c11997f'),
('c13cec6c-046d-4118-b799-bb43102332dc','b9948dce-3d2a-4443-8242-1c447efdfc67'),
('c13cec6c-046d-4118-b799-bb43102332dc','c64650a9-134b-45e0-9d1b-2a55c35ba28f'),
('c13cec6c-046d-4118-b799-bb43102332dc','ce45c81c-ec9e-4c51-b0a2-331efcdd3bb0'),
('c13cec6c-046d-4118-b799-bb43102332dc','dd863f74-9989-4d2a-8e49-2e14a496cd56'),
('c13cec6c-046d-4118-b799-bb43102332dc','f5e801bd-503d-44a3-aa6a-25253fe33a4a'),
('c31d5fd4-8009-4637-968e-af3f92054f33','0184c82b-c4bd-4d77-b38a-3ca357a6861e'),
('c31d5fd4-8009-4637-968e-af3f92054f33','0bd4071b-c1af-466d-820f-79dd06c06e67'),
('c31d5fd4-8009-4637-968e-af3f92054f33','0ed7002c-841a-4eac-952e-67dfae9281bb'),
('c31d5fd4-8009-4637-968e-af3f92054f33','17c53b1d-8291-4c7e-bae8-e01b7e2ca20f'),
('c31d5fd4-8009-4637-968e-af3f92054f33','1c8fc9af-3712-42c8-bc7d-c3d700797b4c'),
('c31d5fd4-8009-4637-968e-af3f92054f33','20978927-ad49-48fb-861a-75458cd0586b'),
('c31d5fd4-8009-4637-968e-af3f92054f33','2733cb8b-5e73-4f4d-9914-fd9a95696192'),
('c31d5fd4-8009-4637-968e-af3f92054f33','3b47c2dc-94fa-4cd4-ba39-8b965d5ac8e9'),
('c31d5fd4-8009-4637-968e-af3f92054f33','45fd9e28-26d5-43ed-9304-fc90db55ccb2'),
('c31d5fd4-8009-4637-968e-af3f92054f33','4ff285cc-0959-46ab-9c3e-9244db9ac10b'),
('c31d5fd4-8009-4637-968e-af3f92054f33','586807a9-7a4b-45fc-96df-6a7f4ee75216'),
('c31d5fd4-8009-4637-968e-af3f92054f33','5a98001a-eef1-474e-82b4-af969c3c5342'),
('c31d5fd4-8009-4637-968e-af3f92054f33','5bee395b-ebc8-4697-96dc-5efd5ed6a4b5'),
('c31d5fd4-8009-4637-968e-af3f92054f33','61677384-ca37-4ca3-93e4-611ffc3971f1'),
('c31d5fd4-8009-4637-968e-af3f92054f33','631e19df-51ba-4ddb-856c-7f9b42ac3b43'),
('c31d5fd4-8009-4637-968e-af3f92054f33','841c22f8-8f04-4540-be20-c0eed4e6bec1'),
('c31d5fd4-8009-4637-968e-af3f92054f33','89e82877-a72c-4043-b4c3-3f908dbd0e7d'),
('c31d5fd4-8009-4637-968e-af3f92054f33','8c70b0c4-fd97-4efb-833e-b6f66270cac5'),
('c31d5fd4-8009-4637-968e-af3f92054f33','8d2d9e7b-cac4-49af-b44f-c82bd86e9f65'),
('c31d5fd4-8009-4637-968e-af3f92054f33','8f4352cc-291c-4a75-ac47-d23c30c2db79'),
('c31d5fd4-8009-4637-968e-af3f92054f33','919e6d7d-7b1d-4f40-b8ad-cf541f6ab79b'),
('c31d5fd4-8009-4637-968e-af3f92054f33','ad043e24-483a-4eb1-b828-405bbcb797ba'),
('c31d5fd4-8009-4637-968e-af3f92054f33','bf9953a3-2fab-44a2-84b5-94121a36e120'),
('c31d5fd4-8009-4637-968e-af3f92054f33','c5816b1a-6cb5-48bc-8634-77f036baa8c3'),
('c31d5fd4-8009-4637-968e-af3f92054f33','c59f6e7f-974b-4c43-b814-cf2dae33dd95'),
('c31d5fd4-8009-4637-968e-af3f92054f33','c6d7d5d2-46e8-4cf6-8e91-8b9df9001dde'),
('c31d5fd4-8009-4637-968e-af3f92054f33','c8ea7e11-dbc4-487e-8db8-9bea6854b664'),
('c31d5fd4-8009-4637-968e-af3f92054f33','ce09e044-9fb3-4d20-9d13-054fe1fe3d9e'),
('c31d5fd4-8009-4637-968e-af3f92054f33','d492f2ec-afb2-437c-a4af-806d6b07b8af'),
('c31d5fd4-8009-4637-968e-af3f92054f33','d60a729b-0e58-4d85-8013-65f7939e31b4'),
('c31d5fd4-8009-4637-968e-af3f92054f33','d8f8da5f-d099-4a4e-8586-8a4ae7c159c1'),
('c31d5fd4-8009-4637-968e-af3f92054f33','d994aa5c-5d0e-4eb0-bb06-a7444384ce51'),
('c31d5fd4-8009-4637-968e-af3f92054f33','da7f64f9-64fc-4556-a79a-d64c7839dcfe'),
('c31d5fd4-8009-4637-968e-af3f92054f33','e7574d85-f05b-42cf-909f-3e94aabd7497'),
('c31d5fd4-8009-4637-968e-af3f92054f33','ead11267-7d2a-4235-a1e0-32fda2fb8620'),
('c31d5fd4-8009-4637-968e-af3f92054f33','fb8324be-41cd-4dd9-b633-98411ca1df10'),
('c31d5fd4-8009-4637-968e-af3f92054f33','ff8f9c83-f81a-48d9-9932-ee0b2a903192'),
('e308448e-9633-4fc8-8712-03fe1b70bbf0','2eb9d93b-1956-45d0-9dfc-b043b5a07da3'),
('e308448e-9633-4fc8-8712-03fe1b70bbf0','b6ffcee3-d9b3-42a2-89e6-d1f348245d95'),
('e308448e-9633-4fc8-8712-03fe1b70bbf0','c9d4140e-cb74-4ee4-92d0-cd5a5cff38fe'),
('e308448e-9633-4fc8-8712-03fe1b70bbf0','ecea392e-24a7-4374-898f-499efd565e92');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext DEFAULT NULL,
  `CREDENTIAL_DATA` longtext DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES
('1cf95c58-927d-41ff-afb8-66cdcae14164',NULL,'password','630afa86-3a25-489b-bde6-2809f9c20ed4',1778717072626,'My password','{\"value\":\"/tgyEMz92YxbTo3kBzdDZb92gT0b8KciclcW3TvTYRc=\",\"salt\":\"p5diR8rcoPCqcZY4fXc2sg==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10,3),
('1ed685dd-917c-45c4-8133-30463344679a',NULL,'password','4255edb8-bff3-48c0-9683-85e29c76a0af',1778933507696,'My password','{\"value\":\"vVzLuugmWRuHNyS8Kb5Y+Kg4xTJbrP6/+AqhrdjaRSo=\",\"salt\":\"jnLDkv6tjGHL2Hv4cy68HA==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10,7),
('c291ddb3-c454-4921-89cc-45998540bff6',NULL,'password','1e25ba6b-2ed9-4695-992a-4ae3545c7526',1777422134028,'My password','{\"value\":\"lOfM54VYLY3s12/6fXjyCdmLZhq6ROPPdAbjzd/yqNg=\",\"salt\":\"eDQX5F3K+bncn+Ong2Nlzw==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10,1),
('eafdd2ec-50c2-4113-b4bb-fb167c05420f',NULL,'password','8c7860e9-03e7-4400-a106-c1f28a6a7823',1777417392935,NULL,'{\"value\":\"mOJehECLuRMAbhGI8FaUAyTAejlOaWrrs/GiGUsTQCU=\",\"salt\":\"/EDuawr+Y1FVZo28dac9NQ==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10,0);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES
('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2026-04-28 05:32:13',2,'MARK_RAN','9:828775b1596a07d1200ba1d49e5e3941','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2026-04-28 05:32:13',1,'EXECUTED','9:6f1016664e21e16d26517a4418f5e3df','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2026-04-28 05:32:14',3,'EXECUTED','9:5f090e44a7d595883c1fb61f4b41fd38','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2026-04-28 05:32:14',4,'EXECUTED','9:c07e577387a3d2c04d1adc9aaad8730e','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2026-04-28 05:32:18',6,'MARK_RAN','9:543b5c9989f024fe35c6f6c5a97de88e','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2026-04-28 05:32:18',5,'EXECUTED','9:b68ce996c655922dbcd2fe6b6ae72686','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2026-04-28 05:32:21',9,'EXECUTED','9:9d05c7be10cdb873f8bcb41bc3a8ab23','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2026-04-28 05:32:21',8,'MARK_RAN','9:db4a145ba11a6fdaefb397f6dbf829a1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2026-04-28 05:32:21',7,'EXECUTED','9:765afebbe21cf5bbca048e632df38336','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2026-04-28 05:32:25',10,'EXECUTED','9:18593702353128d53111f9b1ff0b82b8','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2026-04-28 05:32:27',12,'MARK_RAN','9:e1ff28bf7568451453f844c5d54bb0b5','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2026-04-28 05:32:27',11,'EXECUTED','9:6122efe5f090e41a85c0f1c9e52cbb62','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2026-04-28 05:32:27',13,'EXECUTED','9:7af32cd8957fbc069f796b61217483fd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2026-04-28 05:32:28',17,'EXECUTED','9:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2026-04-28 05:32:28',14,'EXECUTED','9:6005e15e84714cd83226bf7879f54190','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2026-04-28 05:32:28',16,'MARK_RAN','9:f8dadc9284440469dcf71e25ca6ab99b','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2026-04-28 05:32:28',15,'MARK_RAN','9:bf656f5a2b055d07f314431cae76f06c','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2026-04-28 05:32:30',18,'EXECUTED','9:3368ff0be4c2855ee2dd9ca813b38d8e','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2026-04-28 05:32:32',21,'MARK_RAN','9:831e82914316dc8a57dc09d755f23c51','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2026-04-28 05:32:31',19,'EXECUTED','9:8ac2fb5dd030b24c0570a763ed75ed20','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2026-04-28 05:32:32',22,'MARK_RAN','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2026-04-28 05:32:32',20,'EXECUTED','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2026-04-28 05:32:33',23,'EXECUTED','9:bc3d0f9e823a69dc21e23e94c7a94bb1','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2026-04-28 05:32:33',25,'MARK_RAN','9:0d6c65c6f58732d81569e77b10ba301d','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2026-04-28 05:32:33',24,'EXECUTED','9:c9999da42f543575ab790e76439a2679','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2026-04-28 05:32:34',26,'EXECUTED','9:fc576660fc016ae53d2d4778d84d86d0','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2026-04-28 05:33:22',88,'EXECUTED','9:fffabce2bc01e1a8f5110d5278500065','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-04-28 05:33:23',94,'EXECUTED','9:43c0c1055b6761b4b3e89de76d612ccf','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-04-28 05:33:22',91,'EXECUTED','9:ad1194d66c937e3ffc82386c050ba089','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-04-28 05:33:23',93,'MARK_RAN','9:544d201116a0fcc5a5da0925fbbc3bde','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-04-28 05:33:23',95,'MARK_RAN','9:8bd711fd0330f4fe980494ca43ab1139','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-04-28 05:33:24',97,'EXECUTED','9:24fb8611e97f29989bea412aa38d12b7','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-04-28 05:33:24',98,'MARK_RAN','9:259f89014ce2506ee84740cbf7163aa7','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-04-28 05:33:24',99,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-04-28 05:33:24',100,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-04-28 05:33:24',101,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2026-04-28 05:33:25',104,'EXECUTED','9:47a760639ac597360a8219f5b768b4de','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2026-04-28 05:33:25',105,'EXECUTED','9:a6272f0576727dd8cad2522335f5d99e','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2026-04-28 05:33:25',106,'EXECUTED','9:015479dbd691d9cc8669282f4828c41d','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('18.0.15-30992-index-consent','keycloak','META-INF/jpa-changelog-18.0.15.xml','2026-04-28 05:33:25',107,'EXECUTED','9:80071ede7a05604b1f4906f3bf3b00f0','createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2026-04-28 05:33:25',108,'EXECUTED','9:9518e495fdd22f78ad6425cc30630221','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2026-04-28 05:32:39',29,'EXECUTED','9:bd88e1f833df0420b01e114533aee5e8','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2026-04-28 05:32:39',30,'EXECUTED','9:a7022af5267f019d020edfe316ef4371','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2026-04-28 05:32:40',31,'EXECUTED','9:fc155c394040654d6a79227e56f5e25a','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2026-04-28 05:32:40',32,'EXECUTED','9:eac4ffb2a14795e5dc7b426063e54d88','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2026-04-28 05:32:40',33,'EXECUTED','9:54937c05672568c4c64fc9524c1e9462','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2026-04-28 05:32:44',36,'EXECUTED','9:61b6d3d7a4c0e0024b0c839da283da0c','addColumn tableName=REALM','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2026-04-28 05:32:40',34,'MARK_RAN','9:737ee933fd399814ed5e24f3b1bbe39d','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2026-04-28 05:32:44',35,'EXECUTED','9:33d72168746f81f98ae3a1e8e0ca3554','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2026-04-28 05:32:44',37,'EXECUTED','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2026-04-28 05:32:44',38,'EXECUTED','9:a2b870802540cb3faa72098db5388af3','addColumn tableName=FED_USER_CONSENT','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2026-04-28 05:33:26',109,'EXECUTED','9:f2e1331a71e0aa85e5608fe42f7f681c','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('20.0.0-12964-supported-dbs-edb-migration','keycloak','META-INF/jpa-changelog-20.0.0.xml','2026-04-28 05:33:26',110,'MARK_RAN','9:a6b18a8e38062df5793edbe064f4aecd','dropIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE; createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2026-04-28 05:33:26',111,'MARK_RAN','9:1a6fcaa85e20bdeae0a9ce49b41946a5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2026-04-28 05:33:26',115,'EXECUTED','9:7ee1f7a3fb8f5588f171fb9a6ab623c0','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2026-04-28 05:33:26',116,'EXECUTED','9:3d7e830b52f33676b9d64f7f2b2ea634','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2026-04-28 05:33:26',117,'MARK_RAN','9:627d032e3ef2c06c0e1f73d2ae25c26c','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('22.0.0-17484-updated','keycloak','META-INF/jpa-changelog-22.0.0.xml','2026-04-28 05:33:26',118,'EXECUTED','9:90af0bfd30cafc17b9f4d6eccd92b8b3','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('22.0.5-24031','keycloak','META-INF/jpa-changelog-22.0.0.xml','2026-04-28 05:33:26',119,'MARK_RAN','9:a60d2d7b315ec2d3eba9e2f145f9df28','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('23.0.0-12062','keycloak','META-INF/jpa-changelog-23.0.0.xml','2026-04-28 05:33:27',120,'EXECUTED','9:2168fbe728fec46ae9baf15bf80927b8','addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('23.0.0-17258','keycloak','META-INF/jpa-changelog-23.0.0.xml','2026-04-28 05:33:27',121,'EXECUTED','9:36506d679a83bbfda85a27ea1864dca8','addColumn tableName=EVENT_ENTITY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('24.0.0-26618-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.0.xml','2026-04-28 05:33:28',124,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('24.0.0-26618-edb-migration','keycloak','META-INF/jpa-changelog-24.0.0.xml','2026-04-28 05:33:28',126,'MARK_RAN','9:2f684b29d414cd47efe3a3599f390741','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES; createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('24.0.0-26618-reindex','keycloak','META-INF/jpa-changelog-24.0.0.xml','2026-04-28 05:33:28',125,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('24.0.0-9758','keycloak','META-INF/jpa-changelog-24.0.0.xml','2026-04-28 05:33:28',122,'EXECUTED','9:502c557a5189f600f0f445a9b49ebbce','addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('24.0.0-9758-2','keycloak','META-INF/jpa-changelog-24.0.0.xml','2026-04-28 05:33:28',123,'EXECUTED','9:bf0fdee10afdf597a987adbf291db7b2','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('24.0.2-27228','keycloak','META-INF/jpa-changelog-24.0.2.xml','2026-04-28 05:33:28',127,'EXECUTED','9:eaee11f6b8aa25d2cc6a84fb86fc6238','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('24.0.2-27967-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.2.xml','2026-04-28 05:33:28',128,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('24.0.2-27967-reindex','keycloak','META-INF/jpa-changelog-24.0.2.xml','2026-04-28 05:33:28',129,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('25.0.0-28265-index-2-mysql','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:28',136,'EXECUTED','9:b7ef76036d3126bb83c2423bf4d449d6','createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('25.0.0-28265-index-2-not-mysql','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:29',137,'MARK_RAN','9:23396cf51ab8bc1ae6f0cac7f9f6fcf7','createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('25.0.0-28265-index-cleanup-css-preload','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:28',135,'EXECUTED','9:5411d2fb2891d3e8d63ddb55dfa3c0c9','dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('25.0.0-28265-index-cleanup-uss-by-usersess','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:28',134,'EXECUTED','9:6eee220d024e38e89c799417ec33667f','dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('25.0.0-28265-index-cleanup-uss-createdon','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:28',132,'EXECUTED','9:78ab4fc129ed5e8265dbcc3485fba92f','dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('25.0.0-28265-index-cleanup-uss-preload','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:28',133,'EXECUTED','9:de5f7c1f7e10994ed8b62e621d20eaab','dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('25.0.0-28265-index-creation','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:28',131,'EXECUTED','9:3e96709818458ae49f3c679ae58d263a','createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('25.0.0-28265-tables','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:28',130,'EXECUTED','9:deda2df035df23388af95bbd36c17cef','addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('25.0.0-28861-index-creation','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:30',142,'EXECUTED','9:b9acb58ac958d9ada0fe12a5d4794ab1','createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('25.0.0-org','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:29',138,'EXECUTED','9:5c859965c2c9b9c72136c360649af157','createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.0.0-32583-drop-redundant-index-on-client-session','keycloak','META-INF/jpa-changelog-26.0.0.xml','2026-04-28 05:33:32',150,'EXECUTED','9:24972d83bf27317a055d234187bb4af9','dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.0.0-33201-org-redirect-url','keycloak','META-INF/jpa-changelog-26.0.0.xml','2026-04-28 05:33:32',152,'EXECUTED','9:4d0e22b0ac68ebe9794fa9cb752ea660','addColumn tableName=ORG','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.0.0-idps-for-login','keycloak','META-INF/jpa-changelog-26.0.0.xml','2026-04-28 05:33:32',149,'EXECUTED','9:51f5fffadf986983d4bd59582c6c1604','addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.0.0-org-alias','keycloak','META-INF/jpa-changelog-26.0.0.xml','2026-04-28 05:33:30',143,'EXECUTED','9:6ef7d63e4412b3c2d66ed179159886a4','addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.0.0-org-group','keycloak','META-INF/jpa-changelog-26.0.0.xml','2026-04-28 05:33:31',144,'EXECUTED','9:da8e8087d80ef2ace4f89d8c5b9ca223','addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.0.0-org-group-membership','keycloak','META-INF/jpa-changelog-26.0.0.xml','2026-04-28 05:33:31',146,'EXECUTED','9:a6ace2ce583a421d89b01ba2a28dc2d4','addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.0.0-org-indexes','keycloak','META-INF/jpa-changelog-26.0.0.xml','2026-04-28 05:33:31',145,'EXECUTED','9:79b05dcd610a8c7f25ec05135eec0857','createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session','keycloak','META-INF/jpa-changelog-26.0.0.xml','2026-04-28 05:33:32',151,'EXECUTED','9:febdc0f47f2ed241c59e60f58c3ceea5','dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.1.0-34013','keycloak','META-INF/jpa-changelog-26.1.0.xml','2026-04-28 05:33:33',154,'EXECUTED','9:e6b686a15759aef99a6d758a5c4c6a26','addColumn tableName=ADMIN_EVENT_ENTITY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.1.0-34380','keycloak','META-INF/jpa-changelog-26.1.0.xml','2026-04-28 05:33:33',155,'EXECUTED','9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01','dropTable tableName=USERNAME_LOGIN_FAILURE','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.2.0-26106','keycloak','META-INF/jpa-changelog-26.2.0.xml','2026-04-28 05:33:33',157,'EXECUTED','9:b5877d5dab7d10ff3a9d209d7beb6680','addColumn tableName=CREDENTIAL','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.2.0-36750','keycloak','META-INF/jpa-changelog-26.2.0.xml','2026-04-28 05:33:33',156,'EXECUTED','9:b49ce951c22f7eb16480ff085640a33a','createTable tableName=SERVER_CONFIG','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.2.6-39866-duplicate','keycloak','META-INF/jpa-changelog-26.2.6.xml','2026-04-28 05:33:33',158,'EXECUTED','9:1dc67ccee24f30331db2cba4f372e40e','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.2.6-39866-uk','keycloak','META-INF/jpa-changelog-26.2.6.xml','2026-04-28 05:33:33',159,'EXECUTED','9:b70b76f47210cf0a5f4ef0e219eac7cd','addUniqueConstraint constraintName=UK_MIGRATION_VERSION, tableName=MIGRATION_MODEL','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.2.6-40088-duplicate','keycloak','META-INF/jpa-changelog-26.2.6.xml','2026-04-28 05:33:33',160,'EXECUTED','9:cc7e02ed69ab31979afb1982f9670e8f','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.2.6-40088-uk','keycloak','META-INF/jpa-changelog-26.2.6.xml','2026-04-28 05:33:33',161,'EXECUTED','9:5bb848128da7bc4595cc507383325241','addUniqueConstraint constraintName=UK_MIGRATION_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.3.0-groups-description','keycloak','META-INF/jpa-changelog-26.3.0.xml','2026-04-28 05:33:33',162,'EXECUTED','9:e1a3c05574326fb5b246b73b9a4c4d49','addColumn tableName=KEYCLOAK_GROUP','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.4.0-40933-saml-encryption-attributes','keycloak','META-INF/jpa-changelog-26.4.0.xml','2026-04-28 05:33:33',163,'EXECUTED','9:7e9eaba362ca105efdda202303a4fe49','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.4.0-51321','keycloak','META-INF/jpa-changelog-26.4.0.xml','2026-04-28 05:33:33',164,'EXECUTED','9:34bab2bc56f75ffd7e347c580874e306','createIndex indexName=IDX_EVENT_ENTITY_USER_ID_TYPE, tableName=EVENT_ENTITY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-add-remember-me','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:35',172,'EXECUTED','9:a7273ea8b21bd2f674c9c49141999f05','addColumn tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-add-sess-create-idx','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:36',174,'EXECUTED','9:aaee09e23a4d8468fbc5c51b7b314c58','createIndex indexName=IDX_USER_SESSION_EXPIRATION_LAST_REFRESH, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-add-sess-refresh-idx','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:35',173,'EXECUTED','9:ce49383d317ccbcd3434d1f21172b0b7','createIndex indexName=IDX_USER_SESSION_EXPIRATION_CREATED, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-drop-sess-refresh-idx','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:36',175,'EXECUTED','9:f0082210b6ccbbaf81287c27aa23753c','dropIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-idp-config-allow-null','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:35',169,'EXECUTED','9:b667fb087874303b324c1af7fae4f606','dropDefaultValue columnName=TRUST_EMAIL, tableName=IDENTITY_PROVIDER; dropNotNullConstraint columnName=TRUST_EMAIL, tableName=IDENTITY_PROVIDER; dropNotNullConstraint columnName=STORE_TOKEN, tableName=IDENTITY_PROVIDER; dropDefaultValue columnName...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-idp-config-allow-null-fixed-create-mssql-index','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:35',170,'MARK_RAN','9:dcbbb24c151c3b0b59f12fede23cc94d','createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-idp-config-allow-null-fixed-drop-mssql-index','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:34',168,'MARK_RAN','9:50c51d2c98cd1d624eb1c485c3cf1f75','dropIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-index-offline-css-by-client','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:34',166,'EXECUTED','9:680b59ca7854fa5b77a303301bb2a941','createIndex indexName=IDX_OFFLINE_CSS_BY_CLIENT, tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-index-offline-css-by-client-storage-provider','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:34',167,'EXECUTED','9:809bc160e2bc92f9c28eea39db323ae2','createIndex indexName=IDX_OFFLINE_CSS_BY_CLIENT_STORAGE_PROVIDER, tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-invitations-table-fixed2','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:37',177,'EXECUTED','9:322cb11fc03181903dcd67a54f8b3cf0','createTable tableName=ORG_INVITATION; addForeignKeyConstraint baseTableName=ORG_INVITATION, constraintName=FK_ORG_INVITATION_ORG, referencedTableName=ORG; createIndex indexName=IDX_ORG_INVITATION_ORG_ID, tableName=ORG_INVITATION; createIndex index...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-mysql-mariadb-default-charset-collation','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:36',176,'EXECUTED','9:1b383fa60d2db0a8952b365e725f9d16','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.5.0-remove-workflow-provider-id-column','keycloak','META-INF/jpa-changelog-26.5.0.xml','2026-04-28 05:33:35',171,'EXECUTED','9:d8eeb324484d45e946d03b953e168b21','dropIndex indexName=IDX_WORKFLOW_STATE_PROVIDER, tableName=WORKFLOW_STATE; createIndex indexName=IDX_WORKFLOW_STATE_PROVIDER, tableName=WORKFLOW_STATE; dropColumn columnName=WORKFLOW_PROVIDER_ID, tableName=WORKFLOW_STATE','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.6.0-43829-user-created-timestamp-index','keycloak','META-INF/jpa-changelog-26.6.0.xml','2026-04-28 05:33:40',187,'EXECUTED','9:f2531a49b8bb21a7a97966d88fd1a411','createIndex indexName=IDX_USER_CREATED_TIMESTAMP, tableName=USER_ENTITY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.6.0-44424-create-realm-in-client-session','keycloak','META-INF/jpa-changelog-26.6.0.xml','2026-04-28 05:33:39',182,'EXECUTED','9:77dbbc72d943e98cfe472ba8cc56a31c','addColumn tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.6.0-44424-idx-css-realm-and-clients','keycloak','META-INF/jpa-changelog-26.6.0.xml','2026-04-28 05:33:39',184,'EXECUTED','9:a093877fff41185ac24103be80e00968','createIndex indexName=IDX_OFFLINE_CSS_BY_CLIENT_AND_REALM, tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.6.0-44424-index-css-user-session-and-offline','keycloak','META-INF/jpa-changelog-26.6.0.xml','2026-04-28 05:33:39',181,'EXECUTED','9:a704d8598df241a3fd3cb91b6ab4b2d4','createIndex indexName=IDX_OFFLINE_CSS_BY_USER_SESSION_AND_OFFLINE, tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.6.0-44424-set-realm-in-client-session','keycloak','META-INF/jpa-changelog-26.6.0.xml','2026-04-28 05:33:39',183,'EXECUTED','9:3964a3148d32a55ef81126e23cdf6721','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.6.0-45009-broker-link-identity-provider','keycloak','META-INF/jpa-changelog-26.6.0.xml','2026-04-28 05:33:38',179,'EXECUTED','9:7d9a0253c9de7be754efef8bba4265bd','createIndex indexName=IDX_BROKER_LINK_IDENTITY_PROVIDER, tableName=BROKER_LINK','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.6.0-45009-broker-link-user-id','keycloak','META-INF/jpa-changelog-26.6.0.xml','2026-04-28 05:33:38',178,'EXECUTED','9:05026bbbc8d2ead5afcbda2f5fdf3a2b','createIndex indexName=IDX_BROKER_LINK_USER_ID, tableName=BROKER_LINK','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.6.0-add-last-modified-timestamp-user','keycloak','META-INF/jpa-changelog-26.6.0.xml','2026-04-28 05:33:39',185,'EXECUTED','9:8aa583d2cdd9e913dff42fecd626c560','addColumn tableName=USER_ENTITY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.6.0-add-timestamps-group','keycloak','META-INF/jpa-changelog-26.6.0.xml','2026-04-28 05:33:40',186,'EXECUTED','9:4363d45dc25105a3fc5db9ff6936b0a9','addColumn tableName=KEYCLOAK_GROUP','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('26.6.0-org-group-relationship','keycloak','META-INF/jpa-changelog-26.6.0.xml','2026-04-28 05:33:38',180,'EXECUTED','9:05685853fba030f53548ac6bf23245e3','addColumn tableName=KEYCLOAK_GROUP; addForeignKeyConstraint baseTableName=KEYCLOAK_GROUP, constraintName=FK_GROUP_ORGANIZATION, referencedTableName=ORG; createIndex indexName=IDX_GROUP_ORG_ID, tableName=KEYCLOAK_GROUP','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('29399-jdbc-ping-default','keycloak','META-INF/jpa-changelog-26.1.0.xml','2026-04-28 05:33:33',153,'EXECUTED','9:007dbe99d7203fca403b89d4edfdf21e','createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2026-04-28 05:32:44',39,'EXECUTED','9:132a67499ba24bcc54fb5cbdcfe7e4c0','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2026-04-28 05:32:44',40,'MARK_RAN','9:938f894c032f5430f2b0fafb1a243462','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2026-04-28 05:32:44',42,'EXECUTED','9:fc86359c079781adc577c5a217e4d04c','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2026-04-28 05:32:44',41,'MARK_RAN','9:845c332ff1874dc5d35974b0babf3006','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2026-04-28 05:32:54',43,'EXECUTED','9:59a64800e3c0d09b825f8a3b444fa8f4','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2026-04-28 05:32:54',44,'EXECUTED','9:d48d6da5c6ccf667807f633fe489ce88','addColumn tableName=USER_ENTITY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2026-04-28 05:33:01',50,'EXECUTED','9:cfdd8736332ccdd72c5256ccb42335db','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2026-04-28 05:33:02',51,'EXECUTED','9:7c84de3d9bd84d7f077607c1a4dcb714','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2026-04-28 05:33:03',52,'EXECUTED','9:5a6bb36cbefb6a9d6928452c0852af2d','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2026-04-28 05:33:03',53,'EXECUTED','9:8f23e334dbc59f82e0a328373ca6ced0','update tableName=REALM','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2026-04-28 05:33:03',54,'EXECUTED','9:9156214268f09d970cdf0e1564d866af','update tableName=CLIENT','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('31296-persist-revoked-access-tokens','keycloak','META-INF/jpa-changelog-26.0.0.xml','2026-04-28 05:33:31',147,'EXECUTED','9:64ef94489d42a358e8304b0e245f0ed4','createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('31725-index-persist-revoked-access-tokens','keycloak','META-INF/jpa-changelog-26.0.0.xml','2026-04-28 05:33:31',148,'EXECUTED','9:b994246ec2bf7c94da881e1d28782c7b','createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2026-04-28 05:33:03',56,'EXECUTED','9:229a041fb72d5beac76bb94a5fa709de','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2026-04-28 05:33:13',58,'EXECUTED','9:139b79bcbbfe903bb1c2d2a4dbf001d9','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2026-04-28 05:33:04',57,'EXECUTED','9:079899dade9c1e683f26b2aa9ca6ff04','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2026-04-28 05:33:03',55,'EXECUTED','9:db806613b1ed154826c02610b7dbdf74','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2026-04-28 05:33:15',63,'EXECUTED','9:92143a6daea0a3f3b8f598c97ce55c3d','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2026-04-28 05:33:15',64,'EXECUTED','9:82bab26a27195d889fb0429003b18f40','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2026-04-28 05:33:15',65,'EXECUTED','9:e590c88ddc0b38b0ae4249bbfcb5abc3','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2026-04-28 05:33:15',66,'EXECUTED','9:5c1f475536118dbdc38d5d7977950cc0','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2026-04-28 05:33:15',67,'EXECUTED','9:e7c9f5f9c4d67ccbbcc215440c718a17','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2026-04-28 05:33:15',68,'EXECUTED','9:88e0bfdda924690d6f4e430c53447dd5','addColumn tableName=REALM','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2026-04-28 05:33:15',69,'EXECUTED','9:f53177f137e1c46b6a88c59ec1cb5218','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2026-04-28 05:33:16',70,'EXECUTED','9:a74d33da4dc42a37ec27121580d1459f','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('40343-workflow-state-table','keycloak','META-INF/jpa-changelog-26.4.0.xml','2026-04-28 05:33:34',165,'EXECUTED','9:ed3ab4723ceed210e5b5e60ac4562106','createTable tableName=WORKFLOW_STATE; addPrimaryKey constraintName=PK_WORKFLOW_STATE, tableName=WORKFLOW_STATE; addUniqueConstraint constraintName=UQ_WORKFLOW_RESOURCE, tableName=WORKFLOW_STATE; createIndex indexName=IDX_WORKFLOW_STATE_STEP, table...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2026-04-28 05:33:16',72,'EXECUTED','9:aa072ad090bbba210d8f18781b8cebf4','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2026-04-28 05:33:19',75,'EXECUTED','9:2b9cc12779be32c5b40e2e67711a218b','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2026-04-28 05:33:19',76,'EXECUTED','9:91fa186ce7a5af127a2d7a91ee083cc5','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2026-04-28 05:33:16',73,'EXECUTED','9:1ae6be29bab7c2aa376f6983b932be37','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2026-04-28 05:33:16',74,'MARK_RAN','9:14706f286953fc9a25286dbd8fb30d97','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2026-04-28 05:33:19',77,'EXECUTED','9:6335e5c94e83a2639ccd68dd24e2e5ad','addColumn tableName=CLIENT','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2026-04-28 05:33:19',78,'MARK_RAN','9:6bdb5658951e028bfe16fa0a8228b530','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2026-04-28 05:33:21',79,'EXECUTED','9:d5bc15a64117ccad481ce8792d4c608f','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2026-04-28 05:33:21',80,'MARK_RAN','9:077cba51999515f4d3e7ad5619ab592c','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2026-04-28 05:33:21',81,'EXECUTED','9:be969f08a163bf47c6b9e9ead8ac2afb','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2026-04-28 05:33:21',85,'EXECUTED','9:7d93d602352a30c0c317e6a609b56599','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2026-04-28 05:33:21',83,'EXECUTED','9:966bda61e46bebf3cc39518fbed52fa7','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2026-04-28 05:33:21',82,'MARK_RAN','9:6d3bb4408ba5a72f39bd8a0b301ec6e3','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2026-04-28 05:33:21',84,'MARK_RAN','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2026-04-28 05:32:58',49,'EXECUTED','9:d198654156881c46bfba39abd7769e69','addColumn tableName=REALM','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2026-04-28 05:32:37',27,'EXECUTED','9:43ed6b0da89ff77206289e87eaa9c024','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2026-04-28 05:32:37',28,'EXECUTED','9:44bae577f551b3738740281eceb4ea70','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2026-04-28 05:32:54',45,'EXECUTED','9:dde36f7973e80d71fceee683bc5d2951','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2026-04-28 05:32:54',46,'EXECUTED','9:b855e9b0a406b34fa323235a0cf4f640','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2026-04-28 05:32:54',47,'MARK_RAN','9:51abbacd7b416c50c4421a8cabf7927e','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2026-04-28 05:32:58',48,'EXECUTED','9:bdc99e567b3398bac83263d375aad143','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2026-04-28 05:33:14',60,'EXECUTED','9:e0057eac39aa8fc8e09ac6cfa4ae15fe','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2026-04-28 05:33:14',59,'EXECUTED','9:b55738ad889860c625ba2bf483495a04','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2026-04-28 05:33:14',61,'EXECUTED','9:42a33806f3a0443fe0e7feeec821326c','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2026-04-28 05:33:14',62,'EXECUTED','9:9968206fca46eecc1f51db9c024bfe56','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2026-04-28 05:33:16',71,'EXECUTED','9:fd4ade7b90c3b67fae0bfcfcb42dfb5f','addColumn tableName=RESOURCE_SERVER','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2026-04-28 05:33:26',113,'EXECUTED','9:3f332e13e90739ed0c35b0b25b7822ca','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('client-attributes-string-accomodation-fixed-post-create-index','keycloak','META-INF/jpa-changelog-20.0.0.xml','2026-04-28 05:33:26',114,'MARK_RAN','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('client-attributes-string-accomodation-fixed-pre-drop-index','keycloak','META-INF/jpa-changelog-20.0.0.xml','2026-04-28 05:33:26',112,'EXECUTED','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-04-28 05:33:22',89,'EXECUTED','9:fa8a5b5445e3857f4b010bafb5009957','addColumn tableName=REALM; customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-04-28 05:33:22',90,'EXECUTED','9:67ac3241df9a8582d591c5ed87125f39','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-04-28 05:33:24',96,'EXECUTED','9:e07d2bc0970c348bb06fb63b1f82ddbf','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-04-28 05:33:25',102,'EXECUTED','9:0b305d8d1277f3a89a0a53a659ad274c','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-04-28 05:33:25',103,'EXECUTED','9:2c374ad2cdfe20e2905a84c8fac48460','customChange','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2026-04-28 05:33:21',86,'EXECUTED','9:71c5969e6cdd8d7b6f47cebc86d37627','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2026-04-28 05:33:22',87,'EXECUTED','9:a9ba7d47f065f041b7da856a81762021','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-04-28 05:33:23',92,'EXECUTED','9:d9be619d94af5a2f5d07b9f003543b91','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('unique-consentuser','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:29',139,'MARK_RAN','9:5857626a2ea8767e9a6c66bf3a2cb32f','customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('unique-consentuser-edb-migration','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:29',140,'MARK_RAN','9:5857626a2ea8767e9a6c66bf3a2cb32f','customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...','',NULL,'4.33.0',NULL,NULL,'7417280550'),
('unique-consentuser-mysql','keycloak','META-INF/jpa-changelog-25.0.0.xml','2026-04-28 05:33:29',141,'EXECUTED','9:b79478aad5adaa1bc428e31563f55e8e','customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...','',NULL,'4.33.0',NULL,NULL,'7417280550');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES
(1,0,NULL,NULL),
(1000,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','0fd4f7d4-e11b-40fe-a61b-02d51ed0343f',1),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','275a60e5-c381-4d2c-bbfd-6231d2d21fc6',0),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','29c597e9-6739-4e5b-9556-906b075c7f8a',1),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','30c6049b-f4c2-4b86-a44e-dff1c26ccaeb',1),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','357096f2-27de-4c9a-9ac1-2a7b9650f67c',1),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','4d696bc8-8a83-414d-96a8-270255799d4e',1),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','88965281-e613-42de-80d2-5659ed95acab',0),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','89168e1e-0004-4b69-a189-f531e619938f',1),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','98a54925-b8c7-4824-8843-3ee27c5806e1',0),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c05c2082-d001-4a42-b42f-4103f888f5cd',1),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c49ea892-4c40-48f7-a343-5205be54b974',1),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c5e0b1b4-10ee-44bb-9874-12ba09bb809f',0),
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','cf1d04f1-c137-4791-923a-8b638e53b984',0),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','04319a53-b1ef-432d-b98b-a99e4291f1f9',1),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','3680e960-f0b4-4ff3-a7c5-c25347e2e49f',1),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','771fa2c6-bfba-4812-b632-df9e38b810ea',1),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','7d400ce4-c351-44f9-9ce9-88609f7d48c6',1),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','88a028d2-a3ae-4ff7-aa97-f28ca7c0d568',1),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','8cee2229-b7c8-4177-af89-3df62643a74f',0),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','8ede126d-5803-4937-b7ed-ed825d3d6e3d',1),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','ce3458b8-31c0-430c-9ea6-c2b31704a4d3',1),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','d2c0ca9e-f806-485b-8069-03779d967e54',0),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','dc327106-d8d8-4efa-ad9f-feb84e83c41c',0),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','ea494ea0-b528-4203-97a4-64b4dbefad89',0),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','fb74f341-5cb1-4b29-96a6-62c13f6d3b99',1),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','ff56aae2-1087-4cc1-be6d-a01ae641221b',0);
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON_LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`),
  KEY `IDX_EVENT_ENTITY_USER_ID_TYPE` (`USER_ID`,`TYPE`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text DEFAULT NULL,
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext DEFAULT NULL,
  `CREDENTIAL_DATA` longtext DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` tinyint(1) DEFAULT NULL,
  `AUTHENTICATE_BY_DEFAULT` tinyint(1) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` tinyint(1) DEFAULT NULL,
  `TRUST_EMAIL` tinyint(1) DEFAULT NULL,
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` tinyint(1) DEFAULT NULL,
  `ORGANIZATION_ID` varchar(255) DEFAULT NULL,
  `HIDE_ON_LOGIN` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  KEY `IDX_IDP_REALM_ORG` (`REALM_ID`,`ORGANIZATION_ID`),
  KEY `IDX_IDP_FOR_LOGIN` (`REALM_ID`,`ENABLED`,`LINK_ONLY`,`HIDE_ON_LOGIN`,`ORGANIZATION_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JGROUPS_PING`
--

DROP TABLE IF EXISTS `JGROUPS_PING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `JGROUPS_PING` (
  `address` varchar(200) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `cluster_name` varchar(200) NOT NULL,
  `ip` varchar(200) NOT NULL,
  `coord` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JGROUPS_PING`
--

LOCK TABLES `JGROUPS_PING` WRITE;
/*!40000 ALTER TABLE `JGROUPS_PING` DISABLE KEYS */;
INSERT INTO `JGROUPS_PING` VALUES
('uuid://00000000-0000-0000-0000-00000000001f','c051041b1dd5-16345','ISPN','172.18.0.2:7800',1);
/*!40000 ALTER TABLE `JGROUPS_PING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `TYPE` int(11) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ORG_ID` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_TIMESTAMP` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`),
  KEY `IDX_GROUP_ORG_ID` (`ORG_ID`),
  CONSTRAINT `FK_GROUP_ORGANIZATION` FOREIGN KEY (`ORG_ID`) REFERENCES `ORG` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` tinyint(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES
('00b974d7-a572-4a77-bb88-1fca2ffe869f','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_impersonation}','impersonation','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('0184c82b-c4bd-4d77-b38a-3ca357a6861e','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_view-users}','view-users','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('085a2695-4be9-4301-9e21-7e26dc0a9b34','258b9538-e7ba-43c5-abaa-022b5d453331',1,'${role_view-profile}','view-profile','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','258b9538-e7ba-43c5-abaa-022b5d453331',NULL),
('0bd4071b-c1af-466d-820f-79dd06c06e67','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_manage-authorization}','manage-authorization','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('0ed7002c-841a-4eac-952e-67dfae9281bb','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_view-events}','view-events','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('17c53b1d-8291-4c7e-bae8-e01b7e2ca20f','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_query-realms}','query-realms','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('18ff4b3d-88a5-401c-9b94-8edc0889888d','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_manage-clients}','manage-clients','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('1c8fc9af-3712-42c8-bc7d-c3d700797b4c','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_view-realm}','view-realm','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('207fd8a6-ef72-4dac-aacd-e9f719c90cd1','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',0,'','ROLE_ADMIN','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',NULL,NULL),
('20978927-ad49-48fb-861a-75458cd0586b','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_manage-realm}','manage-realm','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('226ce10c-279a-465d-89a8-51eb9d986402','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_manage-identity-providers}','manage-identity-providers','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('2733cb8b-5e73-4f4d-9914-fd9a95696192','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_create-client}','create-client','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('29ec703e-dbc8-4f0e-bfee-2596008a73f8','258b9538-e7ba-43c5-abaa-022b5d453331',1,'${role_view-groups}','view-groups','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','258b9538-e7ba-43c5-abaa-022b5d453331',NULL),
('2cf52e67-c15b-4f73-9e9d-d9d94a70ca27','1067a40e-7cfc-40c5-8217-a97d4bf8d026',1,'${role_manage-consent}','manage-consent','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','1067a40e-7cfc-40c5-8217-a97d4bf8d026',NULL),
('2eb9d93b-1956-45d0-9dfc-b043b5a07da3','1067a40e-7cfc-40c5-8217-a97d4bf8d026',1,'${role_manage-account}','manage-account','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','1067a40e-7cfc-40c5-8217-a97d4bf8d026',NULL),
('2fc6b14a-14c0-41f1-bc3f-9fabd8077bf9','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_view-realm}','view-realm','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('3342c57e-a0d5-4947-8d51-475a26905f4f','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_view-users}','view-users','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('38381f08-ccc1-425e-9567-092a7ecb4174','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_query-groups}','query-groups','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('3936c5f8-6723-4b16-be11-7af194629c50','258b9538-e7ba-43c5-abaa-022b5d453331',1,'${role_manage-account}','manage-account','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','258b9538-e7ba-43c5-abaa-022b5d453331',NULL),
('3b47c2dc-94fa-4cd4-ba39-8b965d5ac8e9','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_query-realms}','query-realms','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('45fd9e28-26d5-43ed-9304-fc90db55ccb2','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_manage-clients}','manage-clients','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('4eb8bca9-4e2f-4391-bd0b-ec396e995713','1067a40e-7cfc-40c5-8217-a97d4bf8d026',1,'${role_manage-account-links}','manage-account-links','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','1067a40e-7cfc-40c5-8217-a97d4bf8d026',NULL),
('4ff285cc-0959-46ab-9c3e-9244db9ac10b','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_impersonation}','impersonation','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('50254feb-4f0d-49f9-a235-278c7ef90ce7','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',0,'${role_default-roles}','default-roles-sistemas','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',NULL,NULL),
('576b31ae-1830-4421-ae86-7736b9597386','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_view-authorization}','view-authorization','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('586807a9-7a4b-45fc-96df-6a7f4ee75216','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_view-clients}','view-clients','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('5a98001a-eef1-474e-82b4-af969c3c5342','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_manage-clients}','manage-clients','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('5b0dd670-5b97-42fd-b027-1b7c0125d0c5','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_manage-authorization}','manage-authorization','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('5bee395b-ebc8-4697-96dc-5efd5ed6a4b5','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_view-realm}','view-realm','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('5e24016c-69ed-411f-904b-b4e225fbdf1b','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_create-client}','create-client','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('605f05fd-52b9-42d8-8078-3ac132d3dd65','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_view-clients}','view-clients','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('61677384-ca37-4ca3-93e4-611ffc3971f1','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_view-authorization}','view-authorization','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('631e19df-51ba-4ddb-856c-7f9b42ac3b43','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_query-users}','query-users','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('75317bfd-aa52-4f78-bb0c-74ed62df77b3','9435663b-e35e-48ba-9fcb-5ec1f024fa23',1,'${role_read-token}','read-token','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','9435663b-e35e-48ba-9fcb-5ec1f024fa23',NULL),
('7675c5f3-7dcd-4666-b194-40e6353a85a0','1067a40e-7cfc-40c5-8217-a97d4bf8d026',1,'${role_view-consent}','view-consent','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','1067a40e-7cfc-40c5-8217-a97d4bf8d026',NULL),
('7746ddff-8114-430d-a5f7-7adefcaf8e57','258b9538-e7ba-43c5-abaa-022b5d453331',1,'${role_manage-consent}','manage-consent','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','258b9538-e7ba-43c5-abaa-022b5d453331',NULL),
('7be9979a-5edc-4148-9d9c-fbf89d8fcf14','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',0,'${role_uma_authorization}','uma_authorization','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',NULL,NULL),
('7c254547-51fc-4494-925c-44dc177b5e13','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_manage-users}','manage-users','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('83bc7935-cac4-44f4-97d5-c33ea80144c7','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',0,'','USER','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',NULL,NULL),
('841c22f8-8f04-4540-be20-c0eed4e6bec1','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_query-users}','query-users','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('85cc16cf-3a40-47cc-ab0b-c1f42c1b235b','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_manage-events}','manage-events','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('885c0367-da6b-486f-ab14-7d185c11997f','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_view-identity-providers}','view-identity-providers','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('88bfc14f-840a-4abd-8833-d5134ae8b336','258b9538-e7ba-43c5-abaa-022b5d453331',1,'${role_manage-account-links}','manage-account-links','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','258b9538-e7ba-43c5-abaa-022b5d453331',NULL),
('89e82877-a72c-4043-b4c3-3f908dbd0e7d','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_manage-identity-providers}','manage-identity-providers','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('8c70b0c4-fd97-4efb-833e-b6f66270cac5','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_view-identity-providers}','view-identity-providers','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('8d2d9e7b-cac4-49af-b44f-c82bd86e9f65','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_query-groups}','query-groups','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('8f4352cc-291c-4a75-ac47-d23c30c2db79','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_view-users}','view-users','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('919e6d7d-7b1d-4f40-b8ad-cf541f6ab79b','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_view-events}','view-events','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('94a9df85-ab12-4ea0-b030-f8ea3e2fc893','258b9538-e7ba-43c5-abaa-022b5d453331',1,'${role_delete-account}','delete-account','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','258b9538-e7ba-43c5-abaa-022b5d453331',NULL),
('a34523b5-18b9-4b47-9eb5-9e7664d8e63a','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',0,'${role_offline-access}','offline_access','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',NULL,NULL),
('ad043e24-483a-4eb1-b828-405bbcb797ba','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_query-groups}','query-groups','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('b3613ffd-cd66-4460-9865-df55926ff588','1067a40e-7cfc-40c5-8217-a97d4bf8d026',1,'${role_view-applications}','view-applications','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','1067a40e-7cfc-40c5-8217-a97d4bf8d026',NULL),
('b5b19148-896d-428a-9ae1-fbb653ead734','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',0,'','ADMIN','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',NULL,NULL),
('b6ffcee3-d9b3-42a2-89e6-d1f348245d95','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',0,'${role_uma_authorization}','uma_authorization','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL,NULL),
('b9948dce-3d2a-4443-8242-1c447efdfc67','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_query-users}','query-users','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('bf9953a3-2fab-44a2-84b5-94121a36e120','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_view-clients}','view-clients','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('c13cec6c-046d-4118-b799-bb43102332dc','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_realm-admin}','realm-admin','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('c31d5fd4-8009-4637-968e-af3f92054f33','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',0,'${role_admin}','admin','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL,NULL),
('c5816b1a-6cb5-48bc-8634-77f036baa8c3','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_query-clients}','query-clients','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('c59f6e7f-974b-4c43-b814-cf2dae33dd95','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_manage-authorization}','manage-authorization','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('c64650a9-134b-45e0-9d1b-2a55c35ba28f','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_view-events}','view-events','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('c6d7d5d2-46e8-4cf6-8e91-8b9df9001dde','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_view-identity-providers}','view-identity-providers','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('c8ea7e11-dbc4-487e-8db8-9bea6854b664','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_create-client}','create-client','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('c9d4140e-cb74-4ee4-92d0-cd5a5cff38fe','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',0,'${role_offline-access}','offline_access','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL,NULL),
('ce09e044-9fb3-4d20-9d13-054fe1fe3d9e','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_impersonation}','impersonation','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('ce45c81c-ec9e-4c51-b0a2-331efcdd3bb0','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_manage-realm}','manage-realm','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('cf26f916-dd3f-4c71-a6a0-65ecb0a644ea','258b9538-e7ba-43c5-abaa-022b5d453331',1,'${role_view-consent}','view-consent','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','258b9538-e7ba-43c5-abaa-022b5d453331',NULL),
('d492f2ec-afb2-437c-a4af-806d6b07b8af','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_query-clients}','query-clients','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('d60a729b-0e58-4d85-8013-65f7939e31b4','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_manage-events}','manage-events','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('d8f8da5f-d099-4a4e-8586-8a4ae7c159c1','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_manage-users}','manage-users','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('d994aa5c-5d0e-4eb0-bb06-a7444384ce51','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_manage-identity-providers}','manage-identity-providers','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('da7f64f9-64fc-4556-a79a-d64c7839dcfe','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',0,'${role_create-realm}','create-realm','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL,NULL),
('dd863f74-9989-4d2a-8e49-2e14a496cd56','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_query-clients}','query-clients','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('de409cea-8060-422e-a92c-50ca78c8e85d','d4f7f599-f325-4129-9cd3-225e205f5a9e',1,'${role_read-token}','read-token','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','d4f7f599-f325-4129-9cd3-225e205f5a9e',NULL),
('e268691e-260a-4fda-8377-153d429e631d','1067a40e-7cfc-40c5-8217-a97d4bf8d026',1,'${role_delete-account}','delete-account','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','1067a40e-7cfc-40c5-8217-a97d4bf8d026',NULL),
('e308448e-9633-4fc8-8712-03fe1b70bbf0','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',0,'${role_default-roles}','default-roles-master','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',NULL,NULL),
('e5440b43-7eef-47d6-9290-e42ae471e6be','1067a40e-7cfc-40c5-8217-a97d4bf8d026',1,'${role_view-groups}','view-groups','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','1067a40e-7cfc-40c5-8217-a97d4bf8d026',NULL),
('e7574d85-f05b-42cf-909f-3e94aabd7497','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_view-authorization}','view-authorization','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('ead11267-7d2a-4235-a1e0-32fda2fb8620','c2a0b5e7-f7c0-42df-84a1-798329993145',1,'${role_manage-users}','manage-users','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','c2a0b5e7-f7c0-42df-84a1-798329993145',NULL),
('ec8a4a70-785d-4fe7-aa7c-e11629f18e9b','258b9538-e7ba-43c5-abaa-022b5d453331',1,'${role_view-applications}','view-applications','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','258b9538-e7ba-43c5-abaa-022b5d453331',NULL),
('ecea392e-24a7-4374-898f-499efd565e92','1067a40e-7cfc-40c5-8217-a97d4bf8d026',1,'${role_view-profile}','view-profile','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','1067a40e-7cfc-40c5-8217-a97d4bf8d026',NULL),
('f59f024e-90f5-4403-88c9-85ab7e0276cd','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',0,'','ROLE_USER','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',NULL,NULL),
('f5e801bd-503d-44a3-aa6a-25253fe33a4a','f5c04237-cd54-43b2-8042-72e903ae1d9b',1,'${role_query-realms}','query-realms','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','f5c04237-cd54-43b2-8042-72e903ae1d9b',NULL),
('fb8324be-41cd-4dd9-b633-98411ca1df10','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_manage-events}','manage-events','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL),
('ff8f9c83-f81a-48d9-9932-ee0b2a903192','e71b59bc-4185-488d-9249-1d709e21041a',1,'${role_manage-realm}','manage-realm','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','e71b59bc-4185-488d-9249-1d709e21041a',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_MIGRATION_UPDATE_TIME` (`UPDATE_TIME`),
  UNIQUE KEY `UK_MIGRATION_VERSION` (`VERSION`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES
('l1phy','26.6.1',1777417387);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  `VERSION` int(11) DEFAULT 0,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_CSS_BY_CLIENT` (`CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_CSS_BY_CLIENT_STORAGE_PROVIDER` (`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_CSS_BY_USER_SESSION_AND_OFFLINE` (`OFFLINE_FLAG`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_BY_CLIENT_AND_REALM` (`REALM_ID`,`OFFLINE_FLAG`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT 0,
  `BROKER_SESSION_ID` text DEFAULT NULL,
  `VERSION` int(11) DEFAULT 0,
  `REMEMBER_ME` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_BROKER_SESSION_ID` (`BROKER_SESSION_ID`(255),`REALM_ID`),
  KEY `IDX_USER_SESSION_EXPIRATION_CREATED` (`REALM_ID`,`OFFLINE_FLAG`,`REMEMBER_ME`,`CREATED_ON`,`USER_SESSION_ID`,`USER_ID`),
  KEY `IDX_USER_SESSION_EXPIRATION_LAST_REFRESH` (`REALM_ID`,`OFFLINE_FLAG`,`REMEMBER_ME`,`LAST_SESSION_REFRESH`,`USER_SESSION_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORG`
--

DROP TABLE IF EXISTS `ORG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG` (
  `ID` varchar(255) NOT NULL,
  `ENABLED` tinyint(1) NOT NULL,
  `REALM_ID` varchar(255) NOT NULL,
  `GROUP_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `ALIAS` varchar(255) NOT NULL,
  `REDIRECT_URL` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORG_NAME` (`REALM_ID`,`NAME`),
  UNIQUE KEY `UK_ORG_GROUP` (`GROUP_ID`),
  UNIQUE KEY `UK_ORG_ALIAS` (`REALM_ID`,`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORG`
--

LOCK TABLES `ORG` WRITE;
/*!40000 ALTER TABLE `ORG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORG_DOMAIN`
--

DROP TABLE IF EXISTS `ORG_DOMAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_DOMAIN` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VERIFIED` tinyint(1) NOT NULL,
  `ORG_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`,`NAME`),
  KEY `IDX_ORG_DOMAIN_ORG_ID` (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORG_DOMAIN`
--

LOCK TABLES `ORG_DOMAIN` WRITE;
/*!40000 ALTER TABLE `ORG_DOMAIN` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORG_DOMAIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORG_INVITATION`
--

DROP TABLE IF EXISTS `ORG_INVITATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_INVITATION` (
  `ID` varchar(36) NOT NULL,
  `ORGANIZATION_ID` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `CREATED_AT` int(11) NOT NULL,
  `EXPIRES_AT` int(11) DEFAULT NULL,
  `INVITE_LINK` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORG_INVITATION_EMAIL` (`ORGANIZATION_ID`,`EMAIL`),
  KEY `IDX_ORG_INVITATION_ORG_ID` (`ORGANIZATION_ID`),
  KEY `IDX_ORG_INVITATION_EMAIL` (`EMAIL`),
  KEY `IDX_ORG_INVITATION_EXPIRES` (`EXPIRES_AT`),
  CONSTRAINT `FK_ORG_INVITATION_ORG` FOREIGN KEY (`ORGANIZATION_ID`) REFERENCES `ORG` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORG_INVITATION`
--

LOCK TABLES `ORG_INVITATION` WRITE;
/*!40000 ALTER TABLE `ORG_INVITATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORG_INVITATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES
('035eb0ca-fe6e-47f3-999f-9c9bc1e82f26','address','openid-connect','oidc-address-mapper',NULL,'ea494ea0-b528-4203-97a4-64b4dbefad89'),
('049992df-d202-4c18-9f78-0617aac7786c','acr loa level','openid-connect','oidc-acr-mapper',NULL,'88a028d2-a3ae-4ff7-aa97-f28ca7c0d568'),
('06f6d3b1-e88d-48eb-a62e-d8d4b51fdd91','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ce3458b8-31c0-430c-9ea6-c2b31704a4d3'),
('08b6c48c-6d5d-4a30-ae88-b908acc2b57d','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('0b5f5b07-04d4-4e80-b1ca-66b5517ba455','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4d696bc8-8a83-414d-96a8-270255799d4e'),
('0ca6e987-7571-4f63-808e-a4f15c7d58ce','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('0d46319d-f479-4e0c-aa1c-9d7188d4112f','full name','openid-connect','oidc-full-name-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('0f9f4ad8-3449-4d9e-84a5-fa494b119d00','audience resolve','openid-connect','oidc-audience-resolve-mapper','f777ba74-83ca-4a1d-9189-af8f84e30891',NULL),
('157dc5e3-34ef-4563-b8cb-ec16c57bdada','auth_time','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'29c597e9-6739-4e5b-9556-906b075c7f8a'),
('17cbc8de-e2b1-4b95-9bf9-3e89824103e7','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('26457b40-a042-482c-9027-b53f4f43539a','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('27886bba-9e6c-4c18-a449-e50fce618599','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'357096f2-27de-4c9a-9ac1-2a7b9650f67c'),
('2a7d62cc-0672-4216-934b-368d289dd11f','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fb74f341-5cb1-4b29-96a6-62c13f6d3b99'),
('2ba6083c-354e-4820-bff7-bcde2d7eef9c','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'c49ea892-4c40-48f7-a343-5205be54b974'),
('2cf817dc-60f7-4d98-95fe-1dfe5190fa56','Client Host','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'c32d814a-e0bc-4345-88f8-1096fa6e6054'),
('3610424c-d45c-41af-8409-7c6b66263558','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('3794e5ec-3c96-4ff9-99c1-a5149fd3b369','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('3f43f23f-e202-4a1e-8097-d99cce33acc2','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'0409d05f-e0fd-40a3-bd28-3e0a3ed3f43f'),
('43bc850d-a498-4cb6-b174-5d1828100ba5','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('4c849055-e3b6-4d9e-822d-e5ca84b100bf','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('4fdf1e83-f1d9-4b36-bca0-25d5d3295e75','locale','openid-connect','oidc-usermodel-attribute-mapper','b3d9305c-1611-4fb0-82ea-b2eb42f24a11',NULL),
('527bf652-ed8c-4a6e-acd2-0a8d37fec298','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('591405bc-a3d5-41f7-91f8-fa1ca16e81ac','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('5b1c923a-662f-4f39-a4be-5e27ee66add2','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('5d53ac46-8a22-406c-b6e8-f55c8bfb233f','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('5dae8e3e-8d07-4779-aa4d-e408d9b91c92','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'d2c0ca9e-f806-485b-8069-03779d967e54'),
('6b7c36b4-0c55-44ab-aeaa-18557d12adfb','organization','saml','saml-organization-membership-mapper',NULL,'771fa2c6-bfba-4812-b632-df9e38b810ea'),
('6ef9e488-cf92-4d35-a579-28a2da162048','audience resolve','openid-connect','oidc-audience-resolve-mapper','e4f966ba-4340-4c9c-8a11-8de4a9c0b057',NULL),
('7aacfe25-b435-4d19-ba93-37f766ee5c6e','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('7d9d52c2-6061-4467-b53a-c2e11f7ddda5','address','openid-connect','oidc-address-mapper',NULL,'275a60e5-c381-4d2c-bbfd-6231d2d21fc6'),
('7ff5649b-593d-427a-b6bd-eaa016d9f397','Client ID','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'0409d05f-e0fd-40a3-bd28-3e0a3ed3f43f'),
('82ab7f7b-ccb6-4532-9bb7-6fea0782c912','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cf1d04f1-c137-4791-923a-8b638e53b984'),
('850989f6-73c5-4099-bdd7-58794545790d','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('858f5c14-2c73-4bef-9376-daa0c5f8c660','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cf1d04f1-c137-4791-923a-8b638e53b984'),
('8dedb63f-00f0-4e5a-8826-3b2f9b8eede8','Client ID','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'c32d814a-e0bc-4345-88f8-1096fa6e6054'),
('8ebe0f69-91c2-4766-b0a5-b3d324222fdf','Client Host','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'0409d05f-e0fd-40a3-bd28-3e0a3ed3f43f'),
('8ecb11cd-3611-495b-9f49-5ea0efdb2d1c','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'c32d814a-e0bc-4345-88f8-1096fa6e6054'),
('925f546d-e6f5-4c38-bda6-2fd87fb1993d','sub','openid-connect','oidc-sub-mapper',NULL,'29c597e9-6739-4e5b-9556-906b075c7f8a'),
('949cff7b-1bf8-4f46-b739-fcce56084435','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('970721a9-5a56-4da0-aecc-9df5a3ca303c','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('9a53b763-aef4-4f66-b980-afe7be1a04d9','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'98a54925-b8c7-4824-8843-3ee27c5806e1'),
('a78e1262-43c9-44e9-874b-5782d17f100b','role list','saml','saml-role-list-mapper',NULL,'89168e1e-0004-4b69-a189-f531e619938f'),
('aacb9194-b6bb-4312-a38f-3936a896163e','acr loa level','openid-connect','oidc-acr-mapper',NULL,'30c6049b-f4c2-4b86-a44e-dff1c26ccaeb'),
('aca8d849-686e-4ef7-b605-6168a9721f4b','organization','openid-connect','oidc-organization-membership-mapper',NULL,'c5e0b1b4-10ee-44bb-9874-12ba09bb809f'),
('afd7b170-3383-4264-9e9f-0e47826757dc','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'ce3458b8-31c0-430c-9ea6-c2b31704a4d3'),
('b1cac846-3a0e-4a17-ad4c-d747bf34cbf2','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'98a54925-b8c7-4824-8843-3ee27c5806e1'),
('bc8b7cc6-b1c0-4409-bc40-8df04971aff1','role list','saml','saml-role-list-mapper',NULL,'04319a53-b1ef-432d-b98b-a99e4291f1f9'),
('c047442a-bea2-4033-83fd-5196f5d33b90','locale','openid-connect','oidc-usermodel-attribute-mapper','8ca1e477-dae0-45d0-b167-997db465ca12',NULL),
('c1b23793-1713-46d3-806f-47d383826b3a','full name','openid-connect','oidc-full-name-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('c1bb9f01-4b4b-4f4e-b83b-ae020feb4cc1','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('c29c6f32-7300-45c3-96f5-6f352ba8b3b2','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d2c0ca9e-f806-485b-8069-03779d967e54'),
('c6a4bfee-703b-493d-8bab-6ad4351aa322','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'4d696bc8-8a83-414d-96a8-270255799d4e'),
('ca74a2b0-b2a0-480b-9c5a-e2dd934d0e63','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'dc327106-d8d8-4efa-ad9f-feb84e83c41c'),
('d2aa7895-eeab-49cf-8b5a-0ac716fc4507','organization','openid-connect','oidc-organization-membership-mapper',NULL,'ff56aae2-1087-4cc1-be6d-a01ae641221b'),
('d312de26-2740-4881-b837-3d04211b4afc','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'ce3458b8-31c0-430c-9ea6-c2b31704a4d3'),
('d33c7e4b-ea58-4843-84b0-af0d85d001c9','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'357096f2-27de-4c9a-9ac1-2a7b9650f67c'),
('dc5257e1-5008-455f-8304-4f03d6ef7123','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'fb74f341-5cb1-4b29-96a6-62c13f6d3b99'),
('de5b2ecc-0427-47b5-a9a6-6396684674b8','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('e0c78c2f-7d4a-4697-be83-e1501b1d7f9e','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'3680e960-f0b4-4ff3-a7c5-c25347e2e49f'),
('e4489f12-aad4-4013-a115-a98469805173','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('e46558bc-8147-4930-a61f-ca5d3f5fc949','organization','saml','saml-organization-membership-mapper',NULL,'c05c2082-d001-4a42-b42f-4103f888f5cd'),
('e99b6b29-0e25-4250-b554-06425403e0d5','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'357096f2-27de-4c9a-9ac1-2a7b9650f67c'),
('ea00862b-7d4c-4b20-8ccc-11208ee3e8b2','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('ed847671-dd62-45f7-a228-db552ff1ea85','sub','openid-connect','oidc-sub-mapper',NULL,'8ede126d-5803-4937-b7ed-ed825d3d6e3d'),
('eeaf318a-1809-4f23-8176-dea728c50ecd','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('f20766b8-28f4-4c49-b2c8-e178889ea1a6','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'dc327106-d8d8-4efa-ad9f-feb84e83c41c'),
('f2d06434-d5bb-41de-abb8-c4c90380ebb4','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('f3822740-a03f-4df2-81a6-1c4e8d663b28','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('f97e881a-f6dd-462b-b156-b56162d70381','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0fd4f7d4-e11b-40fe-a61b-02d51ed0343f'),
('fb62f827-7c54-4f9a-acad-1e6ba938dae1','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('fc549702-a9f3-476e-ae74-1990f1d8aa04','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7d400ce4-c351-44f9-9ce9-88609f7d48c6'),
('fc6d1893-6c37-4696-ad6c-2b53d2568562','auth_time','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'8ede126d-5803-4937-b7ed-ed825d3d6e3d');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES
('035eb0ca-fe6e-47f3-999f-9c9bc1e82f26','true','access.token.claim'),
('035eb0ca-fe6e-47f3-999f-9c9bc1e82f26','true','id.token.claim'),
('035eb0ca-fe6e-47f3-999f-9c9bc1e82f26','true','introspection.token.claim'),
('035eb0ca-fe6e-47f3-999f-9c9bc1e82f26','country','user.attribute.country'),
('035eb0ca-fe6e-47f3-999f-9c9bc1e82f26','formatted','user.attribute.formatted'),
('035eb0ca-fe6e-47f3-999f-9c9bc1e82f26','locality','user.attribute.locality'),
('035eb0ca-fe6e-47f3-999f-9c9bc1e82f26','postal_code','user.attribute.postal_code'),
('035eb0ca-fe6e-47f3-999f-9c9bc1e82f26','region','user.attribute.region'),
('035eb0ca-fe6e-47f3-999f-9c9bc1e82f26','street','user.attribute.street'),
('035eb0ca-fe6e-47f3-999f-9c9bc1e82f26','true','userinfo.token.claim'),
('049992df-d202-4c18-9f78-0617aac7786c','true','access.token.claim'),
('049992df-d202-4c18-9f78-0617aac7786c','true','id.token.claim'),
('049992df-d202-4c18-9f78-0617aac7786c','true','introspection.token.claim'),
('06f6d3b1-e88d-48eb-a62e-d8d4b51fdd91','true','access.token.claim'),
('06f6d3b1-e88d-48eb-a62e-d8d4b51fdd91','realm_access.roles','claim.name'),
('06f6d3b1-e88d-48eb-a62e-d8d4b51fdd91','true','introspection.token.claim'),
('06f6d3b1-e88d-48eb-a62e-d8d4b51fdd91','String','jsonType.label'),
('06f6d3b1-e88d-48eb-a62e-d8d4b51fdd91','true','multivalued'),
('06f6d3b1-e88d-48eb-a62e-d8d4b51fdd91','foo','user.attribute'),
('08b6c48c-6d5d-4a30-ae88-b908acc2b57d','true','access.token.claim'),
('08b6c48c-6d5d-4a30-ae88-b908acc2b57d','website','claim.name'),
('08b6c48c-6d5d-4a30-ae88-b908acc2b57d','true','id.token.claim'),
('08b6c48c-6d5d-4a30-ae88-b908acc2b57d','true','introspection.token.claim'),
('08b6c48c-6d5d-4a30-ae88-b908acc2b57d','String','jsonType.label'),
('08b6c48c-6d5d-4a30-ae88-b908acc2b57d','website','user.attribute'),
('08b6c48c-6d5d-4a30-ae88-b908acc2b57d','true','userinfo.token.claim'),
('0b5f5b07-04d4-4e80-b1ca-66b5517ba455','true','access.token.claim'),
('0b5f5b07-04d4-4e80-b1ca-66b5517ba455','email','claim.name'),
('0b5f5b07-04d4-4e80-b1ca-66b5517ba455','true','id.token.claim'),
('0b5f5b07-04d4-4e80-b1ca-66b5517ba455','true','introspection.token.claim'),
('0b5f5b07-04d4-4e80-b1ca-66b5517ba455','String','jsonType.label'),
('0b5f5b07-04d4-4e80-b1ca-66b5517ba455','email','user.attribute'),
('0b5f5b07-04d4-4e80-b1ca-66b5517ba455','true','userinfo.token.claim'),
('0ca6e987-7571-4f63-808e-a4f15c7d58ce','true','access.token.claim'),
('0ca6e987-7571-4f63-808e-a4f15c7d58ce','middle_name','claim.name'),
('0ca6e987-7571-4f63-808e-a4f15c7d58ce','true','id.token.claim'),
('0ca6e987-7571-4f63-808e-a4f15c7d58ce','true','introspection.token.claim'),
('0ca6e987-7571-4f63-808e-a4f15c7d58ce','String','jsonType.label'),
('0ca6e987-7571-4f63-808e-a4f15c7d58ce','middleName','user.attribute'),
('0ca6e987-7571-4f63-808e-a4f15c7d58ce','true','userinfo.token.claim'),
('0d46319d-f479-4e0c-aa1c-9d7188d4112f','true','access.token.claim'),
('0d46319d-f479-4e0c-aa1c-9d7188d4112f','true','id.token.claim'),
('0d46319d-f479-4e0c-aa1c-9d7188d4112f','true','introspection.token.claim'),
('0d46319d-f479-4e0c-aa1c-9d7188d4112f','true','userinfo.token.claim'),
('157dc5e3-34ef-4563-b8cb-ec16c57bdada','true','access.token.claim'),
('157dc5e3-34ef-4563-b8cb-ec16c57bdada','auth_time','claim.name'),
('157dc5e3-34ef-4563-b8cb-ec16c57bdada','true','id.token.claim'),
('157dc5e3-34ef-4563-b8cb-ec16c57bdada','true','introspection.token.claim'),
('157dc5e3-34ef-4563-b8cb-ec16c57bdada','long','jsonType.label'),
('157dc5e3-34ef-4563-b8cb-ec16c57bdada','AUTH_TIME','user.session.note'),
('17cbc8de-e2b1-4b95-9bf9-3e89824103e7','true','access.token.claim'),
('17cbc8de-e2b1-4b95-9bf9-3e89824103e7','middle_name','claim.name'),
('17cbc8de-e2b1-4b95-9bf9-3e89824103e7','true','id.token.claim'),
('17cbc8de-e2b1-4b95-9bf9-3e89824103e7','true','introspection.token.claim'),
('17cbc8de-e2b1-4b95-9bf9-3e89824103e7','String','jsonType.label'),
('17cbc8de-e2b1-4b95-9bf9-3e89824103e7','middleName','user.attribute'),
('17cbc8de-e2b1-4b95-9bf9-3e89824103e7','true','userinfo.token.claim'),
('26457b40-a042-482c-9027-b53f4f43539a','true','access.token.claim'),
('26457b40-a042-482c-9027-b53f4f43539a','nickname','claim.name'),
('26457b40-a042-482c-9027-b53f4f43539a','true','id.token.claim'),
('26457b40-a042-482c-9027-b53f4f43539a','true','introspection.token.claim'),
('26457b40-a042-482c-9027-b53f4f43539a','String','jsonType.label'),
('26457b40-a042-482c-9027-b53f4f43539a','nickname','user.attribute'),
('26457b40-a042-482c-9027-b53f4f43539a','true','userinfo.token.claim'),
('27886bba-9e6c-4c18-a449-e50fce618599','true','access.token.claim'),
('27886bba-9e6c-4c18-a449-e50fce618599','realm_access.roles','claim.name'),
('27886bba-9e6c-4c18-a449-e50fce618599','true','introspection.token.claim'),
('27886bba-9e6c-4c18-a449-e50fce618599','String','jsonType.label'),
('27886bba-9e6c-4c18-a449-e50fce618599','true','multivalued'),
('27886bba-9e6c-4c18-a449-e50fce618599','foo','user.attribute'),
('2a7d62cc-0672-4216-934b-368d289dd11f','true','access.token.claim'),
('2a7d62cc-0672-4216-934b-368d289dd11f','email','claim.name'),
('2a7d62cc-0672-4216-934b-368d289dd11f','true','id.token.claim'),
('2a7d62cc-0672-4216-934b-368d289dd11f','true','introspection.token.claim'),
('2a7d62cc-0672-4216-934b-368d289dd11f','String','jsonType.label'),
('2a7d62cc-0672-4216-934b-368d289dd11f','email','user.attribute'),
('2a7d62cc-0672-4216-934b-368d289dd11f','true','userinfo.token.claim'),
('2ba6083c-354e-4820-bff7-bcde2d7eef9c','true','access.token.claim'),
('2ba6083c-354e-4820-bff7-bcde2d7eef9c','true','introspection.token.claim'),
('2cf817dc-60f7-4d98-95fe-1dfe5190fa56','true','access.token.claim'),
('2cf817dc-60f7-4d98-95fe-1dfe5190fa56','clientHost','claim.name'),
('2cf817dc-60f7-4d98-95fe-1dfe5190fa56','true','id.token.claim'),
('2cf817dc-60f7-4d98-95fe-1dfe5190fa56','true','introspection.token.claim'),
('2cf817dc-60f7-4d98-95fe-1dfe5190fa56','String','jsonType.label'),
('2cf817dc-60f7-4d98-95fe-1dfe5190fa56','clientHost','user.session.note'),
('3610424c-d45c-41af-8409-7c6b66263558','true','access.token.claim'),
('3610424c-d45c-41af-8409-7c6b66263558','picture','claim.name'),
('3610424c-d45c-41af-8409-7c6b66263558','true','id.token.claim'),
('3610424c-d45c-41af-8409-7c6b66263558','true','introspection.token.claim'),
('3610424c-d45c-41af-8409-7c6b66263558','String','jsonType.label'),
('3610424c-d45c-41af-8409-7c6b66263558','picture','user.attribute'),
('3610424c-d45c-41af-8409-7c6b66263558','true','userinfo.token.claim'),
('3794e5ec-3c96-4ff9-99c1-a5149fd3b369','true','access.token.claim'),
('3794e5ec-3c96-4ff9-99c1-a5149fd3b369','locale','claim.name'),
('3794e5ec-3c96-4ff9-99c1-a5149fd3b369','true','id.token.claim'),
('3794e5ec-3c96-4ff9-99c1-a5149fd3b369','true','introspection.token.claim'),
('3794e5ec-3c96-4ff9-99c1-a5149fd3b369','String','jsonType.label'),
('3794e5ec-3c96-4ff9-99c1-a5149fd3b369','locale','user.attribute'),
('3794e5ec-3c96-4ff9-99c1-a5149fd3b369','true','userinfo.token.claim'),
('3f43f23f-e202-4a1e-8097-d99cce33acc2','true','access.token.claim'),
('3f43f23f-e202-4a1e-8097-d99cce33acc2','clientAddress','claim.name'),
('3f43f23f-e202-4a1e-8097-d99cce33acc2','true','id.token.claim'),
('3f43f23f-e202-4a1e-8097-d99cce33acc2','true','introspection.token.claim'),
('3f43f23f-e202-4a1e-8097-d99cce33acc2','String','jsonType.label'),
('3f43f23f-e202-4a1e-8097-d99cce33acc2','clientAddress','user.session.note'),
('43bc850d-a498-4cb6-b174-5d1828100ba5','true','access.token.claim'),
('43bc850d-a498-4cb6-b174-5d1828100ba5','nickname','claim.name'),
('43bc850d-a498-4cb6-b174-5d1828100ba5','true','id.token.claim'),
('43bc850d-a498-4cb6-b174-5d1828100ba5','true','introspection.token.claim'),
('43bc850d-a498-4cb6-b174-5d1828100ba5','String','jsonType.label'),
('43bc850d-a498-4cb6-b174-5d1828100ba5','nickname','user.attribute'),
('43bc850d-a498-4cb6-b174-5d1828100ba5','true','userinfo.token.claim'),
('4c849055-e3b6-4d9e-822d-e5ca84b100bf','true','access.token.claim'),
('4c849055-e3b6-4d9e-822d-e5ca84b100bf','profile','claim.name'),
('4c849055-e3b6-4d9e-822d-e5ca84b100bf','true','id.token.claim'),
('4c849055-e3b6-4d9e-822d-e5ca84b100bf','true','introspection.token.claim'),
('4c849055-e3b6-4d9e-822d-e5ca84b100bf','String','jsonType.label'),
('4c849055-e3b6-4d9e-822d-e5ca84b100bf','profile','user.attribute'),
('4c849055-e3b6-4d9e-822d-e5ca84b100bf','true','userinfo.token.claim'),
('4fdf1e83-f1d9-4b36-bca0-25d5d3295e75','true','access.token.claim'),
('4fdf1e83-f1d9-4b36-bca0-25d5d3295e75','locale','claim.name'),
('4fdf1e83-f1d9-4b36-bca0-25d5d3295e75','true','id.token.claim'),
('4fdf1e83-f1d9-4b36-bca0-25d5d3295e75','true','introspection.token.claim'),
('4fdf1e83-f1d9-4b36-bca0-25d5d3295e75','String','jsonType.label'),
('4fdf1e83-f1d9-4b36-bca0-25d5d3295e75','locale','user.attribute'),
('4fdf1e83-f1d9-4b36-bca0-25d5d3295e75','true','userinfo.token.claim'),
('527bf652-ed8c-4a6e-acd2-0a8d37fec298','true','access.token.claim'),
('527bf652-ed8c-4a6e-acd2-0a8d37fec298','birthdate','claim.name'),
('527bf652-ed8c-4a6e-acd2-0a8d37fec298','true','id.token.claim'),
('527bf652-ed8c-4a6e-acd2-0a8d37fec298','true','introspection.token.claim'),
('527bf652-ed8c-4a6e-acd2-0a8d37fec298','String','jsonType.label'),
('527bf652-ed8c-4a6e-acd2-0a8d37fec298','birthdate','user.attribute'),
('527bf652-ed8c-4a6e-acd2-0a8d37fec298','true','userinfo.token.claim'),
('591405bc-a3d5-41f7-91f8-fa1ca16e81ac','true','access.token.claim'),
('591405bc-a3d5-41f7-91f8-fa1ca16e81ac','preferred_username','claim.name'),
('591405bc-a3d5-41f7-91f8-fa1ca16e81ac','true','id.token.claim'),
('591405bc-a3d5-41f7-91f8-fa1ca16e81ac','true','introspection.token.claim'),
('591405bc-a3d5-41f7-91f8-fa1ca16e81ac','String','jsonType.label'),
('591405bc-a3d5-41f7-91f8-fa1ca16e81ac','username','user.attribute'),
('591405bc-a3d5-41f7-91f8-fa1ca16e81ac','true','userinfo.token.claim'),
('5b1c923a-662f-4f39-a4be-5e27ee66add2','true','access.token.claim'),
('5b1c923a-662f-4f39-a4be-5e27ee66add2','family_name','claim.name'),
('5b1c923a-662f-4f39-a4be-5e27ee66add2','true','id.token.claim'),
('5b1c923a-662f-4f39-a4be-5e27ee66add2','true','introspection.token.claim'),
('5b1c923a-662f-4f39-a4be-5e27ee66add2','String','jsonType.label'),
('5b1c923a-662f-4f39-a4be-5e27ee66add2','lastName','user.attribute'),
('5b1c923a-662f-4f39-a4be-5e27ee66add2','true','userinfo.token.claim'),
('5d53ac46-8a22-406c-b6e8-f55c8bfb233f','true','access.token.claim'),
('5d53ac46-8a22-406c-b6e8-f55c8bfb233f','updated_at','claim.name'),
('5d53ac46-8a22-406c-b6e8-f55c8bfb233f','true','id.token.claim'),
('5d53ac46-8a22-406c-b6e8-f55c8bfb233f','true','introspection.token.claim'),
('5d53ac46-8a22-406c-b6e8-f55c8bfb233f','long','jsonType.label'),
('5d53ac46-8a22-406c-b6e8-f55c8bfb233f','updatedAt','user.attribute'),
('5d53ac46-8a22-406c-b6e8-f55c8bfb233f','true','userinfo.token.claim'),
('5dae8e3e-8d07-4779-aa4d-e408d9b91c92','true','access.token.claim'),
('5dae8e3e-8d07-4779-aa4d-e408d9b91c92','groups','claim.name'),
('5dae8e3e-8d07-4779-aa4d-e408d9b91c92','true','id.token.claim'),
('5dae8e3e-8d07-4779-aa4d-e408d9b91c92','true','introspection.token.claim'),
('5dae8e3e-8d07-4779-aa4d-e408d9b91c92','String','jsonType.label'),
('5dae8e3e-8d07-4779-aa4d-e408d9b91c92','true','multivalued'),
('5dae8e3e-8d07-4779-aa4d-e408d9b91c92','foo','user.attribute'),
('7aacfe25-b435-4d19-ba93-37f766ee5c6e','true','access.token.claim'),
('7aacfe25-b435-4d19-ba93-37f766ee5c6e','zoneinfo','claim.name'),
('7aacfe25-b435-4d19-ba93-37f766ee5c6e','true','id.token.claim'),
('7aacfe25-b435-4d19-ba93-37f766ee5c6e','true','introspection.token.claim'),
('7aacfe25-b435-4d19-ba93-37f766ee5c6e','String','jsonType.label'),
('7aacfe25-b435-4d19-ba93-37f766ee5c6e','zoneinfo','user.attribute'),
('7aacfe25-b435-4d19-ba93-37f766ee5c6e','true','userinfo.token.claim'),
('7d9d52c2-6061-4467-b53a-c2e11f7ddda5','true','access.token.claim'),
('7d9d52c2-6061-4467-b53a-c2e11f7ddda5','true','id.token.claim'),
('7d9d52c2-6061-4467-b53a-c2e11f7ddda5','true','introspection.token.claim'),
('7d9d52c2-6061-4467-b53a-c2e11f7ddda5','country','user.attribute.country'),
('7d9d52c2-6061-4467-b53a-c2e11f7ddda5','formatted','user.attribute.formatted'),
('7d9d52c2-6061-4467-b53a-c2e11f7ddda5','locality','user.attribute.locality'),
('7d9d52c2-6061-4467-b53a-c2e11f7ddda5','postal_code','user.attribute.postal_code'),
('7d9d52c2-6061-4467-b53a-c2e11f7ddda5','region','user.attribute.region'),
('7d9d52c2-6061-4467-b53a-c2e11f7ddda5','street','user.attribute.street'),
('7d9d52c2-6061-4467-b53a-c2e11f7ddda5','true','userinfo.token.claim'),
('7ff5649b-593d-427a-b6bd-eaa016d9f397','true','access.token.claim'),
('7ff5649b-593d-427a-b6bd-eaa016d9f397','client_id','claim.name'),
('7ff5649b-593d-427a-b6bd-eaa016d9f397','true','id.token.claim'),
('7ff5649b-593d-427a-b6bd-eaa016d9f397','true','introspection.token.claim'),
('7ff5649b-593d-427a-b6bd-eaa016d9f397','String','jsonType.label'),
('7ff5649b-593d-427a-b6bd-eaa016d9f397','client_id','user.session.note'),
('82ab7f7b-ccb6-4532-9bb7-6fea0782c912','true','access.token.claim'),
('82ab7f7b-ccb6-4532-9bb7-6fea0782c912','phone_number','claim.name'),
('82ab7f7b-ccb6-4532-9bb7-6fea0782c912','true','id.token.claim'),
('82ab7f7b-ccb6-4532-9bb7-6fea0782c912','true','introspection.token.claim'),
('82ab7f7b-ccb6-4532-9bb7-6fea0782c912','String','jsonType.label'),
('82ab7f7b-ccb6-4532-9bb7-6fea0782c912','phoneNumber','user.attribute'),
('82ab7f7b-ccb6-4532-9bb7-6fea0782c912','true','userinfo.token.claim'),
('850989f6-73c5-4099-bdd7-58794545790d','true','access.token.claim'),
('850989f6-73c5-4099-bdd7-58794545790d','gender','claim.name'),
('850989f6-73c5-4099-bdd7-58794545790d','true','id.token.claim'),
('850989f6-73c5-4099-bdd7-58794545790d','true','introspection.token.claim'),
('850989f6-73c5-4099-bdd7-58794545790d','String','jsonType.label'),
('850989f6-73c5-4099-bdd7-58794545790d','gender','user.attribute'),
('850989f6-73c5-4099-bdd7-58794545790d','true','userinfo.token.claim'),
('858f5c14-2c73-4bef-9376-daa0c5f8c660','true','access.token.claim'),
('858f5c14-2c73-4bef-9376-daa0c5f8c660','phone_number_verified','claim.name'),
('858f5c14-2c73-4bef-9376-daa0c5f8c660','true','id.token.claim'),
('858f5c14-2c73-4bef-9376-daa0c5f8c660','true','introspection.token.claim'),
('858f5c14-2c73-4bef-9376-daa0c5f8c660','boolean','jsonType.label'),
('858f5c14-2c73-4bef-9376-daa0c5f8c660','phoneNumberVerified','user.attribute'),
('858f5c14-2c73-4bef-9376-daa0c5f8c660','true','userinfo.token.claim'),
('8dedb63f-00f0-4e5a-8826-3b2f9b8eede8','true','access.token.claim'),
('8dedb63f-00f0-4e5a-8826-3b2f9b8eede8','client_id','claim.name'),
('8dedb63f-00f0-4e5a-8826-3b2f9b8eede8','true','id.token.claim'),
('8dedb63f-00f0-4e5a-8826-3b2f9b8eede8','true','introspection.token.claim'),
('8dedb63f-00f0-4e5a-8826-3b2f9b8eede8','String','jsonType.label'),
('8dedb63f-00f0-4e5a-8826-3b2f9b8eede8','client_id','user.session.note'),
('8ebe0f69-91c2-4766-b0a5-b3d324222fdf','true','access.token.claim'),
('8ebe0f69-91c2-4766-b0a5-b3d324222fdf','clientHost','claim.name'),
('8ebe0f69-91c2-4766-b0a5-b3d324222fdf','true','id.token.claim'),
('8ebe0f69-91c2-4766-b0a5-b3d324222fdf','true','introspection.token.claim'),
('8ebe0f69-91c2-4766-b0a5-b3d324222fdf','String','jsonType.label'),
('8ebe0f69-91c2-4766-b0a5-b3d324222fdf','clientHost','user.session.note'),
('8ecb11cd-3611-495b-9f49-5ea0efdb2d1c','true','access.token.claim'),
('8ecb11cd-3611-495b-9f49-5ea0efdb2d1c','clientAddress','claim.name'),
('8ecb11cd-3611-495b-9f49-5ea0efdb2d1c','true','id.token.claim'),
('8ecb11cd-3611-495b-9f49-5ea0efdb2d1c','true','introspection.token.claim'),
('8ecb11cd-3611-495b-9f49-5ea0efdb2d1c','String','jsonType.label'),
('8ecb11cd-3611-495b-9f49-5ea0efdb2d1c','clientAddress','user.session.note'),
('925f546d-e6f5-4c38-bda6-2fd87fb1993d','true','access.token.claim'),
('925f546d-e6f5-4c38-bda6-2fd87fb1993d','true','introspection.token.claim'),
('949cff7b-1bf8-4f46-b739-fcce56084435','true','access.token.claim'),
('949cff7b-1bf8-4f46-b739-fcce56084435','preferred_username','claim.name'),
('949cff7b-1bf8-4f46-b739-fcce56084435','true','id.token.claim'),
('949cff7b-1bf8-4f46-b739-fcce56084435','true','introspection.token.claim'),
('949cff7b-1bf8-4f46-b739-fcce56084435','String','jsonType.label'),
('949cff7b-1bf8-4f46-b739-fcce56084435','username','user.attribute'),
('949cff7b-1bf8-4f46-b739-fcce56084435','true','userinfo.token.claim'),
('970721a9-5a56-4da0-aecc-9df5a3ca303c','true','access.token.claim'),
('970721a9-5a56-4da0-aecc-9df5a3ca303c','website','claim.name'),
('970721a9-5a56-4da0-aecc-9df5a3ca303c','true','id.token.claim'),
('970721a9-5a56-4da0-aecc-9df5a3ca303c','true','introspection.token.claim'),
('970721a9-5a56-4da0-aecc-9df5a3ca303c','String','jsonType.label'),
('970721a9-5a56-4da0-aecc-9df5a3ca303c','website','user.attribute'),
('970721a9-5a56-4da0-aecc-9df5a3ca303c','true','userinfo.token.claim'),
('9a53b763-aef4-4f66-b980-afe7be1a04d9','true','access.token.claim'),
('9a53b763-aef4-4f66-b980-afe7be1a04d9','groups','claim.name'),
('9a53b763-aef4-4f66-b980-afe7be1a04d9','true','id.token.claim'),
('9a53b763-aef4-4f66-b980-afe7be1a04d9','true','introspection.token.claim'),
('9a53b763-aef4-4f66-b980-afe7be1a04d9','String','jsonType.label'),
('9a53b763-aef4-4f66-b980-afe7be1a04d9','true','multivalued'),
('9a53b763-aef4-4f66-b980-afe7be1a04d9','foo','user.attribute'),
('a78e1262-43c9-44e9-874b-5782d17f100b','Role','attribute.name'),
('a78e1262-43c9-44e9-874b-5782d17f100b','Basic','attribute.nameformat'),
('a78e1262-43c9-44e9-874b-5782d17f100b','false','single'),
('aacb9194-b6bb-4312-a38f-3936a896163e','true','access.token.claim'),
('aacb9194-b6bb-4312-a38f-3936a896163e','true','id.token.claim'),
('aacb9194-b6bb-4312-a38f-3936a896163e','true','introspection.token.claim'),
('aca8d849-686e-4ef7-b605-6168a9721f4b','true','access.token.claim'),
('aca8d849-686e-4ef7-b605-6168a9721f4b','organization','claim.name'),
('aca8d849-686e-4ef7-b605-6168a9721f4b','true','id.token.claim'),
('aca8d849-686e-4ef7-b605-6168a9721f4b','true','introspection.token.claim'),
('aca8d849-686e-4ef7-b605-6168a9721f4b','String','jsonType.label'),
('aca8d849-686e-4ef7-b605-6168a9721f4b','true','multivalued'),
('afd7b170-3383-4264-9e9f-0e47826757dc','true','access.token.claim'),
('afd7b170-3383-4264-9e9f-0e47826757dc','true','introspection.token.claim'),
('b1cac846-3a0e-4a17-ad4c-d747bf34cbf2','true','access.token.claim'),
('b1cac846-3a0e-4a17-ad4c-d747bf34cbf2','upn','claim.name'),
('b1cac846-3a0e-4a17-ad4c-d747bf34cbf2','true','id.token.claim'),
('b1cac846-3a0e-4a17-ad4c-d747bf34cbf2','true','introspection.token.claim'),
('b1cac846-3a0e-4a17-ad4c-d747bf34cbf2','String','jsonType.label'),
('b1cac846-3a0e-4a17-ad4c-d747bf34cbf2','username','user.attribute'),
('b1cac846-3a0e-4a17-ad4c-d747bf34cbf2','true','userinfo.token.claim'),
('bc8b7cc6-b1c0-4409-bc40-8df04971aff1','Role','attribute.name'),
('bc8b7cc6-b1c0-4409-bc40-8df04971aff1','Basic','attribute.nameformat'),
('bc8b7cc6-b1c0-4409-bc40-8df04971aff1','false','single'),
('c047442a-bea2-4033-83fd-5196f5d33b90','true','access.token.claim'),
('c047442a-bea2-4033-83fd-5196f5d33b90','locale','claim.name'),
('c047442a-bea2-4033-83fd-5196f5d33b90','true','id.token.claim'),
('c047442a-bea2-4033-83fd-5196f5d33b90','true','introspection.token.claim'),
('c047442a-bea2-4033-83fd-5196f5d33b90','String','jsonType.label'),
('c047442a-bea2-4033-83fd-5196f5d33b90','locale','user.attribute'),
('c047442a-bea2-4033-83fd-5196f5d33b90','true','userinfo.token.claim'),
('c1b23793-1713-46d3-806f-47d383826b3a','true','access.token.claim'),
('c1b23793-1713-46d3-806f-47d383826b3a','true','id.token.claim'),
('c1b23793-1713-46d3-806f-47d383826b3a','true','introspection.token.claim'),
('c1b23793-1713-46d3-806f-47d383826b3a','true','userinfo.token.claim'),
('c1bb9f01-4b4b-4f4e-b83b-ae020feb4cc1','true','access.token.claim'),
('c1bb9f01-4b4b-4f4e-b83b-ae020feb4cc1','profile','claim.name'),
('c1bb9f01-4b4b-4f4e-b83b-ae020feb4cc1','true','id.token.claim'),
('c1bb9f01-4b4b-4f4e-b83b-ae020feb4cc1','true','introspection.token.claim'),
('c1bb9f01-4b4b-4f4e-b83b-ae020feb4cc1','String','jsonType.label'),
('c1bb9f01-4b4b-4f4e-b83b-ae020feb4cc1','profile','user.attribute'),
('c1bb9f01-4b4b-4f4e-b83b-ae020feb4cc1','true','userinfo.token.claim'),
('c29c6f32-7300-45c3-96f5-6f352ba8b3b2','true','access.token.claim'),
('c29c6f32-7300-45c3-96f5-6f352ba8b3b2','upn','claim.name'),
('c29c6f32-7300-45c3-96f5-6f352ba8b3b2','true','id.token.claim'),
('c29c6f32-7300-45c3-96f5-6f352ba8b3b2','true','introspection.token.claim'),
('c29c6f32-7300-45c3-96f5-6f352ba8b3b2','String','jsonType.label'),
('c29c6f32-7300-45c3-96f5-6f352ba8b3b2','username','user.attribute'),
('c29c6f32-7300-45c3-96f5-6f352ba8b3b2','true','userinfo.token.claim'),
('c6a4bfee-703b-493d-8bab-6ad4351aa322','true','access.token.claim'),
('c6a4bfee-703b-493d-8bab-6ad4351aa322','email_verified','claim.name'),
('c6a4bfee-703b-493d-8bab-6ad4351aa322','true','id.token.claim'),
('c6a4bfee-703b-493d-8bab-6ad4351aa322','true','introspection.token.claim'),
('c6a4bfee-703b-493d-8bab-6ad4351aa322','boolean','jsonType.label'),
('c6a4bfee-703b-493d-8bab-6ad4351aa322','emailVerified','user.attribute'),
('c6a4bfee-703b-493d-8bab-6ad4351aa322','true','userinfo.token.claim'),
('ca74a2b0-b2a0-480b-9c5a-e2dd934d0e63','true','access.token.claim'),
('ca74a2b0-b2a0-480b-9c5a-e2dd934d0e63','phone_number','claim.name'),
('ca74a2b0-b2a0-480b-9c5a-e2dd934d0e63','true','id.token.claim'),
('ca74a2b0-b2a0-480b-9c5a-e2dd934d0e63','true','introspection.token.claim'),
('ca74a2b0-b2a0-480b-9c5a-e2dd934d0e63','String','jsonType.label'),
('ca74a2b0-b2a0-480b-9c5a-e2dd934d0e63','phoneNumber','user.attribute'),
('ca74a2b0-b2a0-480b-9c5a-e2dd934d0e63','true','userinfo.token.claim'),
('d2aa7895-eeab-49cf-8b5a-0ac716fc4507','true','access.token.claim'),
('d2aa7895-eeab-49cf-8b5a-0ac716fc4507','organization','claim.name'),
('d2aa7895-eeab-49cf-8b5a-0ac716fc4507','true','id.token.claim'),
('d2aa7895-eeab-49cf-8b5a-0ac716fc4507','true','introspection.token.claim'),
('d2aa7895-eeab-49cf-8b5a-0ac716fc4507','String','jsonType.label'),
('d2aa7895-eeab-49cf-8b5a-0ac716fc4507','true','multivalued'),
('d312de26-2740-4881-b837-3d04211b4afc','true','access.token.claim'),
('d312de26-2740-4881-b837-3d04211b4afc','resource_access.${client_id}.roles','claim.name'),
('d312de26-2740-4881-b837-3d04211b4afc','true','introspection.token.claim'),
('d312de26-2740-4881-b837-3d04211b4afc','String','jsonType.label'),
('d312de26-2740-4881-b837-3d04211b4afc','true','multivalued'),
('d312de26-2740-4881-b837-3d04211b4afc','foo','user.attribute'),
('d33c7e4b-ea58-4843-84b0-af0d85d001c9','true','access.token.claim'),
('d33c7e4b-ea58-4843-84b0-af0d85d001c9','true','introspection.token.claim'),
('dc5257e1-5008-455f-8304-4f03d6ef7123','true','access.token.claim'),
('dc5257e1-5008-455f-8304-4f03d6ef7123','email_verified','claim.name'),
('dc5257e1-5008-455f-8304-4f03d6ef7123','true','id.token.claim'),
('dc5257e1-5008-455f-8304-4f03d6ef7123','true','introspection.token.claim'),
('dc5257e1-5008-455f-8304-4f03d6ef7123','boolean','jsonType.label'),
('dc5257e1-5008-455f-8304-4f03d6ef7123','emailVerified','user.attribute'),
('dc5257e1-5008-455f-8304-4f03d6ef7123','true','userinfo.token.claim'),
('de5b2ecc-0427-47b5-a9a6-6396684674b8','true','access.token.claim'),
('de5b2ecc-0427-47b5-a9a6-6396684674b8','given_name','claim.name'),
('de5b2ecc-0427-47b5-a9a6-6396684674b8','true','id.token.claim'),
('de5b2ecc-0427-47b5-a9a6-6396684674b8','true','introspection.token.claim'),
('de5b2ecc-0427-47b5-a9a6-6396684674b8','String','jsonType.label'),
('de5b2ecc-0427-47b5-a9a6-6396684674b8','firstName','user.attribute'),
('de5b2ecc-0427-47b5-a9a6-6396684674b8','true','userinfo.token.claim'),
('e0c78c2f-7d4a-4697-be83-e1501b1d7f9e','true','access.token.claim'),
('e0c78c2f-7d4a-4697-be83-e1501b1d7f9e','true','introspection.token.claim'),
('e4489f12-aad4-4013-a115-a98469805173','true','access.token.claim'),
('e4489f12-aad4-4013-a115-a98469805173','locale','claim.name'),
('e4489f12-aad4-4013-a115-a98469805173','true','id.token.claim'),
('e4489f12-aad4-4013-a115-a98469805173','true','introspection.token.claim'),
('e4489f12-aad4-4013-a115-a98469805173','String','jsonType.label'),
('e4489f12-aad4-4013-a115-a98469805173','locale','user.attribute'),
('e4489f12-aad4-4013-a115-a98469805173','true','userinfo.token.claim'),
('e99b6b29-0e25-4250-b554-06425403e0d5','true','access.token.claim'),
('e99b6b29-0e25-4250-b554-06425403e0d5','resource_access.${client_id}.roles','claim.name'),
('e99b6b29-0e25-4250-b554-06425403e0d5','true','introspection.token.claim'),
('e99b6b29-0e25-4250-b554-06425403e0d5','String','jsonType.label'),
('e99b6b29-0e25-4250-b554-06425403e0d5','true','multivalued'),
('e99b6b29-0e25-4250-b554-06425403e0d5','foo','user.attribute'),
('ea00862b-7d4c-4b20-8ccc-11208ee3e8b2','true','access.token.claim'),
('ea00862b-7d4c-4b20-8ccc-11208ee3e8b2','updated_at','claim.name'),
('ea00862b-7d4c-4b20-8ccc-11208ee3e8b2','true','id.token.claim'),
('ea00862b-7d4c-4b20-8ccc-11208ee3e8b2','true','introspection.token.claim'),
('ea00862b-7d4c-4b20-8ccc-11208ee3e8b2','long','jsonType.label'),
('ea00862b-7d4c-4b20-8ccc-11208ee3e8b2','updatedAt','user.attribute'),
('ea00862b-7d4c-4b20-8ccc-11208ee3e8b2','true','userinfo.token.claim'),
('ed847671-dd62-45f7-a228-db552ff1ea85','true','access.token.claim'),
('ed847671-dd62-45f7-a228-db552ff1ea85','true','introspection.token.claim'),
('eeaf318a-1809-4f23-8176-dea728c50ecd','true','access.token.claim'),
('eeaf318a-1809-4f23-8176-dea728c50ecd','family_name','claim.name'),
('eeaf318a-1809-4f23-8176-dea728c50ecd','true','id.token.claim'),
('eeaf318a-1809-4f23-8176-dea728c50ecd','true','introspection.token.claim'),
('eeaf318a-1809-4f23-8176-dea728c50ecd','String','jsonType.label'),
('eeaf318a-1809-4f23-8176-dea728c50ecd','lastName','user.attribute'),
('eeaf318a-1809-4f23-8176-dea728c50ecd','true','userinfo.token.claim'),
('f20766b8-28f4-4c49-b2c8-e178889ea1a6','true','access.token.claim'),
('f20766b8-28f4-4c49-b2c8-e178889ea1a6','phone_number_verified','claim.name'),
('f20766b8-28f4-4c49-b2c8-e178889ea1a6','true','id.token.claim'),
('f20766b8-28f4-4c49-b2c8-e178889ea1a6','true','introspection.token.claim'),
('f20766b8-28f4-4c49-b2c8-e178889ea1a6','boolean','jsonType.label'),
('f20766b8-28f4-4c49-b2c8-e178889ea1a6','phoneNumberVerified','user.attribute'),
('f20766b8-28f4-4c49-b2c8-e178889ea1a6','true','userinfo.token.claim'),
('f2d06434-d5bb-41de-abb8-c4c90380ebb4','true','access.token.claim'),
('f2d06434-d5bb-41de-abb8-c4c90380ebb4','birthdate','claim.name'),
('f2d06434-d5bb-41de-abb8-c4c90380ebb4','true','id.token.claim'),
('f2d06434-d5bb-41de-abb8-c4c90380ebb4','true','introspection.token.claim'),
('f2d06434-d5bb-41de-abb8-c4c90380ebb4','String','jsonType.label'),
('f2d06434-d5bb-41de-abb8-c4c90380ebb4','birthdate','user.attribute'),
('f2d06434-d5bb-41de-abb8-c4c90380ebb4','true','userinfo.token.claim'),
('f3822740-a03f-4df2-81a6-1c4e8d663b28','true','access.token.claim'),
('f3822740-a03f-4df2-81a6-1c4e8d663b28','given_name','claim.name'),
('f3822740-a03f-4df2-81a6-1c4e8d663b28','true','id.token.claim'),
('f3822740-a03f-4df2-81a6-1c4e8d663b28','true','introspection.token.claim'),
('f3822740-a03f-4df2-81a6-1c4e8d663b28','String','jsonType.label'),
('f3822740-a03f-4df2-81a6-1c4e8d663b28','firstName','user.attribute'),
('f3822740-a03f-4df2-81a6-1c4e8d663b28','true','userinfo.token.claim'),
('f97e881a-f6dd-462b-b156-b56162d70381','true','access.token.claim'),
('f97e881a-f6dd-462b-b156-b56162d70381','zoneinfo','claim.name'),
('f97e881a-f6dd-462b-b156-b56162d70381','true','id.token.claim'),
('f97e881a-f6dd-462b-b156-b56162d70381','true','introspection.token.claim'),
('f97e881a-f6dd-462b-b156-b56162d70381','String','jsonType.label'),
('f97e881a-f6dd-462b-b156-b56162d70381','zoneinfo','user.attribute'),
('f97e881a-f6dd-462b-b156-b56162d70381','true','userinfo.token.claim'),
('fb62f827-7c54-4f9a-acad-1e6ba938dae1','true','access.token.claim'),
('fb62f827-7c54-4f9a-acad-1e6ba938dae1','gender','claim.name'),
('fb62f827-7c54-4f9a-acad-1e6ba938dae1','true','id.token.claim'),
('fb62f827-7c54-4f9a-acad-1e6ba938dae1','true','introspection.token.claim'),
('fb62f827-7c54-4f9a-acad-1e6ba938dae1','String','jsonType.label'),
('fb62f827-7c54-4f9a-acad-1e6ba938dae1','gender','user.attribute'),
('fb62f827-7c54-4f9a-acad-1e6ba938dae1','true','userinfo.token.claim'),
('fc549702-a9f3-476e-ae74-1990f1d8aa04','true','access.token.claim'),
('fc549702-a9f3-476e-ae74-1990f1d8aa04','picture','claim.name'),
('fc549702-a9f3-476e-ae74-1990f1d8aa04','true','id.token.claim'),
('fc549702-a9f3-476e-ae74-1990f1d8aa04','true','introspection.token.claim'),
('fc549702-a9f3-476e-ae74-1990f1d8aa04','String','jsonType.label'),
('fc549702-a9f3-476e-ae74-1990f1d8aa04','picture','user.attribute'),
('fc549702-a9f3-476e-ae74-1990f1d8aa04','true','userinfo.token.claim'),
('fc6d1893-6c37-4696-ad6c-2b53d2568562','true','access.token.claim'),
('fc6d1893-6c37-4696-ad6c-2b53d2568562','auth_time','claim.name'),
('fc6d1893-6c37-4696-ad6c-2b53d2568562','true','id.token.claim'),
('fc6d1893-6c37-4696-ad6c-2b53d2568562','true','introspection.token.claim'),
('fc6d1893-6c37-4696-ad6c-2b53d2568562','long','jsonType.label'),
('fc6d1893-6c37-4696-ad6c-2b53d2568562','AUTH_TIME','user.session.note');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `EVENTS_ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` text DEFAULT NULL,
  `REGISTRATION_ALLOWED` tinyint(1) NOT NULL DEFAULT 0,
  `REMEMBER_ME` tinyint(1) NOT NULL DEFAULT 0,
  `RESET_PASSWORD_ALLOWED` tinyint(1) NOT NULL DEFAULT 0,
  `SOCIAL` tinyint(1) NOT NULL DEFAULT 0,
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` tinyint(1) NOT NULL DEFAULT 0,
  `VERIFY_EMAIL` tinyint(1) NOT NULL DEFAULT 0,
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` tinyint(1) NOT NULL DEFAULT 0,
  `ADMIN_EVENTS_ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `ADMIN_EVENTS_DETAILS_ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `EDIT_USERNAME_ALLOWED` tinyint(1) NOT NULL DEFAULT 0,
  `OTP_POLICY_COUNTER` int(11) DEFAULT 0,
  `OTP_POLICY_WINDOW` int(11) DEFAULT 1,
  `OTP_POLICY_PERIOD` int(11) DEFAULT 30,
  `OTP_POLICY_DIGITS` int(11) DEFAULT 6,
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT 0,
  `REVOKE_REFRESH_TOKEN` tinyint(1) NOT NULL DEFAULT 0,
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT 0,
  `LOGIN_WITH_EMAIL_ALLOWED` tinyint(1) NOT NULL DEFAULT 1,
  `DUPLICATE_EMAILS_ALLOWED` tinyint(1) NOT NULL DEFAULT 0,
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT 0,
  `ALLOW_USER_MANAGED_ACCESS` tinyint(1) NOT NULL DEFAULT 0,
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d',60,300,60,NULL,NULL,NULL,1,0,0,NULL,'master',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'e71b59bc-4185-488d-9249-1d709e21041a',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','64c0f382-49f7-441d-9e63-5abc1480990e','b3f99c08-9099-4417-9ab1-07310d62f963','dcce4c9a-5a82-4bf7-8b04-aef074fb9801','3838fdad-d4e3-4f52-897a-a7eef9af65fc','982eaab7-81bf-4a70-a11b-c89311e0540f',2592000,0,900,1,0,'3d47b3ff-7941-40c0-9b71-7d4ecfd9f87b',0,0,0,0,'e308448e-9633-4fc8-8712-03fe1b70bbf0'),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896',60,300,300,NULL,NULL,NULL,1,0,0,NULL,'Sistemas',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'c2a0b5e7-f7c0-42df-84a1-798329993145',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','c919e3c8-52bb-4749-bd40-bf0e80af7bad','246af0c1-e276-4bc5-a7a4-d107c6fbc0cc','309c1a81-f18e-444d-8962-ae3e50181b39','f4a563bd-18e0-4be9-874d-5522d9843038','f1088438-def1-4337-a6c0-710f7488489a',2592000,0,900,1,0,'97858a4b-935e-4ad8-a5f2-bc43510e841f',0,0,0,0,'50254feb-4f0d-49f9-a235-278c7ef90ce7');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES
('actionTokenGeneratedByAdminLifespan','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','43200'),
('actionTokenGeneratedByUserLifespan','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','300'),
('bruteForceProtected','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','false'),
('bruteForceProtected','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','false'),
('bruteForceStrategy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','MULTIPLE'),
('bruteForceStrategy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','MULTIPLE'),
('cibaAuthRequestedUserHint','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','login_hint'),
('cibaBackchannelTokenDeliveryMode','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','poll'),
('cibaExpiresIn','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','120'),
('cibaInterval','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','5'),
('defaultSignatureAlgorithm','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','RS256'),
('defaultSignatureAlgorithm','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','RS256'),
('displayName','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','Keycloak'),
('displayNameHtml','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),
('failureFactor','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','30'),
('failureFactor','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','30'),
('firstBrokerLoginFlowId','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','198749c8-9d7e-44be-8261-112c7fff13ea'),
('firstBrokerLoginFlowId','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','2569b223-47d2-45da-afe9-8ab847fc4a32'),
('maxDeltaTimeSeconds','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','43200'),
('maxDeltaTimeSeconds','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','43200'),
('maxFailureWaitSeconds','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','900'),
('maxFailureWaitSeconds','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','900'),
('maxSecondaryAuthFailures','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','0'),
('maxSecondaryAuthFailures','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','0'),
('maxTemporaryLockouts','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','0'),
('maxTemporaryLockouts','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','0'),
('minimumQuickLoginWaitSeconds','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','60'),
('minimumQuickLoginWaitSeconds','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','60'),
('oauth2DeviceCodeLifespan','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','600'),
('oauth2DevicePollingInterval','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','5'),
('offlineSessionMaxLifespan','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','5184000'),
('offlineSessionMaxLifespan','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','5184000'),
('offlineSessionMaxLifespanEnabled','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','false'),
('offlineSessionMaxLifespanEnabled','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','false'),
('parRequestUriLifespan','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','60'),
('permanentLockout','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','false'),
('permanentLockout','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','false'),
('quickLoginCheckMilliSeconds','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','1000'),
('quickLoginCheckMilliSeconds','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','1000'),
('realmReusableOtpCode','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','false'),
('realmReusableOtpCode','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','false'),
('waitIncrementSeconds','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','60'),
('waitIncrementSeconds','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','60'),
('webAuthnPolicyAttestationConveyancePreference','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','not specified'),
('webAuthnPolicyAttestationConveyancePreferencePasswordless','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','not specified'),
('webAuthnPolicyAuthenticatorAttachment','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','not specified'),
('webAuthnPolicyAuthenticatorAttachmentPasswordless','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','not specified'),
('webAuthnPolicyAvoidSameAuthenticatorRegister','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','false'),
('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','false'),
('webAuthnPolicyCreateTimeout','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','0'),
('webAuthnPolicyCreateTimeoutPasswordless','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','0'),
('webAuthnPolicyRequireResidentKey','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','not specified'),
('webAuthnPolicyRequireResidentKeyPasswordless','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','Yes'),
('webAuthnPolicyRpEntityName','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','keycloak'),
('webAuthnPolicyRpEntityNamePasswordless','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','keycloak'),
('webAuthnPolicyRpId','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',''),
('webAuthnPolicyRpIdPasswordless','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',''),
('webAuthnPolicySignatureAlgorithms','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','ES256,RS256'),
('webAuthnPolicySignatureAlgorithmsPasswordless','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','ES256,RS256'),
('webAuthnPolicyUserVerificationRequirement','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','not specified'),
('webAuthnPolicyUserVerificationRequirementPasswordless','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','required'),
('_browser_header.contentSecurityPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),
('_browser_header.contentSecurityPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),
('_browser_header.contentSecurityPolicyReportOnly','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',''),
('_browser_header.contentSecurityPolicyReportOnly','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',''),
('_browser_header.referrerPolicy','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','no-referrer'),
('_browser_header.referrerPolicy','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','no-referrer'),
('_browser_header.strictTransportSecurity','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','max-age=31536000; includeSubDomains'),
('_browser_header.strictTransportSecurity','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','max-age=31536000; includeSubDomains'),
('_browser_header.xContentTypeOptions','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','nosniff'),
('_browser_header.xContentTypeOptions','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','nosniff'),
('_browser_header.xFrameOptions','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','SAMEORIGIN'),
('_browser_header.xFrameOptions','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','SAMEORIGIN'),
('_browser_header.xRobotsTag','32498a75-22fb-4e5e-9e38-d5a29eb8e76d','none'),
('_browser_header.xRobotsTag','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','none');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES
('32498a75-22fb-4e5e-9e38-d5a29eb8e76d','jboss-logging'),
('fb1ad2cb-3389-46ca-ac4c-eebb9309d896','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` tinyint(1) NOT NULL DEFAULT 0,
  `SECRET` tinyint(1) NOT NULL DEFAULT 0,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES
('password','password',1,1,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d'),
('password','password',1,1,'fb1ad2cb-3389-46ca-ac4c-eebb9309d896');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES
('1067a40e-7cfc-40c5-8217-a97d4bf8d026','/realms/master/account/*'),
('258b9538-e7ba-43c5-abaa-022b5d453331','/realms/Sistemas/account/*'),
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','https://frontberenice.projeto.com/*'),
('801777b9-a574-4683-8225-0ec1d8f99acb','https://frontberenice.projeto.com/*'),
('8ca1e477-dae0-45d0-b167-997db465ca12','/admin/Sistemas/console/*'),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','/admin/master/console/*'),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','/realms/master/account/*'),
('f777ba74-83ca-4a1d-9189-af8f84e30891','/realms/Sistemas/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `DEFAULT_ACTION` tinyint(1) NOT NULL DEFAULT 0,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES
('08d23bdc-96e2-4846-9cb7-4e9080357f2a','delete_account','Delete Account','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',0,0,'delete_account',60),
('09e2a703-710d-4a66-b6e5-c8c45980c628','VERIFY_EMAIL','Verify Email','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',1,0,'VERIFY_EMAIL',50),
('12e1356f-ffae-4051-8bd1-4ca08025f197','VERIFY_PROFILE','Verify Profile','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',1,0,'VERIFY_PROFILE',100),
('24a0adf7-86e5-4855-8341-2407edd27827','CONFIGURE_RECOVERY_AUTHN_CODES','Recovery Authentication Codes','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',1,0,'CONFIGURE_RECOVERY_AUTHN_CODES',130),
('2e9bb62c-f378-4f1f-98b6-292e28bb6d21','CONFIGURE_RECOVERY_AUTHN_CODES','Recovery Authentication Codes','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',1,0,'CONFIGURE_RECOVERY_AUTHN_CODES',130),
('337c7803-d85b-4547-baa9-4157fefbf2ca','UPDATE_PASSWORD','Update Password','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',1,0,'UPDATE_PASSWORD',30),
('47c7da64-8762-4ed2-8bcc-f29edc076356','UPDATE_PASSWORD','Update Password','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',1,0,'UPDATE_PASSWORD',30),
('509f4a25-1d05-41b1-894d-df026771a05a','webauthn-register','Webauthn Register','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',1,0,'webauthn-register',80),
('56ce80a9-ce95-4890-8efc-e80c7f224159','webauthn-register-passwordless','Webauthn Register Passwordless','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',1,0,'webauthn-register-passwordless',90),
('606574ac-fc0a-4f76-a608-75a8ad32431d','update_user_locale','Update User Locale','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',1,0,'update_user_locale',1000),
('688ccc7b-4775-4759-88d1-880e5df2db3c','delete_account','Delete Account','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',0,0,'delete_account',60),
('70b22cdb-2266-4abd-9873-d9e5e7d82815','TERMS_AND_CONDITIONS','Terms and Conditions','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',0,0,'TERMS_AND_CONDITIONS',20),
('72c65e8d-f107-451d-ac78-f9eacf889445','update_user_locale','Update User Locale','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',1,0,'update_user_locale',1000),
('8544951f-78b0-4ecc-9856-8eae4943bec2','idp_link','Linking Identity Provider','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',1,0,'idp_link',120),
('87529235-9475-4eca-9994-5f9a27718b9d','UPDATE_EMAIL','Update Email','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',0,0,'UPDATE_EMAIL',70),
('8baba7a3-3a12-4f1c-9383-c005d8e6206f','idp_link','Linking Identity Provider','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',1,0,'idp_link',120),
('95464b89-8f05-4463-9807-f6858b425214','delete_credential','Delete Credential','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',1,0,'delete_credential',110),
('a5a6f1aa-b2b9-4328-bd66-810565966044','CONFIGURE_TOTP','Configure OTP','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',1,0,'CONFIGURE_TOTP',10),
('ab2bb884-43d3-4b0c-a2a8-003d4ec87c3d','TERMS_AND_CONDITIONS','Terms and Conditions','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',0,0,'TERMS_AND_CONDITIONS',20),
('af9388c9-171d-4a69-bbcb-7e6e33f6e333','webauthn-register','Webauthn Register','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',1,0,'webauthn-register',80),
('b876a13c-3454-4fdb-909a-f8ccb3e5200c','UPDATE_PROFILE','Update Profile','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',1,0,'UPDATE_PROFILE',40),
('cdfdd21f-14b6-4c77-90a4-09117370604a','delete_credential','Delete Credential','fb1ad2cb-3389-46ca-ac4c-eebb9309d896',1,0,'delete_credential',110),
('e6b77bb2-0e94-416e-abd4-7f95bc85d132','CONFIGURE_TOTP','Configure OTP','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',1,0,'CONFIGURE_TOTP',10),
('f08099e2-1ab5-4928-b9bf-8030368dfbf4','UPDATE_PROFILE','Update Profile','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',1,0,'UPDATE_PROFILE',40),
('f0a6f56c-36ab-48d5-abf9-71b7ba00f6a5','VERIFY_EMAIL','Verify Email','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',1,0,'VERIFY_EMAIL',50),
('f9577dce-5a95-474e-9ce0-d7204c286dc1','webauthn-register-passwordless','Webauthn Register Passwordless','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',1,0,'webauthn-register-passwordless',90),
('fc3322e0-0c92-4f46-92ee-4a189d7322a9','VERIFY_PROFILE','Verify Profile','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',1,0,'VERIFY_PROFILE',100),
('fc6e06c5-0da0-4ea1-939b-911e80dcd7ac','UPDATE_EMAIL','Update Email','32498a75-22fb-4e5e-9e38-d5a29eb8e76d',0,0,'UPDATE_EMAIL',70);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` tinyint(1) NOT NULL DEFAULT 0,
  `POLICY_ENFORCE_MODE` tinyint(4) DEFAULT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  KEY `IDX_PERM_TICKET_REQUESTER` (`REQUESTER`),
  KEY `IDX_PERM_TICKET_OWNER` (`OWNER`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` tinyint(4) DEFAULT NULL,
  `LOGIC` tinyint(4) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` tinyint(1) NOT NULL DEFAULT 0,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVOKED_TOKEN`
--

DROP TABLE IF EXISTS `REVOKED_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVOKED_TOKEN` (
  `ID` varchar(255) NOT NULL,
  `EXPIRE` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REV_TOKEN_ON_EXPIRE` (`EXPIRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVOKED_TOKEN`
--

LOCK TABLES `REVOKED_TOKEN` WRITE;
/*!40000 ALTER TABLE `REVOKED_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `REVOKED_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES
('f777ba74-83ca-4a1d-9189-af8f84e30891','29ec703e-dbc8-4f0e-bfee-2596008a73f8'),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','2eb9d93b-1956-45d0-9dfc-b043b5a07da3'),
('f777ba74-83ca-4a1d-9189-af8f84e30891','3936c5f8-6723-4b16-be11-7af194629c50'),
('e4f966ba-4340-4c9c-8a11-8de4a9c0b057','e5440b43-7eef-47d6-9290-e42ae471e6be');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVER_CONFIG`
--

DROP TABLE IF EXISTS `SERVER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SERVER_CONFIG` (
  `SERVER_CONFIG_KEY` varchar(255) NOT NULL,
  `VALUE` longtext NOT NULL,
  `VERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`SERVER_CONFIG_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVER_CONFIG`
--

LOCK TABLES `SERVER_CONFIG` WRITE;
/*!40000 ALTER TABLE `SERVER_CONFIG` DISABLE KEYS */;
INSERT INTO `SERVER_CONFIG` VALUES
('crt_jgroups','{\"prvKey\":\"MIIEowIBAAKCAQEA18n0Evb4t3cPIEqJIFzCIlrKT+WB50f37vVhURq3dB+WEikgyX4jIyftQW2w7qdliyKVcowYQ6wzNgF2S57Q6yGHSDeLM5LRq/rq8XlkNvWS6YQoNAyHwPKSB2dqc5cRVYOxLJB05IIQvH/Q0PyHiBYIckEuUVNx4n34Uw+JloJIvPUOVeS/RBGwP2oPl3fy36NrorcKj3b257cXQggJKSUlfmW6SRyeRcQQKapCnEBPzn53tS+rISz9ilUxW428nsX9mnWxscLK1vC6hpEnhhZhMnPnX1in5AFNwx8HjPHfMijOHiVvMLnofE6VGxAjnN4pVcw2QSfO1SVeWg2HlwIDAQABAoIBADnIsSzA6NJMNgc6HmVFoZDMih+CAFq8GWbqW5B53IVije+4BrkeJ2+bGfvq0TXfKqBq9uURIdBBVQdRtelDEoPcWxsaEJMTbkUk8HQQQyc6dIhGpPNnJZUj/7mu1kE0w2YIWVHrLvof4DZx7auA7BQjfkiGLs6FT1pMzEoFv5zHMWXQ8AMMmeyCLcvoCpTdrrorcqzKPj0EvCpjwfi/NsA3G/gs8mKihWsoQfZgnPwz3O3e3miG+3a7rb8W+NMoPFIpqaqcaj8Hfzj+b+nP+hEgQDlaY7reDN4Aoff1ThjLhbGeNBpQ3eZQGs7CVheyRtzBLCpRdVtVobnub66X9uUCgYEA+z3ZaB2ZnpNPGluD5XdobyePc83q4PEe1bPuIHsKf4oobe73GHihE7RcLI65bf9k1X32Qta7yHgMZgH6TEByMzuPH/wA9c/Psdm4gTazM3iykoZ3IVeEXGpsKENMYS+z6VHVek8QtCceM+dg3D1ZYafzlaKMW61UgeCrRPAUqXMCgYEA2+A1+X/BSueQKPcttyn7wTEvxDfGCvPCuUmqxw4K3tOZLYYRfcDcZnY4RF5BpW7JGIorYiZEgYVG5CYIjQLgjZ6ORJ+OX4nYkv9ecai8CETRJ+4Ybgz/E3Ob7hSurx16qmvehCpiJk19fkouXjK7C6MCEE4dIirtn111notrME0CgYEArfbWigws6atwk3yYqJP04TqQTwxfPaBXzHuJQD5SN5uvgOd9exlT13QEeuncpbi41kcg9IkBf774Ps3RxWi+apEr+mahN5PMaYarBfWdQd+qLmEjLhgOU3txJrPquESym7UJT2Zd15BajnABFp74O/FybcMe0wACyueJT/O5KtcCgYA4LsBb8mMHqsfRT+ekh9vGb7UO5Fl8bvDwu3whxNrOOS9IzJsnkOJAZDDYd2U6ymYkGRogyDp1BgMpRPamYXfTeBJOQp70lpp6ZTpSvJTfYAY5t8MSS8vZwo6zdSF1qYiwh0OibdoKg35viLD0bO4SeSKL3AnhsyposE7fpixLeQKBgCVl2ZWmQaKz6JFxIudhFI7JmsVdAYgT5N14A02ed8D+wD49vCQEGckRtd+C/+7tpHiHihfhe1NZFoeFHEKoxqfh/C+4+E6Cq4pNE0ZldKBbjiwz/prTy1vE06SXyZhSaqPo5sBSHFmx+3rbmZYaupbcpCPuSpp8o4Vhv1VfNShB\",\"pubKey\":\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA18n0Evb4t3cPIEqJIFzCIlrKT+WB50f37vVhURq3dB+WEikgyX4jIyftQW2w7qdliyKVcowYQ6wzNgF2S57Q6yGHSDeLM5LRq/rq8XlkNvWS6YQoNAyHwPKSB2dqc5cRVYOxLJB05IIQvH/Q0PyHiBYIckEuUVNx4n34Uw+JloJIvPUOVeS/RBGwP2oPl3fy36NrorcKj3b257cXQggJKSUlfmW6SRyeRcQQKapCnEBPzn53tS+rISz9ilUxW428nsX9mnWxscLK1vC6hpEnhhZhMnPnX1in5AFNwx8HjPHfMijOHiVvMLnofE6VGxAjnN4pVcw2QSfO1SVeWg2HlwIDAQAB\",\"crt\":\"MIICnTCCAYUCBgGehkVGoDANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdqZ3JvdXBzMB4XDTI2MDYwMjAyNTcyN1oXDTI2MDgwMTAyNTkwN1owEjEQMA4GA1UEAwwHamdyb3VwczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANfJ9BL2+Ld3DyBKiSBcwiJayk/lgedH9+71YVEat3QflhIpIMl+IyMn7UFtsO6nZYsilXKMGEOsMzYBdkue0Oshh0g3izOS0av66vF5ZDb1kumEKDQMh8DykgdnanOXEVWDsSyQdOSCELx/0ND8h4gWCHJBLlFTceJ9+FMPiZaCSLz1DlXkv0QRsD9qD5d38t+ja6K3Co929ue3F0IICSklJX5lukkcnkXEECmqQpxAT85+d7UvqyEs/YpVMVuNvJ7F/Zp1sbHCytbwuoaRJ4YWYTJz519Yp+QBTcMfB4zx3zIozh4lbzC56HxOlRsQI5zeKVXMNkEnztUlXloNh5cCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAlUy00cByqAFn1tjEpx8q/cpIIM0nuQ9DxEEUMJUO9DRwd6HY+okzFiTU18YhCpjffp1KPeX2/WbjmXmfAvl4heznxUKzIit5Vi33QtRJb/lLxruTKYYgfq3379ec+w6m3EGdidyD7dE3i5KjVKCfZuWhfhWWRzvNDVATY6EILTTgzlnLmdLZ/plEaC3mB8f5AjovZchPGZsVQ+55NHeDiXHe8h488ruaX6mKRlYWBvKpp/+l5cJmnckf00izw2XSNnHwryGyo6NQH7bvrt3PVHqZtCw4ilx8GRNhenlgrrFv66hr/TDQje1zBfevT0Su7U6Tw6rsBLo+m1x5f75e2w==\",\"alias\":\"072bafa1-e543-4e1f-8e56-8f4182d9bf58\",\"generatedMillis\":1780369147673}',1),
('JGROUPS_ADDRESS_SEQUENCE','31',31);
/*!40000 ALTER TABLE `SERVER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  KEY `USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES
('is_temporary_admin','true','8c7860e9-03e7-4400-a106-c1f28a6a7823','df2eca36-00b8-46ca-801b-fbbe0e1a9d6d',NULL,NULL,NULL);
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_LOCAL_CONSENT` (`CLIENT_ID`,`USER_ID`),
  UNIQUE KEY `UK_EXTERNAL_CONSENT` (`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  KEY `IDX_USCONSENT_SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` tinyint(1) NOT NULL DEFAULT 0,
  `ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT 0,
  `LAST_MODIFIED_TIMESTAMP` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`),
  KEY `IDX_USER_CREATED_TIMESTAMP` (`REALM_ID`,`CREATED_TIMESTAMP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES
('1e25ba6b-2ed9-4695-992a-4ae3545c7526','teste123@teste.com','teste123@teste.com',1,1,NULL,'USER','USER','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','user',1777422114906,NULL,0,1777422114906),
('21778209-f2c7-4568-9c84-e3c3d9eb3a24','fallen@yahoo.com','fallen@yahoo.com',0,1,NULL,'Gustavo Henrique','Rios Pereira','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','gustavo',1778106769177,NULL,0,1778106769177),
('4255edb8-bff3-48c0-9683-85e29c76a0af','willian@teste.com','willian@teste.com',1,1,NULL,'willian','teste','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','willian',1778717531371,NULL,0,1778717531371),
('630afa86-3a25-489b-bde6-2809f9c20ed4','teste@teste.com','teste@teste.com',1,1,NULL,'Admin','Admin','fb1ad2cb-3389-46ca-ac4c-eebb9309d896','admin',1777421878185,NULL,0,1777421878185),
('8c7860e9-03e7-4400-a106-c1f28a6a7823',NULL,'16a35fac-c782-4560-9bb5-198f3b7afab5',0,1,NULL,NULL,NULL,'32498a75-22fb-4e5e-9e38-d5a29eb8e76d','admin',1777417392324,NULL,0,1777417392324);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `MEMBERSHIP_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES
('50254feb-4f0d-49f9-a235-278c7ef90ce7','1e25ba6b-2ed9-4695-992a-4ae3545c7526'),
('f59f024e-90f5-4403-88c9-85ab7e0276cd','1e25ba6b-2ed9-4695-992a-4ae3545c7526'),
('50254feb-4f0d-49f9-a235-278c7ef90ce7','21778209-f2c7-4568-9c84-e3c3d9eb3a24'),
('83bc7935-cac4-44f4-97d5-c33ea80144c7','21778209-f2c7-4568-9c84-e3c3d9eb3a24'),
('207fd8a6-ef72-4dac-aacd-e9f719c90cd1','4255edb8-bff3-48c0-9683-85e29c76a0af'),
('50254feb-4f0d-49f9-a235-278c7ef90ce7','4255edb8-bff3-48c0-9683-85e29c76a0af'),
('207fd8a6-ef72-4dac-aacd-e9f719c90cd1','630afa86-3a25-489b-bde6-2809f9c20ed4'),
('50254feb-4f0d-49f9-a235-278c7ef90ce7','630afa86-3a25-489b-bde6-2809f9c20ed4'),
('c31d5fd4-8009-4637-968e-af3f92054f33','8c7860e9-03e7-4400-a106-c1f28a6a7823'),
('e308448e-9633-4fc8-8712-03fe1b70bbf0','8c7860e9-03e7-4400-a106-c1f28a6a7823');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES
('6fc258d3-453e-4e89-bc18-dccaaa733cb8','https://frontberenice.projeto.com'),
('801777b9-a574-4683-8225-0ec1d8f99acb','https://frontberenice.projeto.com'),
('8ca1e477-dae0-45d0-b167-997db465ca12','+'),
('b3d9305c-1611-4fb0-82ea-b2eb42f24a11','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKFLOW_STATE`
--

DROP TABLE IF EXISTS `WORKFLOW_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `WORKFLOW_STATE` (
  `EXECUTION_ID` varchar(255) NOT NULL,
  `RESOURCE_ID` varchar(255) NOT NULL,
  `WORKFLOW_ID` varchar(255) NOT NULL,
  `RESOURCE_TYPE` varchar(255) DEFAULT NULL,
  `SCHEDULED_STEP_ID` varchar(255) DEFAULT NULL,
  `SCHEDULED_STEP_TIMESTAMP` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`EXECUTION_ID`),
  UNIQUE KEY `UQ_WORKFLOW_RESOURCE` (`WORKFLOW_ID`,`RESOURCE_ID`),
  KEY `IDX_WORKFLOW_STATE_STEP` (`WORKFLOW_ID`,`SCHEDULED_STEP_ID`),
  KEY `IDX_WORKFLOW_STATE_PROVIDER` (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKFLOW_STATE`
--

LOCK TABLES `WORKFLOW_STATE` WRITE;
/*!40000 ALTER TABLE `WORKFLOW_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORKFLOW_STATE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-06-09 22:22:54
