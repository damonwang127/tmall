DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`uid` int(11) NOT NULL,
	`pid` int(11) NOT NULL,
	`number` varchar(255) DEFAULT '',
	`sum` varchar(255) DEFAULT '',
	`deleteAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
	)ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) DEFAULT '',
	`recommend` varchar(255) DEFAULT '',
	`deleteAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
	)ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL,
	`uid` int(11) NOT NULL,
	`content` varchar(255) DEFAULT '',
	`createDate` datetime DEFAULT NULL,
	`deleteAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
	)ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) DEFAULT '',
	`cname` varchar(255) DEFAULT '',
	`value` varchar(255) DEFAULT '',
	`rate` varchar(255) DEFAULT '',
	`deleteAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
	)ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`oid` int(11) NOT NULL,
	`pid` int(11) NOT NULL,
	`cmid` int(11) NOT NULL,
	`number` varchar(255) DEFAULT '',
	`sum` varchar(255) DEFAULT '',
	`deleteAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
	)ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`cid` int(11) NOT NULL,
	`name` varchar(255) DEFAULT '',
	`subTitle` varchar(255) DEFAULT '',
	`originalPrice` varchar(255) DEFAULT '',
	`nowPrice` varchar(255) DEFAULT '',
	`stock` varchar(255) DEFAULT '',
	`imgid` int(11) NOT NULL,
	`createDate` datetime DEFAULT NULL,
	`commentCount` int(11) NOT NULL,
	`saleCount` int(11) NOT NULL,
	`deleteAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
	)ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `property`;
CREATE TABLE `property`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`cid` int(11) NOT NULL,
	`name` varchar(255) DEFAULT '',
	`deleteAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`),
	KEY `fk_property_category` (`cid`),
	CONSTRAINT `fk_property_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
	)ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL,
	`ptid` int(11) NOT NULL,
	`value` varchar(255) DEFAULT '',
	`deleteAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
	KEY `fk_property_value_property` (`ptid`),
	KEY `fk_property_value_product` (`pid`),
	CONSTRAINT `fk_property_value_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
	CONSTRAINT `fk_property_value_property` FOREIGN KEY (`ptid`) REFERENCES `property` (`id`)
	)ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) DEFAULT '',
	`password` varchar(255) DEFAULT '',
	`gourp` varchar(255) NOT NULL DEFAULT 'user',
	`deleteAt` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
	)ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;