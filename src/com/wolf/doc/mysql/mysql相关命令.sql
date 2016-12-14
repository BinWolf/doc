mysql相关命令：
--链接客户端
mysql -h host -u user -p

--退出
mysql> QUIT

--查看数据库
mysql> SHOW DATABASES;

--选择需要操作的数据库，只有选择了数据库才能进行操作
mysql> USE mysql

--创建数据库
mysql> CREATE DATABASE userdb;

--查看当前数据库的表
mysql> SHOW TABLES;

--查看表结构
describe t_test_user;

--删除数据
delete from t_test_user where id='id000001';

--添加主键
alter table t_test_user add constraint PK_user_id primary key t_test_user(id)；

--删除表
drop table t_test_user;