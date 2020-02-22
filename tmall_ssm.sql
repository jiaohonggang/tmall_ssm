/*
SQLyog Ultimate v9.62 
MySQL - 8.0.13 : Database - tmall_ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tmall_ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tmall_ssm`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) NOT NULL COMMENT '分类的名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`) values (1,'女装 /内衣'),(2,'男装 /运动户外'),(3,'女鞋 /男鞋 /箱包'),(4,'美妆 /个人护理'),(5,'腕表 /眼镜 /珠宝饰品'),(6,'手机 /数码 /电脑办公'),(7,'母婴玩具'),(8,'零食 /茶酒 /进口食品'),(9,'生鲜水果'),(10,'大家电 /生活电器'),(11,'家具建材'),(12,'汽车 /配件 /用品'),(13,'家纺 /家饰 /鲜花'),(14,'医药保健'),(15,'厨具 /收纳 /宠物'),(16,'图书音像');

/*Table structure for table `order_` */

DROP TABLE IF EXISTS `order_`;

CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `order_code` varchar(255) NOT NULL COMMENT '订单号',
  `address` varchar(255) NOT NULL COMMENT '收货地址',
  `post` varchar(255) NOT NULL COMMENT '邮编',
  `receiver` varchar(255) NOT NULL COMMENT '收货人姓名',
  `mobile` varchar(255) NOT NULL COMMENT '手机号码',
  `user_message` varchar(255) NOT NULL COMMENT '用户备注的信息',
  `create_date` datetime NOT NULL COMMENT '订单创建时间',
  `pay_date` datetime DEFAULT NULL COMMENT '订单支付时间',
  `delivery_date` datetime DEFAULT NULL COMMENT '发货日期',
  `confirm_date` datetime DEFAULT NULL COMMENT '确认收货日期',
  `user_id` int(11) DEFAULT NULL COMMENT '对应的用户id',
  `status` varchar(255) NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`user_id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `order_` */

insert  into `order_`(`id`,`order_code`,`address`,`post`,`receiver`,`mobile`,`user_message`,`create_date`,`pay_date`,`delivery_date`,`confirm_date`,`user_id`,`status`) values (1,'123456','地球村','','我没有三颗心脏','','','2018-11-30 00:00:00','2018-04-29 00:00:00','2018-04-29 00:00:00','2018-04-29 00:00:00',1,'delete'),(10,'20180506143826504','123123','','我没有三颗心脏','12345678910','','2018-05-06 00:00:00','2018-05-06 00:00:00',NULL,NULL,1,'delete'),(11,'20180507092435428','详细地址','','我没有三颗心脏','12345678910','卖家留言','2018-05-07 00:00:00','2018-05-07 00:00:00',NULL,NULL,1,'finish'),(12,'20180507180327444','123','','我没有三颗心脏','12345678910','','2018-05-07 00:00:00','2018-05-07 00:00:00','2018-05-07 00:00:00','2018-05-07 00:00:00',1,'finish'),(13,'20180507205110309','','','','','','2018-05-07 00:00:00','2018-05-07 00:00:00','2019-08-21 00:00:00','2019-08-21 00:00:00',1,'finish'),(14,'20180716093257383','','','','','','2018-07-16 00:00:00','2018-07-16 00:00:00','2019-08-21 10:35:22',NULL,4,'waitConfirm'),(15,'20190821174528178','fdsfsdfsdfsdfsd','123','fsdf','123456789123','','2019-08-21 00:00:00','2019-08-21 09:45:32',NULL,NULL,1,'waitDelivery'),(16,'20190821181750418','123','123','1233213','213','','2019-08-21 00:00:00','2019-08-21 10:17:53',NULL,NULL,1,'waitDelivery'),(17,'20190821183601764','22222222222','22222','222','222','','2019-08-21 00:00:00','2019-08-21 00:00:00','2019-08-21 00:00:00','2019-08-21 10:36:43',1,'waitReview'),(18,'20190821184451545','234','234','234','324234','','2019-08-21 10:44:52',NULL,NULL,NULL,1,'waitPay'),(19,'20190821185340770','123','123','1233213','213','','2019-08-21 10:53:41',NULL,NULL,NULL,1,'waitPay'),(20,'20190821194032071','123232','321321312','312321321','321321321','','2019-08-21 00:00:00','2019-08-21 11:40:34',NULL,NULL,5,'waitDelivery'),(21,'20190821194127028','rewre','2342132','werwer','12321323','','2019-08-21 11:41:27',NULL,NULL,NULL,5,'waitPay'),(22,'20190821200759393','北京市海淀区中关村大街银科大厦8层','100000','归长安','18211236868','','2019-08-21 00:00:00','2019-08-21 00:00:00','2019-08-21 00:00:00','2019-08-21 00:00:00',1,'finish'),(23,'20190821201757994','长沙市岳麓区万达广场','410006','xiaowoniu','17310985887','','2019-08-21 12:17:58',NULL,NULL,NULL,6,'waitPay');

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int(11) NOT NULL COMMENT '对应产品id',
  `order_id` int(11) DEFAULT NULL COMMENT '对应订单id',
  `user_id` int(11) NOT NULL COMMENT '对应用户id',
  `number` int(11) DEFAULT NULL COMMENT '对应产品购买的数量',
  PRIMARY KEY (`id`),
  KEY `fk_order_item_product` (`product_id`),
  KEY `fk_order_item_order` (`order_id`),
  KEY `fk_order_item_user` (`user_id`),
  CONSTRAINT `fk_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `order_` (`id`),
  CONSTRAINT `fk_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_order_item_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `order_item` */

insert  into `order_item`(`id`,`product_id`,`order_id`,`user_id`,`number`) values (14,5,11,1,6),(15,6,11,1,1),(16,4,15,1,6),(17,4,12,1,1),(18,8,13,1,1),(19,5,14,4,1),(20,4,16,1,1),(21,4,17,1,1),(22,4,18,1,1),(23,5,19,1,1),(24,4,20,5,2),(25,4,21,5,1),(26,4,22,1,1),(27,5,23,6,1),(28,4,NULL,1,1);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) NOT NULL COMMENT '产品的名称',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '小标题',
  `price` float DEFAULT NULL COMMENT '价格',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `category_id` int(11) DEFAULT NULL COMMENT '对应的分类id',
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`category_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`sub_title`,`price`,`sale`,`stock`,`category_id`) values (4,'男装 袋装圆领T恤(短袖) 404133 优衣库UNIQLO','初上市价格39元',39,107769,9999,1),(5,'复古连衣裙2018春夏新款女装休闲宽松韩版气质圆领中袖丝麻连衣裙','丝麻面料 做工精细 气质优雅',368,1148,9999,1),(6,'【满400减40】ONLY夏新喇叭长袖高腰碎花连衣裙女|117207510','纯色内衬 镂空设计7天降退差价',224.5,946,9999,1),(7,'夏季2018新款短袖男士t恤韩版宽松ulzzang百搭潮流半袖七分袖上衣','2件装79元！收藏加购优先发货！',79,9543,9999,1),(8,'唐狮春秋季牛仔外套男牛仔衣夹克韩版潮流修身帅气情侣装男生外套','潮流多色，热卖上万件',169,4909,9999,1),(9,'产品6','',NULL,NULL,NULL,1),(10,'产品7','',NULL,NULL,NULL,1),(11,'产品8','',NULL,NULL,NULL,1),(12,'产品9','',NULL,NULL,NULL,1),(13,'产品10','',NULL,NULL,NULL,1),(14,'产品11','',NULL,NULL,NULL,1),(15,'产品12','',NULL,NULL,NULL,1),(16,'产品13','',NULL,NULL,NULL,1),(17,'产品14','',NULL,NULL,NULL,1),(18,'产品15','',NULL,NULL,NULL,1),(19,'产品16','',NULL,NULL,NULL,1),(20,'产品17','',NULL,NULL,NULL,1);

