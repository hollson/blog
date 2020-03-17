# hollson.github.io

[TOC]

# 命令行参数：
```shell
$ hugo server -t hyde --buildDrafts --baseURL=http://xxx.com  --bind=0.0.0.0 --port=80
```

```shell
--bind="127.0.0.1"    服务监听IP地址；
-p, --port=1313       服务监听端口；
-w, --watch[=true]    监听站点目录，发现文件变更自动编译；
-D, --buildDrafts     包括被标记为draft的文章；
-E, --buildExpired    包括已过期的文章；
-F, --buildFuture     包括将在未来发布的文章；
-b, --baseURL="www.datals.com"  服务监听域名；
--log[=false]:        开启日志；
--logFile="/var/log/hugo.log":          log输出路径；
-t, --theme=""         指定主题；
-v, --verbose[=false]: 输出详细信息
```
> 注意：当时发布的文章被视为【未来发布的文章】，所以-F有时候就显得很有必要

素材：
//https://cdn.pixabay.com/photo/2020/01/16/03/36/coastguard-4769562_1280.jpg
//https://cdn.pixabay.com/photo/2017/09/30/22/18/bloody-rail-2803727_1280.jpg
//https://cdn.pixabay.com/photo/2016/08/06/18/45/adac-1574932_1280.jpg