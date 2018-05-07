/*
Navicat MySQL Data Transfer

Source Server         : mysq
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : renshi

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-09-13 21:59:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dept_inf`
-- ----------------------------
DROP TABLE IF EXISTS `dept_inf`;
CREATE TABLE `dept_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept_inf
-- ----------------------------
INSERT INTO `dept_inf` VALUES ('1', '技术部', '技术部');
INSERT INTO `dept_inf` VALUES ('2', '运营部', '运营部');
INSERT INTO `dept_inf` VALUES ('3', '财务部', '财务部');
INSERT INTO `dept_inf` VALUES ('4', '总公办', '总公办');
INSERT INTO `dept_inf` VALUES ('5', '市场部', '市场部');
INSERT INTO `dept_inf` VALUES ('6', '教学部', '教学部');
INSERT INTO `dept_inf` VALUES ('7', 'aaaa', 'aaaa');
INSERT INTO `dept_inf` VALUES ('8', '舍管部', '管理宿舍');

-- ----------------------------
-- Table structure for `document_inf`
-- ----------------------------
DROP TABLE IF EXISTS `document_inf`;
CREATE TABLE `document_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `filename` varchar(300) NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_user` (`user_id`),
  CONSTRAINT `fk_document_user` FOREIGN KEY (`user_id`) REFERENCES `user_inf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document_inf
-- ----------------------------
INSERT INTO `document_inf` VALUES ('4', '配置文件1', 'IP地址.txt', '配置', '2017-06-06 10:20:54', '1');

-- ----------------------------
-- Table structure for `employee_inf`
-- ----------------------------
DROP TABLE IF EXISTS `employee_inf`;
CREATE TABLE `employee_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `card_id` varchar(18) NOT NULL,
  `address` varchar(50) NOT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `tel` varchar(16) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `qq_num` varchar(10) DEFAULT NULL,
  `emall` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL DEFAULT '1',
  `party` varchar(10) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `race` varchar(100) DEFAULT NULL,
  `education` varchar(10) DEFAULT NULL,
  `speciality` varchar(20) DEFAULT NULL,
  `hobby` varchar(100) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_emp_dept` (`dept_id`),
  KEY `fk_emp_job` (`job_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`dept_id`) REFERENCES `dept_inf` (`id`),
  CONSTRAINT `fk_emp_job` FOREIGN KEY (`job_id`) REFERENCES `job_inf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_inf
-- ----------------------------
INSERT INTO `employee_inf` VALUES ('1', '1', '8', '李洋洋', '4328011988', '山东菏泽', '510000', '020-7777777', '18864803272', '1591992570', '1591992570@qq.com', '0', '共青团员', '1996-10-01 08:58:22', '汉', '本科', '计算机', '爬山', '无', '2017-05-23 08:59:21');
INSERT INTO `employee_inf` VALUES ('2', '2', '1', '刘冠麟', '4328011999', '山东临沂', '520000', '020-5555555', '18864803252', '1886456823', '18864803252@163.com', '1', '共青团员', '2017-05-23 09:01:17', '汉', '本科', '计算机', null, '', '2017-05-23 09:01:41');
INSERT INTO `employee_inf` VALUES ('3', '1', '2', '孙建军', '4328011555', '山东儿童', '530000', '020-6666666', '15687543225', '1521321454', '12154521445@163.com', '1', '共青团员', '2017-05-23 09:03:12', '汉', '本科', '计算机', '撩妹', '无', '2017-05-23 09:03:32');

-- ----------------------------
-- Table structure for `job_inf`
-- ----------------------------
DROP TABLE IF EXISTS `job_inf`;
CREATE TABLE `job_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_inf
-- ----------------------------
INSERT INTO `job_inf` VALUES ('1', '总经理', '职员');
INSERT INTO `job_inf` VALUES ('2', 'java开发工程师', 'java开发工程师');
INSERT INTO `job_inf` VALUES ('3', 'java中级开发工程师', 'java中级开发工程师');
INSERT INTO `job_inf` VALUES ('4', 'java高级开发工程师', 'java高级开发工程第');
INSERT INTO `job_inf` VALUES ('5', '系统管理员', '系统管理员');
INSERT INTO `job_inf` VALUES ('6', '架构师', '架构师');
INSERT INTO `job_inf` VALUES ('7', '主管', '主管');
INSERT INTO `job_inf` VALUES ('8', '经理', '经理');
INSERT INTO `job_inf` VALUES ('9', '总经理', '总经理');
INSERT INTO `job_inf` VALUES ('10', '学生', '学生');

-- ----------------------------
-- Table structure for `notice_inf`
-- ----------------------------
DROP TABLE IF EXISTS `notice_inf`;
CREATE TABLE `notice_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notice_user` (`user_id`),
  CONSTRAINT `fk_notice_user` FOREIGN KEY (`user_id`) REFERENCES `user_inf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_inf
-- ----------------------------
INSERT INTO `notice_inf` VALUES ('1', '放假啦', '六一快乐哈', '2017-06-01 23:00:48', '1');

-- ----------------------------
-- Table structure for `user_inf`
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES ('1', 'admin', '123456', '1', '2017-06-01 23:07:43', '超级管理员');
INSERT INTO `user_inf` VALUES ('2', 'aaaaaa', 'aaaaaa', '1', '2017-06-01 23:08:00', 'aaaaaa');
INSERT INTO `user_inf` VALUES ('3', 'yangzai', '123456', '1', '2017-06-01 23:14:31', '阳仔');
