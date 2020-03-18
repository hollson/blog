#!/bin/bash
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# 推送源码
git add .
msg="rebuilding site $(date)"
if [ $# -eq 1 ]; then
  msg="$1"
fi
git commit -m "$msg"
git push origin master
echo "【Github】源码推送成功！！！"

# Hugo编译
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# 推送发布
cd public
git add .
if [ $# -eq 1 ]; then
  msg="$1"
fi
git commit -m "$msg"
git push origin master
echo "【Github】项目发布成功！！！"
cd ..