/*Table structure for table `product_image` */

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int(11) DEFAULT NULL COMMENT '对应的产品id',
  PRIMARY KEY (`id`),
  KEY `fk_product_image_product` (`product_id`),
  CONSTRAINT `fk_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

/*Data for the table `product_image` */

insert  into `product_image`(`id`,`product_id`) values (11,4),(12,4),(13,4),(14,4),(15,4),(16,5),(17,5),(18,5),(19,5),(20,5),(21,6),(22,6),(23,6),(24,6),(25,6),(26,7),(27,7),(28,7),(29,7),(30,7),(31,8),(32,8),(33,8),(34,8),(35,8),(36,9),(37,9),(38,9),(39,9),(40,9),(41,10),(42,10),(43,10),(44,10),(45,10),(46,11),(47,11),(48,11),(49,11),(50,11),(51,12),(52,12),(53,12),(54,12),(55,12),(56,13),(57,13),(58,13),(59,13),(60,13),(61,14),(62,14),(63,14),(64,14),(65,14),(66,15),(67,15),(68,15),(69,15),(70,15),(71,16),(72,16),(73,16),(74,16),(75,16),(76,17),(77,17),(78,17),(79,17),(80,17),(81,18),(82,18),(83,18),(84,18),(85,18),(86,19),(87,19),(88,19),(89,19),(90,19),(91,20),(92,20),(93,20),(94,20),(95,20);

/*Table structure for table `property` */

DROP TABLE IF EXISTS `property`;

CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) DEFAULT NULL COMMENT '属性名称',
  `category_id` int(11) NOT NULL COMMENT '对应的分类id',
  PRIMARY KEY (`id`),
  KEY `fk_property_category` (`category_id`),
  CONSTRAINT `fk_property_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `property` */

