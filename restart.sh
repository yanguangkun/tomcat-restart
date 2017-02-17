#!/bin/sh
#
# tomcat重启脚本
#
PRG="$0"

PRGDIR=`dirname "$PRG"`

# 获取tomcat目录
CATALINA_HOME=`cd "$PRGDIR/.." >/dev/null; pwd`

# 获取tomcat进程并杀死进程
for pid in $(ps -ef|grep $CATALINA_HOME|awk '{print $2,$8}'|grep java|awk '{print $1}'); do
    echo "停止运行 $CATALINA_HOME 进程id:$pid"
    kill -9 $pid
done

# 启动tomcat
if [ "$1" != "stop" ]; then
  echo "重启tomcat"
  echo "tomcat 目录 $CATALINA_HOME"
  $CATALINA_HOME/bin/startup.sh
  echo "重启完成"
fi
