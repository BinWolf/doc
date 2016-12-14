以下是把项目提交到github上的步骤：

1、在自己的github（https://github.com/BinWolf）创建一个repository

2、进入需要git管理的目录中初始化该目录为git管理目录
	git init

3、为本地已经是git管理目录添加远程的仓库
	git remote add origin https://github.com/BinWolf/xxx.git

4、更新远程仓库的文件到本地
	git pull https://github.com/BinWolf/xxx.git

5、把需要git管理的文件添加到暂存区（添加跟踪）
	git add filename

6、提交暂存区的文件到远程repository
	git commit -m '注释'

7、把提交的更新推送到远程repository的上游
	git push 