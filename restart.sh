#!/bin/sh
# restart.sh
#
# Created by 八千里路
# 2017/02/17
#
# tomcat重启脚本
#
PRG="$0"

PRGDIR=`dirname "$PRG"`

# 获取tomcat目录
CATALINA_HOME=`cd "$PRGDIR/.." >/dev/null; pwd`

# 停止运行tomcat
$CATALINA_HOME/bin/shutdown.sh>/dev/null 2>&1

#
# 如果 shutdown.sh 结束不了，在通过kill结束tomcat
# 获取tomcat进程并结束进程
#
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
