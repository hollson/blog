---
title:       "{{ with slicestr .Name 10 }}{{replace . "-" " "  | strings.TrimLeft " " | title }}{{end}}"
subtitle:    "这里是子标题"
description: "这里是内容该要信息"
date:        {{ slicestr .Date 0 10 }}
author:      "史宏生"
image:       "https://hollson.github.io/img/sample-hero-image.jpg"
tags:        ["tag1", "tag2"]
categories:  ["分类"]
archives:    "{{ slicestr .Date}}"
---

# 一. XXX介绍


# 二. XXX架构原理


# 三. XXX源码分析



# 四. XXX代码示例


> 参考：
> https://xxx.xxx.com
>
> https://xxx.xxx.com

