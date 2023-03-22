/*
 Navicat Premium Data Transfer

 Source Server         : mycould
 Source Server Type    : MariaDB
 Source Server Version : 50556
 Source Host           : 118.25.36.41
 Source Database       : lu_tale

 Target Server Type    : MariaDB
 Target Server Version : 50556
 File Encoding         : utf-8

 Date: 05/03/2018 17:01:52 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_attach`
-- ----------------------------
DROP TABLE IF EXISTS `t_attach`;
CREATE TABLE `t_attach` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(100) NOT NULL DEFAULT '',
  `ftype` VARCHAR(50) DEFAULT '',
  `fkey` TEXT NOT NULL,
  `authorId` INT(10) DEFAULT NULL,
  `created` INT(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



-- ----------------------------
--  Table structure for `t_comments`
-- ----------------------------
DROP TABLE IF EXISTS `t_comments`;
CREATE TABLE `t_comments` (
  `coid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` INT(10) UNSIGNED DEFAULT '0',
  `created` INT(10) UNSIGNED DEFAULT '0',
  `author` VARCHAR(200) DEFAULT NULL,
  `authorId` INT(10) UNSIGNED DEFAULT '0',
  `ownerId` INT(10) UNSIGNED DEFAULT '0',
  `mail` VARCHAR(200) DEFAULT NULL,
  `url` VARCHAR(200) DEFAULT NULL,
  `ip` VARCHAR(64) DEFAULT NULL,
  `agent` VARCHAR(200) DEFAULT NULL,
  `content` TEXT,
  `type` VARCHAR(16) DEFAULT 'comment',
  `status` VARCHAR(16) DEFAULT 'approved',
  `parent` INT(10) UNSIGNED DEFAULT '0',
  PRIMARY KEY (`coid`),
  KEY `cid` (`cid`),
  KEY `created` (`created`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `t_contents`
-- ----------------------------
DROP TABLE IF EXISTS `t_contents`;
CREATE TABLE `t_contents` (
  `cid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) DEFAULT NULL,
  `titlePic` VARCHAR(55) DEFAULT NULL,
  `slug` VARCHAR(200) DEFAULT NULL,
  `created` INT(10) UNSIGNED DEFAULT '0',
  `modified` INT(10) UNSIGNED DEFAULT '0',
  `content` TEXT COMMENT '内容文字',
  `authorId` INT(10) UNSIGNED DEFAULT '0',
  `type` VARCHAR(16) DEFAULT 'post',
  `status` VARCHAR(16) DEFAULT 'publish',
  `tags` VARCHAR(200) DEFAULT NULL,
  `categories` VARCHAR(200) DEFAULT NULL,
  `hits` INT(10) UNSIGNED DEFAULT '0',
  `commentsNum` INT(10) UNSIGNED DEFAULT '0',
  `allowComment` TINYINT(1) DEFAULT '1',
  `allowPing` TINYINT(1) DEFAULT '1',
  `allowFeed` TINYINT(1) DEFAULT '1',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created` (`created`)
) ENGINE=INNODB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `t_logs`
-- ----------------------------
DROP TABLE IF EXISTS `t_logs`;
CREATE TABLE `t_logs` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `action` VARCHAR(100) DEFAULT NULL COMMENT '事件',
  `data` VARCHAR(2000) DEFAULT NULL COMMENT '数据',
  `authorId` INT(10) DEFAULT NULL COMMENT '作者编号',
  `ip` VARCHAR(20) DEFAULT NULL COMMENT 'ip地址',
  `created` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `t_metas`
-- ----------------------------
DROP TABLE IF EXISTS `t_metas`;
CREATE TABLE `t_metas` (
  `mid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) DEFAULT NULL,
  `slug` VARCHAR(200) DEFAULT NULL,
  `type` VARCHAR(32) NOT NULL DEFAULT '',
  `contentType` VARCHAR(32) DEFAULT NULL,
  `description` VARCHAR(200) DEFAULT NULL,
  `sort` INT(10) UNSIGNED DEFAULT '0',
  `parent` INT(10) UNSIGNED DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `slug` (`slug`)
) ENGINE=INNODB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `t_options`
-- ----------------------------
DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options` (
  `name` VARCHAR(32) NOT NULL DEFAULT '',
  `value` VARCHAR(1000) DEFAULT '',
  `description` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `t_options`
-- ----------------------------
BEGIN;
INSERT INTO `t_options` VALUES ('baidu_site_verification', NULL, '百度网站验证码'), ('google_site_verification', NULL, 'google网站验证码'), ('site_description', NULL, '网站描述'), ('site_keywords', NULL, NULL), ('site_record', NULL, '备案号'), ('site_title', NULL, '网站标题'), ('social_csdn', NULL, 'csdn'), ('social_github', NULL, 'github'), ('social_jianshu', NULL, '简书地址'), ('social_resume', NULL, '简历地址'), ('social_twitter', NULL, 'twitter'), ('social_weibo', NULL, '微博地址'), ('social_zhihu', NULL, '知乎地址');
COMMIT;

-- ----------------------------
--  Table structure for `t_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `t_relationships`;
CREATE TABLE `t_relationships` (
  `cid` INT(10) UNSIGNED NOT NULL,
  `mid` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `t_users`
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `uid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(32) DEFAULT NULL,
  `password` VARCHAR(64) DEFAULT NULL,
  `email` VARCHAR(200) DEFAULT NULL,
  `homeUrl` VARCHAR(200) DEFAULT NULL,
  `screenName` VARCHAR(32) DEFAULT NULL,
  `created` INT(10) UNSIGNED DEFAULT '0',
  `activated` INT(10) UNSIGNED DEFAULT '0',
  `logged` INT(10) UNSIGNED DEFAULT '0',
  `groupName` VARCHAR(16) DEFAULT 'visitor',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`username`),
  UNIQUE KEY `mail` (`email`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `t_users` password 123456
-- ----------------------------
BEGIN;
INSERT INTO `t_users` VALUES ('1', 'admin', 'a66abb5684c45962d887564f08346e8d', '1034683568@qq.com', NULL, 'admin', '1490756162', '0', '0', 'visitor');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
