# 默认实行第一条
## all@默认命令,可省略该参数,指向run命令
all: run	

# 伪命令，make clean，clean可能是一个文件名或命令
## deploy@发布到Wen服务器【mafool.com】
.PHONY:deploy
deploy:
	echo -e "\033[0;32m开始发布到mafool.ccom上...\033[0m"

	#编译
	rm -rf ./public/*
	hugo -v --baseURL=http://www.mafool.com
	echo -e "\033[0;32m编译完成...\033[0m"

	# 打包上传
	rm -f mafool-blog.tar.gz
	tar -zcvf mafool-blog.tar.gz public
	scp mafool-blog.tar.gz root@www.mafool.com:/srv/www/

	echo -e "\033[0;32m执行远程清理...\033[0m"
	ssh root@www.mafool.com 'rm -rf /srv/www/mafool-blog'
	ssh root@www.mafool.com 'cd /srv/www && tar -zxvf mafool-blog.tar.gz && mv public mafool-blog && nginx -s reload'
	rm -f mafool-blog.tar.gz


## draft@查看草稿文章列表
.PHONY:draft
draft:	
	grep -rine 'draft= true' ./content/post

## push@推送到远程仓库
.PHONY:push
push:
	@echo "\033[0;32mDeploying updates to GitHub...\033[0m";
	@git add . ;
	@msg="Rebuiled at $$(date)";git commit -m "$$msg";
	@git push origin master
	@echo "源码推送成功"

## run@运行(端口号：1313)
.PHONY:run
run:
	@rm -rf ./public;
	@open -a "/Applications/Google Chrome.app" "http://127.0.0.1:1313";\
	hugo -D -F server -p 1313; 

## save@提交到本地仓库
.PHONY:save
save:
	git add .
	msg="rebuilding site $(date)"
	if [ $# -eq 1 ]; then \
		msg="$1" ; \
	fi
	git commit -m "$msg"
	echo "saved"

## update@更新Git和Submodule
.PHONY:update
update:
	@git submodule update --init --recursive;


## help@查看make帮助
.PHONY:help
help:Makefile
	@echo "Usage:\n  make [command]"
	@echo
	@echo "Available Commands:"
	@sed -n "s/^##//p" $< | column -t -s '@' #|grep --color=auto -ie "\s....\s"