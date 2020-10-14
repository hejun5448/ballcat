-- lov 模块
DROP TABLE IF EXISTS `sys_lov`;
CREATE TABLE `sys_lov`
(
    `id`                  int(11) NOT NULL AUTO_INCREMENT,
    `keyword`             varchar(50)  DEFAULT NULL COMMENT '关键字，唯一，加载lov数据时通过关键字加载',
    `url`                 varchar(255) DEFAULT NULL COMMENT '获取数据时请求路径',
    `method`              varchar(10)  DEFAULT NULL COMMENT 'http请求方式',
    `position`            varchar(10)  DEFAULT NULL COMMENT 'http请求参数设置位置',
    `key`                 varchar(20)  DEFAULT NULL COMMENT '数据的key',
    `fixed_params`        varchar(255) DEFAULT '{}' COMMENT '固定请求参数，请设置 jsonString, 默认值 {}',
    `multiple`            bit(1)       DEFAULT NULL COMMENT '是否需要多选',
    `search`              bit(1)       DEFAULT NULL COMMENT '是否需要搜索框',
    `ret`                 bit(1)       DEFAULT NULL COMMENT '是否需要返回数据, false则不会有确定按钮',
    `ret_field`           varchar(50)  DEFAULT NULL COMMENT '返回数据的字段',
    `ret_field_data_type` tinyint(1)   DEFAULT NULL COMMENT '返回字段数据类型 1 String 2 Number',
    `create_time`         datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`         datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `keyword` (`keyword`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='lov';

DROP TABLE IF EXISTS `sys_lov_body`;
CREATE TABLE `sys_lov_body`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `keyword`     varchar(50)  DEFAULT NULL COMMENT '关键字，唯一，通过关键字关联lov',
    `title`       varchar(100) DEFAULT NULL COMMENT '标题',
    `field`       varchar(50)  DEFAULT NULL COMMENT '字段, 同一lov下，field不可重复`',
    `index`       int(255)     DEFAULT NULL COMMENT '索引，字段排序',
    `property`    varchar(255) DEFAULT '{}' COMMENT '自定义属性，请设置 jsonString, 默认值 {}',
    `custom`      bit(1)       DEFAULT NULL COMMENT '是否自定义html',
    `html`        text COMMENT '如果 custom=true 则当前值不能为空',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY (`keyword`, `field`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='lov body';

DROP TABLE IF EXISTS `sys_lov_search`;
CREATE TABLE `sys_lov_search`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `keyword`     varchar(50)  DEFAULT NULL COMMENT '关键字，唯一，通过关键字关联lov',
    `label`       varchar(100) DEFAULT NULL COMMENT '标签文字',
    `field`       varchar(50)  DEFAULT NULL COMMENT '字段',
    `placeholder` varchar(255) DEFAULT NULL COMMENT 'placeholder',
    `tag`         varchar(50)  DEFAULT NULL COMMENT 'html 标签',
    `options`     text COMMENT 'tag=SELECT时的选项',
    `min`         int(1)       DEFAULT NULL COMMENT 'tag=INPUT_NUMBER时的选项，设置数字最小值',
    `max`         int(1)       DEFAULT NULL COMMENT 'tag=INPUT_NUMBER时的选项，设置数字最大值',
    `dict_code`   varchar(50)  DEFAULT NULL COMMENT 'tag=DICT_SELECT时的选项，设置dict-code',
    `custom`      bit(1)       DEFAULT NULL COMMENT '是否自定义html',
    `html`        text COMMENT '如果 custom=true 则当前值不能为空',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY (`keyword`, `field`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='lov search';


-- 角色数据权限字段
ALTER TABLE `ballcat`.`sys_role`
ADD COLUMN `scope_type` tinyint(1) NULL COMMENT '数据权限：1全部，2本人，3本人及子部门，4本部门' AFTER `update_time`;