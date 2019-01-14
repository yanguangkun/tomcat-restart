# tomcat 重启脚本
> 先用 shutdown.sh 结束tomcat，如果结束不了，再通过kill结束tomcat,然后调用tomcat启动脚本。

- 重启tomcat
```
[ebs@localhost bin]$ ./restart.sh
```

- 停止tomcat
```
[ebs@localhost bin]$ ./restart.sh stop
```

- restart.sh 脚本添加运行权限
```
[ebs@localhost bin]$ chmod +x ./restart.sh
```
