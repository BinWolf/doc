#以下是netstat的常用的操作命令
1. 列出所有当前的连接(tcp, udp 和 unix 协议下所有套接字的所有连接)
    #netstat -a 
   
2. 列出 TCP 协议的连接
    #netstat -at

3. 列出 UDP 协议的连接
    #netstat -au
    
4. 禁用反向域名解析，加快查询速度
    默认情况下 netstat 会通过反向域名解析技术查找每个 IP 地址对应的主机名。这会降低查找速度。
    如果你觉得 IP 地址已经足够，而没有必要知道主机名，就使用 -n 选项禁用域名解析功能。
    #netstat -tnl
    
5. 获取进程名、进程号以及用户 ID
    #sudo netstat -nlpt
    使用 -p 选项时，netstat 必须运行在 root 权限之下，不然它就不能得到运行在 root 权限下的进程名，而很多服务包括 http 和 ftp 都运行在 root 权限之下。
    
6. 查看进程的拥有者
    #sudo netstat -ltpe
    注意 - 假如将 -n 和 -e 选项一起使用，User 列的属性就是用户的 ID 号，而不是用户名。
    
7. 打印统计数据
    #netstat -s
    如果想只打印出 TCP 或 UDP 协议的统计数据，只要加上对应的选项（-t 和 -u）即可.
    
8. 显示内核路由信息
    #netstat -rn
    
9. 打印网络接口
    #netstat -i 或者 #netstat -ie
    上面的输出信息与 ifconfig 输出的信息一样
    
10. netstat 持续输出
    #netstat -ct
    
11. 查看服务是否在运行
    #sudo netstat -aple | grep ntp