insert  into `property`(`id`,`name`,`category_id`) values (1,'尺寸',1),(2,'厚薄',1),(3,'材质成分',1),(4,'货号',1),(5,'基础风格',1),(6,'品牌',1);

/*Table structure for table `property_value` */

DROP TABLE IF EXISTS `property_value`;

CREATE TABLE `property_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `product_id` int(11) NOT NULL COMMENT '对应产品id',
  `property_id` int(11) NOT NULL COMMENT '对应属性id',
  `value` varchar(255) DEFAULT NULL COMMENT '具体的属性值',
  PRIMARY KEY (`id`),
  KEY `fk_property_value_property` (`property_id`),
  KEY `fk_property_value_product` (`product_id`),
  CONSTRAINT `fk_property_value_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_property_value_property` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `property_value` */

insert  into `property_value`(`id`,`product_id`,`property_id`,`value`) values (1,4,1,'L M XL XLL'),(2,4,2,'常规'),(3,4,3,'棉66% 聚酯纤维34%'),(4,4,4,'UQ404133000'),(5,4,5,'其他'),(6,4,6,'Uniqlo/优衣库');

/*Table structure for table `referal_link` */

DROP TABLE IF EXISTS `referal_link`;

CREATE TABLE `referal_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `text` varchar(255) NOT NULL COMMENT '超链显示的文字',
  `link` varchar(255) NOT NULL COMMENT '超链的地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `referal_link` */

insert  into `referal_link`(`id`,`text`,`link`) values (1,'天猫会员','#nowhere'),(2,'电器城','#nowhere'),(3,'喵鲜生','#nowhere'),(4,'医药馆','#nowhere'),(5,'营业厅','#nowhere'),(6,'魅力惠','#nowhere'),(7,'飞猪旅游','#nowhere'),(8,'苏宁易购','#nowhere');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `content` varchar(4000) DEFAULT NULL COMMENT '评价内容',
  `user_id` int(11) NOT NULL COMMENT '对应的用户id',
  `product_id` int(11) NOT NULL COMMENT '对应的产品id',
  `createDate` datetime DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`),
  KEY `fk_review_product` (`product_id`),
  KEY `fk_review_user` (`user_id`),
  CONSTRAINT `fk_review_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `review` */

insert  into `review`(`id`,`content`,`user_id`,`product_id`,`createDate`) values (2,'这款短袖T恤不错哦，没想到买的号码挺准。上身效果好看，特别时尚休闲。和图片上的一样，没色差，衣服料子很好，没线头，布料是棉的，摸起来舒服，比想象的要厚实。朋友们都说好看，款式简洁大方。真的是超级赞，以后就认准这家啦，有想买的亲赶快下手哦。我是这的老顾客了，这家产品确实一直棒棒的哦。',1,4,'2018-05-02 10:24:02'),(3,'比较轻薄，质量蛮好的，穿起来还是比较舒适，很合身，价格也实惠！',1,4,'2018-05-02 10:42:07'),(6,'上身效果很好',3,6,'2018-05-07 10:49:09'),(7,'评价一个',1,6,'2018-05-07 11:01:06'),(8,'qw54e5qwe4qw6eq4eqewq',1,4,'2018-05-07 18:05:09'),(9,'当评价完成之后，可以看到其他用户的评价信息',1,4,'2018-05-07 20:59:49'),(10,'非常好',1,8,'2019-08-21 10:34:57'),(11,'不错，挺好看的！',1,4,'2019-08-21 12:13:22');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引id',
  `name` varchar(255) NOT NULL COMMENT '用户名称',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`) values (1,'admin','123'),(2,'root','123'),(3,'test','123'),(4,'abc','123'),(5,'demo','123'),(6,'youxiu','123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
