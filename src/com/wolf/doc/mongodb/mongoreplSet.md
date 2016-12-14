#首先建立三个数据目录和日志目录：
1.    cd /usr/local/mongodb-2.4.1/data/
2.    mkdir -p rs0-0 rs0-1 rs0-2
3.    cd /usr/local/mongodb-2.4.1/log/
4.    mkdir -p rs0-0 rs0-1 rs0-2

#然后我们以守护进程的方式启动三个mongod进程,端口分别是37017,37018和37019:
1.    ./bin/mongod --fork --dbpath data/rs0-0/ --logpath log/rs0-0/rs0-0.log --rest --replSet rs0 --port 37017 --smallfilse
2.    ./bin/mongod --fork --dbpath data/rs0-1/ --logpath log/rs0-1/rs0-1.log --rest --replSet rs0 --port 37018 --smallfilse
3.    ./bin/mongod --fork --dbpath data/rs0-2/ --logpath log/rs0-2/rs0-2.log --rest --replSet rs0 --port 37019 --smallfilse

#然后我们用mongo shell连上端口为37017的mongod:
1.    ./bin/mongo -port 37017
2.    use admin

#接着我们需要初始化一个Replica Set:首先创建一个副本集配置对象:
    rsconf={
        "_id" : "rs0",
        "members" : [
            {
                "_id" : 0,
                "host" : "127.0.0.1:37017"
            }
        ]
    }

#然后用rs.initiate()进程初始化：
    rs.initiate(rsconf)

#通过rs.add()将另外两个mongod添加到副本集当中：
    rs0:PRIMARY> rs.add("127.0.0.1:37018")
    rs0:PRIMARY> rs.add("127.0.0.1:37019")

#会发现37017这个mongod默认就是PRIMARY节点了。通过rs.conf()可以查看集群的配置情况：
    rs0:PRIMARY> rs.conf()
    {
        "_id" : "rs0",
        "version" : 3,
        "members" : [
            {
                "_id" : 0,
                "host" : "127.0.0.1:37017"
            },
            {
                "_id" : 1,
                "host" : "127.0.0.1:37018"
            },
            {
                "_id" : 2,
                "host" : "192.168.1.174:37019"
            }
        ]
    }

#添加仲裁者：
#首先需要启动一个作为arbiter的mongod进程,端口40000,虽然arbiter不持有数据但是仍然需要数据目录来保存一些配置信息：
1.    mkdir -p data/rs0-arb
2.    mkdir -p log/rs0-arb
3.    ./bin/mongod --fork --dbpath data/rs0-arb/ --logpath log/rs0-arb/rs0-arb.log --rest --replSet rs0 --port 40000

#然后进入primary节点执行下面命令添加arbiter：
rs0:PRIMARY> rs.addArb("127.0.0.1:40000")
rs0:PRIMARY> rs.conf()


.\bin\mongod.exe --dbpath data\rs0-1\ --logpath log\rs0-1\rs0-1.log --rest --replSet rs0 --port 37018
.\bin\mongod.exe --dbpath data\rs0-arb\ --logpath log\rs0-arb\rs0-arb.log --rest --replSet rs0 --port 40000

