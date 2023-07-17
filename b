#!/bin/zsh

# 接受一个参数，即你要替换的数字
n=$1

# 检查参数是否是正整数
if ! [[ "$n" =~ ^[0-9]+$ ]]
then
   echo "Error: Please provide a positive integer as argument." >&2
   exit 1
fi

# 定义文件路径
filepath="/Applications/Arduino IDE.app/Contents/Resources/app/node_modules/arduino-serial-plotter-webapp/build/static/js"

# 遍历目录中的所有文件
for file in "$filepath"/*
do
    # 使用 sed 命令替换文件中的字符串
    sed -i '' "s/Object(o.useState)(50)/Object(o.useState)($n)/g" "$file"
done

echo "Replacement operation completed."
