/*
 Navicat MySQL Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : TCD_SOCS

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 28/11/2018 10:40:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Activities
-- ----------------------------
DROP TABLE IF EXISTS `Activities`;
CREATE TABLE `Activities` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Date_Time` datetime NOT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Location_ID` (`Location_ID`),
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Activities
-- ----------------------------
BEGIN;
INSERT INTO `Activities` VALUES (101, 'TEDx Conference', 'See exciting speakers ', '2019-01-01 18:00:00', 1);
INSERT INTO `Activities` VALUES (102, 'Incubators', 'Get investement for your startup', '2019-01-01 17:00:00', 1);
INSERT INTO `Activities` VALUES (103, 'MOVE Ball', 'Get your tux on and support charity', '2019-05-01 14:00:00', 2);
INSERT INTO `Activities` VALUES (104, 'Design workshop', 'Learn the latest in modern arts installations', '2019-03-02 12:00:00', 3);
INSERT INTO `Activities` VALUES (105, 'VDP panto', 'Support charity and have a laugh at VDP christmas panto', '2019-06-01 13:00:00', 4);
INSERT INTO `Activities` VALUES (106, 'Economic Forum', 'Get the lowdown on where the Irish economy is headed from leading experts', '2019-03-06 16:30:00', 5);
INSERT INTO `Activities` VALUES (107, 'TEDx Salon', 'See TED speakers Mark Pollock and Simone George', '2019-09-01 17:00:00', 2);
INSERT INTO `Activities` VALUES (108, 'MOVE Carol Singing', 'Support charity and get in the christmas spirit', '2019-01-06 18:30:00', 6);
COMMIT;

-- ----------------------------
-- Table structure for Activities_SignUp
-- ----------------------------
DROP TABLE IF EXISTS `Activities_SignUp`;
CREATE TABLE `Activities_SignUp` (
  `Students_Enrolled_ID` int(11) NOT NULL,
  `Activities_ID` int(11) NOT NULL,
  PRIMARY KEY (`Students_Enrolled_ID`,`Activities_ID`),
  KEY `Activities_ID` (`Activities_ID`),
  CONSTRAINT `activities_signup_ibfk_1` FOREIGN KEY (`Students_Enrolled_ID`) REFERENCES `students_enrolled` (`id`),
  CONSTRAINT `activities_signup_ibfk_2` FOREIGN KEY (`Activities_ID`) REFERENCES `activities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Activities_SignUp
-- ----------------------------
BEGIN;
INSERT INTO `Activities_SignUp` VALUES (16316007, 101);
INSERT INTO `Activities_SignUp` VALUES (16316009, 101);
INSERT INTO `Activities_SignUp` VALUES (16316008, 102);
INSERT INTO `Activities_SignUp` VALUES (16316010, 102);
INSERT INTO `Activities_SignUp` VALUES (16316009, 103);
INSERT INTO `Activities_SignUp` VALUES (16316011, 103);
INSERT INTO `Activities_SignUp` VALUES (16316010, 104);
INSERT INTO `Activities_SignUp` VALUES (16316012, 104);
INSERT INTO `Activities_SignUp` VALUES (16316011, 105);
INSERT INTO `Activities_SignUp` VALUES (16316013, 105);
INSERT INTO `Activities_SignUp` VALUES (16316007, 106);
INSERT INTO `Activities_SignUp` VALUES (16316010, 106);
INSERT INTO `Activities_SignUp` VALUES (16316012, 106);
INSERT INTO `Activities_SignUp` VALUES (16316007, 107);
INSERT INTO `Activities_SignUp` VALUES (16316008, 107);
INSERT INTO `Activities_SignUp` VALUES (16316011, 107);
INSERT INTO `Activities_SignUp` VALUES (16316008, 108);
INSERT INTO `Activities_SignUp` VALUES (16316009, 108);
INSERT INTO `Activities_SignUp` VALUES (16316012, 108);
COMMIT;

-- ----------------------------
-- Table structure for Activity_Organisers
-- ----------------------------
DROP TABLE IF EXISTS `Activity_Organisers`;
CREATE TABLE `Activity_Organisers` (
  `College_Societies_ID` int(11) NOT NULL,
  `Activities_ID` int(11) NOT NULL,
  PRIMARY KEY (`College_Societies_ID`,`Activities_ID`),
  KEY `Activities_ID` (`Activities_ID`),
  CONSTRAINT `activity_organisers_ibfk_1` FOREIGN KEY (`College_Societies_ID`) REFERENCES `college_societies` (`id`),
  CONSTRAINT `activity_organisers_ibfk_2` FOREIGN KEY (`Activities_ID`) REFERENCES `activities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Activity_Organisers
-- ----------------------------
BEGIN;
INSERT INTO `Activity_Organisers` VALUES (1, 101);
INSERT INTO `Activity_Organisers` VALUES (2, 102);
INSERT INTO `Activity_Organisers` VALUES (3, 103);
INSERT INTO `Activity_Organisers` VALUES (4, 104);
INSERT INTO `Activity_Organisers` VALUES (5, 105);
INSERT INTO `Activity_Organisers` VALUES (6, 106);
INSERT INTO `Activity_Organisers` VALUES (1, 107);
INSERT INTO `Activity_Organisers` VALUES (1, 108);
INSERT INTO `Activity_Organisers` VALUES (2, 108);
COMMIT;

-- ----------------------------
-- Table structure for College_Societies
-- ----------------------------
DROP TABLE IF EXISTS `College_Societies`;
CREATE TABLE `College_Societies` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Chair` int(11) DEFAULT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Chair` (`Chair`),
  CONSTRAINT `college_societies_ibfk_1` FOREIGN KEY (`Chair`) REFERENCES `students_enrolled` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of College_Societies
-- ----------------------------
BEGIN;
INSERT INTO `College_Societies` VALUES (1, 'TEDx', 'tedxtcd@csc.tcd.ie', 16316001, 'Confirmed');
INSERT INTO `College_Societies` VALUES (2, 'TES', 'tes@csc.tcd.ie', 16316002, 'Confirmed');
INSERT INTO `College_Societies` VALUES (3, 'MOVE', 'move@csc.tcd.ie', 16316003, 'Confirmed');
INSERT INTO `College_Societies` VALUES (4, 'TAF', 'taf@csc.tcd.ie', 16316004, 'Confirmed');
INSERT INTO `College_Societies` VALUES (5, 'VDP', 'vdp@csc.tcd.ie', 16316005, 'Confirmed');
INSERT INTO `College_Societies` VALUES (6, 'TEF', 'tef@csc.tcd.ie', 16316007, 'Confirmed');
INSERT INTO `College_Societies` VALUES (7, 'VIS', 'vis@csc.tcd.ie', NULL, 'Confirmed');
COMMIT;

-- ----------------------------
-- Table structure for Locations
-- ----------------------------
DROP TABLE IF EXISTS `Locations`;
CREATE TABLE `Locations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Locations
-- ----------------------------
BEGIN;
INSERT INTO `Locations` VALUES (1, 'Regent House');
INSERT INTO `Locations` VALUES (2, 'Dining Hall');
INSERT INTO `Locations` VALUES (3, 'LB01');
INSERT INTO `Locations` VALUES (4, 'LBO4');
INSERT INTO `Locations` VALUES (5, 'TBSI');
INSERT INTO `Locations` VALUES (6, 'Front Sq');
COMMIT;

-- ----------------------------
-- Table structure for Society_Members
-- ----------------------------
DROP TABLE IF EXISTS `Society_Members`;
CREATE TABLE `Society_Members` (
  `College_Society_ID` int(11) NOT NULL,
  `Students_Enrolled_ID` int(11) NOT NULL,
  PRIMARY KEY (`College_Society_ID`,`Students_Enrolled_ID`),
  KEY `Students_Enrolled_ID` (`Students_Enrolled_ID`),
  CONSTRAINT `society_members_ibfk_1` FOREIGN KEY (`College_Society_ID`) REFERENCES `college_societies` (`id`),
  CONSTRAINT `society_members_ibfk_2` FOREIGN KEY (`Students_Enrolled_ID`) REFERENCES `students_enrolled` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Society_Members
-- ----------------------------
BEGIN;
INSERT INTO `Society_Members` VALUES (1, 16316007);
INSERT INTO `Society_Members` VALUES (2, 16316007);
INSERT INTO `Society_Members` VALUES (6, 16316007);
INSERT INTO `Society_Members` VALUES (2, 16316008);
INSERT INTO `Society_Members` VALUES (3, 16316008);
INSERT INTO `Society_Members` VALUES (5, 16316008);
INSERT INTO `Society_Members` VALUES (3, 16316009);
INSERT INTO `Society_Members` VALUES (4, 16316009);
INSERT INTO `Society_Members` VALUES (3, 16316010);
INSERT INTO `Society_Members` VALUES (4, 16316010);
INSERT INTO `Society_Members` VALUES (5, 16316010);
INSERT INTO `Society_Members` VALUES (2, 16316011);
INSERT INTO `Society_Members` VALUES (5, 16316011);
INSERT INTO `Society_Members` VALUES (6, 16316011);
INSERT INTO `Society_Members` VALUES (1, 16316012);
INSERT INTO `Society_Members` VALUES (2, 16316012);
INSERT INTO `Society_Members` VALUES (6, 16316012);
INSERT INTO `Society_Members` VALUES (3, 16316013);
INSERT INTO `Society_Members` VALUES (4, 16316013);
COMMIT;

-- ----------------------------
-- Table structure for Students_Enrolled
-- ----------------------------
DROP TABLE IF EXISTS `Students_Enrolled`;
CREATE TABLE `Students_Enrolled` (
  `ID` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Second_Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Students_Enrolled
-- ----------------------------
BEGIN;
INSERT INTO `Students_Enrolled` VALUES (16316001, 'name1@tcd.ie', 'Lee', 'Campbell');
INSERT INTO `Students_Enrolled` VALUES (16316002, 'name2@tcd.ie', 'Joe', 'Deegan');
INSERT INTO `Students_Enrolled` VALUES (16316003, 'name3@tcd.ie', 'Daire', 'Pryal');
INSERT INTO `Students_Enrolled` VALUES (16316004, 'name4@tcd.ie', 'Emily', 'Feeney ');
INSERT INTO `Students_Enrolled` VALUES (16316005, 'name5@tcd.ie', 'Mellisa', 'Barnes');
INSERT INTO `Students_Enrolled` VALUES (16316006, 'name6@tcd.ie', 'Jack ', 'Dolan');
INSERT INTO `Students_Enrolled` VALUES (16316007, 'name7@tcd.ie', 'Philip', 'Smyth');
INSERT INTO `Students_Enrolled` VALUES (16316008, 'name8@tcd.ie', 'Matthew', 'Taylor');
INSERT INTO `Students_Enrolled` VALUES (16316009, 'name9@tcd.ie', 'Steven', 'Grant');
INSERT INTO `Students_Enrolled` VALUES (16316010, 'name10@tcd.ie', 'Ian', 'Fennel');
INSERT INTO `Students_Enrolled` VALUES (16316011, 'name11@tcd.ie', 'Matthew', 'Kavanagh');
INSERT INTO `Students_Enrolled` VALUES (16316012, 'name12@tcd.ie', 'Sarah', 'Hennesy');
INSERT INTO `Students_Enrolled` VALUES (16316013, 'name13@tcd.ie', 'Emma', 'Quinn');
INSERT INTO `Students_Enrolled` VALUES (16316014, 'name14@tcd.ie', 'Sarah', 'Thompson');
INSERT INTO `Students_Enrolled` VALUES (16316015, 'name15@tcd.ie', 'Clara', 'Hogan');
INSERT INTO `Students_Enrolled` VALUES (16316016, 'name16@tcd.ie', 'Rory', 'Booth');
INSERT INTO `Students_Enrolled` VALUES (16316017, 'name17@tcd.ie', 'Sophie', 'Campbell');
INSERT INTO `Students_Enrolled` VALUES (16316018, 'name18@tcd.ie', 'Mollie', 'Campbell');
INSERT INTO `Students_Enrolled` VALUES (16316019, 'name19@tcd.ie', 'Paddy', 'Campbell');
INSERT INTO `Students_Enrolled` VALUES (16316020, 'name20@tcd.ie', 'Michelle', 'Campbell');
COMMIT;

-- ----------------------------
-- View structure for activities_availible
-- ----------------------------
DROP VIEW IF EXISTS `activities_availible`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `activities_availible` AS select `socs`.`Name` AS `Organiser`,`acts`.`Name` AS `Activity`,`acts`.`Description` AS `Description`,`acts`.`Date_Time` AS `When`,`locs`.`Name` AS `Location` from (((`activities` `acts` join `activity_organisers` `orgs`) join `college_societies` `socs`) join `locations` `locs`) where ((`orgs`.`Activities_ID` = `acts`.`ID`) and (`orgs`.`College_Societies_ID` = `socs`.`ID`) and (`locs`.`ID` = `acts`.`Location_ID`));

-- ----------------------------
-- View structure for all_societies
-- ----------------------------
DROP VIEW IF EXISTS `all_societies`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `all_societies` AS select `socs`.`Name` AS `Name`,`socs`.`Email` AS `Society-Email`,`socs`.`Status` AS `Status`,`students`.`First_Name` AS `Chair_FN`,`students`.`Second_Name` AS `Chair_SN` from (`college_societies` `socs` left join `students_enrolled` `students` on((`socs`.`Chair` = `students`.`ID`)));

-- ----------------------------
-- View structure for elections_needed
-- ----------------------------
DROP VIEW IF EXISTS `elections_needed`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `elections_needed` AS select `college_societies`.`ID` AS `ID`,`college_societies`.`Name` AS `Name`,`college_societies`.`Email` AS `Email`,`college_societies`.`Chair` AS `Chair`,`college_societies`.`Status` AS `Status` from `college_societies` where isnull(`college_societies`.`Chair`);

-- ----------------------------
-- View structure for society_chairs
-- ----------------------------
DROP VIEW IF EXISTS `society_chairs`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `society_chairs` AS select `socs`.`Name` AS `Name`,`students`.`First_Name` AS `First_Name`,`students`.`Second_Name` AS `Second_Name`,`students`.`Email` AS `Email` from (`college_societies` `socs` join `students_enrolled` `students` on((`socs`.`Chair` = `students`.`ID`)));

-- ----------------------------
-- Triggers structure for table Activities
-- ----------------------------
DROP TRIGGER IF EXISTS `Activity_Before_Delete`;
delimiter ;;
CREATE TRIGGER `Activity_Before_Delete` BEFORE DELETE ON `Activities` FOR EACH ROW BEGIN

DELETE FROM Activity_Organisers WHERE Activity_Organisers.Activities.ID = OLD.ID;
DELETE FROM Activities_SignUp WHERE Activities_SignUp.Activities.ID = OLD.ID;



END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table College_Societies
-- ----------------------------
DROP TRIGGER IF EXISTS `Socs_Before_Delete`;
delimiter ;;
CREATE TRIGGER `Socs_Before_Delete` BEFORE DELETE ON `College_Societies` FOR EACH ROW BEGIN


DELETE FROM Society_Members WHERE Society_Members.College_Society_ID = OLD.ID;
DELETE FROM Activity_Organisers WHERE Activity_Organisers.College_Societies_ID = OLD.ID;


END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Locations
-- ----------------------------
DROP TRIGGER IF EXISTS `Location_Before_Delete`;
delimiter ;;
CREATE TRIGGER `Location_Before_Delete` BEFORE DELETE ON `Locations` FOR EACH ROW BEGIN

UPDATE Activities SET Location_ID = NULL WHERE Location_ID = OLD.ID;



END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Students_Enrolled
-- ----------------------------
DROP TRIGGER IF EXISTS `Student_Before_Delete`;
delimiter ;;
CREATE TRIGGER `Student_Before_Delete` BEFORE DELETE ON `Students_Enrolled` FOR EACH ROW BEGIN

DELETE FROM Society_Members WHERE Society_Members.Students_Enrolled_ID = OLD.ID;
DELETE FROM Activities_SignUp WHERE Activities_SignUp.Activities.ID = OLD.ID;
UPDATE College_Societies SET Chair = NULL WHERE Chair = OLD.ID;



END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
