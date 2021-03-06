#Log4j详细讲解
#简介
Log4j由三个重要的组件构成：日志信息的优先级，日志信息的输出目的地，日志信息的输出格式。日志信息的优先级从高到低有ERROR、WARN、INFO、DEBUG，分别用来指定这条日志信息的重要程度；日志信息的输出目的地指定了日志将打印到控制台还是文件中；而输出格式则控制了日志信息的显示内容。
配置文件
其实也可以完全不使用配置文件，而是在代码中配置Log4j环境。但是，使用配置文件将使您的应用程序更加灵活。
Log4j支持两种配置文件格式，一种是XML格式的文件，一种是properties格式的文件。以下介绍使用properties格式做为配置文件的方法：
基本的格式如下：
#配置根Logger
log4j.rootLogger  =   [ level ]   ,  appenderName1 ,  appenderName2 ,  …
#配置日志信息输出目的地Appender
log4j.appender.appenderName  =  fully.qualified.name.of.appender.class 
　　log4j.appender.appenderName.option1  =  value1 
　　…
　　log4j.appender.appenderName.optionN  =  valueN 
#配置日志信息的格式（布局）
log4j.appender.appenderName.layout  =  fully.qualified.name.of.layout.class 
　　log4j.appender.appenderName.layout.option1  =  value1 
　　…
　　log4j.appender.appenderName.layout.optionN  =  valueN
1.配置根Logger
语法为：
log4j.rootLogger = [ level ] , appenderName, appenderName, …  
其中，level 是日志记录的优先级，分为OFF、FATAL、ERROR、WARN、INFO、DEBUG、ALL或者你定义的级别。Log4j建议只使用四个级别，优先级从高到低分别是ERROR、WARN、INFO、DEBUG。通过在这里定义的级别，您可以控制到应用程序中相应级别的日志信息的开关。比如在这里定义了INFO级别，则应用程序中所有DEBUG级别的日志信息将不被打印出来。
appenderName就是指定日志信息输出到哪个地方。您可以同时指定多个输出目的地。
2.配置日志信息输出目的地Appender
Log4j提供的appender有以下几种：
org.apache.log4j.ConsoleAppender（控制台），
org.apache.log4j.FileAppender（文件），
org.apache.log4j.DailyRollingFileAppender（每天产生一个日志文件），
org.apache.log4j.RollingFileAppender（文件大小到达指定尺寸的时候产生一个新的文件），
org.apache.log4j.WriterAppender（将日志信息以流格式发送到任意指定的地方）
其中，每种appender可以定义的option1如下：
(1).ConsoleAppender 选项
Threshold=WARN:指定日志消息的输出最低层次。
ImmediateFlush=true:默认值是true,意谓着所有的消息都会被立即输出。
Target=System.err:默认情况下是：System.out,指定输出控制台
(2).FileAppender 选项
Threshold=WARN:指定日志消息的输出最低层次。
ImmediateFlush=true:默认值是true,意谓着所有的消息都会被立即输出。
File=mylog.txt:指定消息输出到mylog.txt文件。
Append=false:默认值是true,即将消息增加到指定文件中，false指将消息覆盖指定的文件内容。
(3).DailyRollingFileAppender 选项
Threshold=WARN:指定日志消息的输出最低层次。
ImmediateFlush=true:默认值是true,意谓着所有的消息都会被立即输出。
File=mylog.txt:指定消息输出到mylog.txt文件。
Append=false:默认值是true,即将消息增加到指定文件中，false指将消息覆盖指定的文件内容。
DatePattern='.'yyyy-ww:每周滚动一次文件，即每周产生一个新的文件。当然也可以指定按月、周、天、时和分。即对应的格式如下：
yyyy-MM: 每月
yyyy-ww: 每周
yyyy-MM-dd: 每天
yyyy-MM-dd-a: 每天两次
yyyy-MM-dd-HH: 每小时
yyyy-MM-dd-HH-mm: 每分钟
(4).RollingFileAppender 选项
Threshold=WARN:指定日志消息的输出最低层次。
ImmediateFlush=true:默认值是true,意谓着所有的消息都会被立即输出。
File=mylog.txt:指定消息输出到mylog.txt文件。
Append=false:默认值是true,即将消息增加到指定文件中，false指将消息覆盖指定的文件内容。
MaxFileSize=100KB: 后缀可以是KB, MB 或者是 GB. 在日志文件到达该大小时，将会自动滚动，即将原来的内容移到mylog.log.1文件。
MaxBackupIndex=2:指定可以产生的滚动文件的最大数。
3.配置日志信息的输出格式
Log4j提供的layout有以下几种：
org.apache.log4j.HTMLLayout（以HTML表格形式布局），
org.apache.log4j.PatternLayout（可以灵活地指定布局模式），
org.apache.log4j.SimpleLayout（包含日志信息的级别和信息字符串），
org.apache.log4j.TTCCLayout（包含日志产生的时间、线程、类别等等信息）
4.输出格式设置
在配置文件中可以通过log4j.appender.A1.layout.ConversionPattern设置日志输出格式。
参数：
%p: 输出日志信息优先级，即DEBUG，INFO，WARN，ERROR，FATAL,
%d: 输出日志时间点的日期或时间，默认格式为ISO8601，也可以在其后指定格式，比如：%d{yyy MMM dd HH:mm:ss,SSS}，输出类似：2002年10月18日 22：10：28，921
%r: 输出自应用启动到输出该log信息耗费的毫秒数
%c: 输出日志信息所属的类目，通常就是所在类的全名
%t: 输出产生该日志事件的线程名
%l: 输出日志事件的发生位置，相当于%C.%M(%F:%L)的组合,包括类目名、发生的线程，以及在代码中的行数。举例：Testlog4.main(TestLog4.java:10)
%x: 输出和当前线程相关联的NDC(嵌套诊断环境),尤其用到像java servlets这样的多客户多线程的应用中。
%%: 输出一个”%”字符
%F: 输出日志消息产生时所在的文件名称
%L: 输出代码中的行号
%m: 输出代码中指定的消息,产生的日志具体信息
%n: 输出一个回车换行符，Windows平台为”\r\n”，Unix平台为”\n”输出日志信息换行
可以在%与模式字符之间加上修饰符来控制其最小宽度、最大宽度、和文本的对齐方式。如：
%20c：指定输出category的名称，最小的宽度是20，如果category的名称小于20的话，默认的情况下右对齐。
%-20c:指定输出category的名称，最小的宽度是20，如果category的名称小于20的话，”-”号指定左对齐。
%.30c:指定输出category的名称，最大的宽度是30，如果category的名称大于30的话，就会将左边多出的字符截掉，但小于30的话也不会有空格。
%20.30c:如果category的名称小于20就补空格，并且右对齐，如果其名称长于30字符，就从左边交远销出的字符截掉。
在程序中的使用
在程序中使用Log4j之前，首先要将commons-logging.jar和logging-log4j-1.2.9.jar导入到classpath中，并将log4j.properties放于src根目录中。接下来就可以使用了。
1.得到记录器
使用Log4j，第一步就是获取日志记录器，这个记录器将负责控制日志信息。其语法为：
public static Logger getLogger(String name); 
通过指定的名字获得记录器，如果必要的话，则为这个名字创建一个新的记录器。Name一般取本类的名字，比如：
static Logger logger = Logger.getLogger ( ClassName.class.getName () ) ; 
注：推荐使用commons-logging结合log4j进行日志记录。
private static Log logger = LogFactory.getLog(Yourclass.class); 
2.插入记录信息（格式化日志信息）
当上两个必要步骤执行完毕，您就可以轻松地使用不同优先级别的日志记录语句插入到您想记录日志的任何地方，其语法如下：
Logger.debug ( Object message ) ;
Logger.info ( Object message ) ;
Logger.warn ( Object message ) ;
Logger.error ( Object message ) ;
Log4j配置范例
LOG4J的配置之简单使它遍及于越来越多的应用中了：Log4J配置文件实现了输出到控制台、文件、回滚文件、发送日志邮件、输出到数据库日志表、自定义标签等全套功能。择其一二使用就够用了。
log4j.rootLogger=DEBUG,CONSOLE,file,ROLLING_FILE,SOCKET,MAIL,DATABASE,im
# 应用于控制台
log4j.appender.CONSOLE=org.apache.log4j.ConsoleAppender
log4j.appender.Threshold=DEBUG
log4j.appender.CONSOLE.Target=System.out
log4j.appender.CONSOLE.layout=org.apache.log4j.PatternLayout
log4j.appender.CONSOLE.layout.ConversionPattern=[framework] %d - %c -%-4r [%t] %-5p %c %x - %m%n
#log4j.appender.CONSOLE.layout.ConversionPattern=[start]%d{DATE}[DATE]%n%p[PRIORITY]%n%x[NDC]%n%t[thread] n%c[CATEGORY]%n%m[MESSAGE]%n%n
#应用于文件
log4j.appender.file=org.apache.log4j.DailyRollingFileAppender
log4j.appender.file.DatePattern='.'yyyy-MM-dd
log4j.appender.file.File=/logs/ecps.log
log4j.appender.file.layout=org.apache.log4j.PatternLayout 
log4j.appender.file.layout.ConversionPattern=%-d{yyyy-MM-dd HH:mm:ss} %p [%c]: %m%n
# 应用于文件回滚
log4j.appender.ROLLING_FILE=org.apache.log4j.RollingFileAppender
log4j.appender.ROLLING_FILE.Threshold=ERROR
log4j.appender.ROLLING_FILE.File=rolling.log //文件位置,也可以用变量${java.home}、rolling.log
log4j.appender.ROLLING_FILE.Append=true //true:添加 false:覆盖
log4j.appender.ROLLING_FILE.MaxFileSize=10KB //文件最大尺寸
log4j.appender.ROLLING_FILE.MaxBackupIndex=1 //备份数
log4j.appender.ROLLING_FILE.layout=org.apache.log4j.PatternLayout
log4j.appender.ROLLING_FILE.layout.ConversionPattern=[framework] %d - %c -%-4r [%t] %-5p %c %x - %m%n
#应用于socket
log4j.appender.SOCKET=org.apache.log4j.RollingFileAppender
log4j.appender.SOCKET.RemoteHost=localhost
log4j.appender.SOCKET.Port=5001
log4j.appender.SOCKET.LocationInfo=true
# Set up for Log Facter 5
log4j.appender.SOCKET.layout=org.apache.log4j.PatternLayout
log4j.appender.SOCET.layout.ConversionPattern=[start]%d{DATE}[DATE]%n%p[PRIORITY]%n%x[NDC]%n%t[thread]%n%c[CATEGORY]%n%m[MESSAGE]%n%n
# Log Factor 5 Appender
log4j.appender.LF5_APPENDER=org.apache.log4j.lf5.LF5Appender
log4j.appender.LF5_APPENDER.MaxNumberOfRecords=2000
# 发送日志给邮件
log4j.appender.MAIL=org.apache.log4j.net.SMTPAppender
log4j.appender.MAIL.Threshold=ERROR
log4j.appender.MAIL.BufferSize=10
log4j.appender.MAIL.From=123@qq.com
log4j.appender.MAIL.SMTPHost=smtp.qq.com
log4j.appender.MAIL.SMTPUsername=123
log4j.appender.MAIL.SMTPPassword=***
log4j.appender.MAIL.SMTPDebug=false
log4j.appender.MAIL.Subject=Log4JErrorMessage
log4j.appender.MAIL.To=123@qq.com
log4j.appender.MAIL.layout=org.apache.log4j.PatternLayout
log4j.appender.MAIL.layout.ConversionPattern=%-d{yyyy-MM-dd HH:mm:ss} [%t] %-5p %c %x -- %m%n
# 用于数据库
log4j.appender.DATABASE=org.apache.log4j.jdbc.JDBCAppender
log4j.appender.DATABASE.URL=jdbc:mysql://localhost:3306/test
log4j.appender.DATABASE.driver=com.mysql.jdbc.Driver
log4j.appender.DATABASE.user=root
log4j.appender.DATABASE.password=
log4j.appender.DATABASE.sql=INSERT INTO LOG4J (Message) VALUES (’[framework] %d - %c -%-4r [%t] %-5p %c %x - %m%n’)
log4j.appender.DATABASE.layout=org.apache.log4j.PatternLayout
log4j.appender.DATABASE.layout.ConversionPattern=[framework] %d - %c -%-4r [%t] %-5p %c %x - %m%n
#自定义Appender
log4j.appender.im = net.cybercorlin.util.logger.appender.IMAppender
log4j.appender.im.host = mail.cybercorlin.net
log4j.appender.im.username = username
log4j.appender.im.password = password
log4j.appender.im.recipient = corlin@cybercorlin.net
log4j.appender.im.layout=org.apache.log4j.PatternLayout
log4j.appender.im.layout.ConversionPattern =[framework] %d - %c -%-4r [%t] %-5p %c %x - %m%n
设置仅输出指定类的日志
本人在使用HtmlUnit组件的时候，这个组件输出的各种日志刷屏得那叫一个酸爽。即便在使用它提供的一些API禁掉了一些日志输出，但还是会输出很多无用的日志信息。
那么我们怎么能够限制只让指定的类才有资格输出日志呢？方法如下：
首先你可以去掉log4j.rootLogger，使所有日志不在输出。
然后再指定类输出。
注：如果设置了日志输出log4j.rootLogger，并且后面设置了指定类输出，则对于指定类的输出配置会覆盖总的配置。举个栗子：总配置设置优先级为INFO，但是某个类具体设置为WARN，那么最后这个类输出优先级为WARN。
#log4j.rootLogger=INFO, stdout, logfile
log4j.logger.org.cyberneko.html.parsers=Fatal
log4j.logger.org.apache.http=Fatal

log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.Target=System.out
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern=%d{ABSOLUTE} %5p %c{1}:%L - %m%n

log4j.appender.logfile=org.apache.log4j.DailyRollingFileAppender
log4j.appender.logfile.File=./your.log
log4j.appender.logfile.DatePattern='.'yyyy-MM-dd
log4j.appender.logfile.Append=true
log4j.appender.logfile.layout=org.apache.log4j.PatternLayout
log4j.appender.logfile.layout.ConversionPattern=%d [%t] %-5p %c %x -- %m%n
#assign class out put log.
log4j.logger.com.ltw.yourclass1=INFO,stdout,logfile
log4j.logger.com.ltw.yourclass2=INFO,stdout,logfile

使用Log4J监控系统日志邮件警报
在系统上线后，有时候遇到系统故障，这时候就可以登录服务器查看系统日志来排查问题。但是需要登录服务器，下载查找相关异常日志比较麻烦。而且没有监控的话，也无法实时了解到系统是否正常运行。那么有没有一种好办法将系统异常信息实时反馈给相关人员呢？
下面讲的就是借助Log4J来记录程序运行日志，当一旦发现系统异常或者自己定义的其他一些情况发生时，及时通过邮件形式发送给相关负责人，并附上相关的系统日志信息，这样负责人就可以实时便捷的监控到系统的状态和相关异常信息。
优点
采用这种方式的优点有：
实时性。不用定期或不定期的登陆系统查看是否正常运行。
及时性。一旦系统异常，就会通知。
便捷性。邮件里附上异常日志，不用登陆系统下载日志查看。
环境
导入依赖jar包：
1.log4j-1.2.17.jar
官网下载地址
目前log4j最新版是1.2.17。低版本的log4j无法实现邮件发送功能，因为版本低于log4j-1.2.14.jar的不支持SMTP认证。
发送邮件的一个重要的类是SMTPAppender，在1.2.8的版本中，SMTPAppender没有SMTPUsername和SMTPPassword属性。这两个属性分别是登录SMTP服务器发送认证的用户名和密码。
2.mail-1.4.jar
发送邮件当然需要用到JavaMail包啦。
3.activation-1.1.jar
配置
配置log4j.properties文件，如下：
log4j.rootLogger=DEBUG, MAIL 
log4j.appender.MAIL=org.apache.log4j.net.SMTPAppender
log4j.appender.MAIL.Threshold=ERROR
log4j.appender.MAIL.BufferSize=10
log4j.appender.MAIL.From=123@qq.com
log4j.appender.MAIL.SMTPHost=smtp.qq.com
log4j.appender.MAIL.SMTPUsername=123
log4j.appender.MAIL.SMTPPassword=***
log4j.appender.MAIL.SMTPDebug=false
log4j.appender.MAIL.Subject=Log4JErrorMessage
log4j.appender.MAIL.To=123@qq.com
log4j.appender.MAIL.layout=org.apache.log4j.PatternLayout
log4j.appender.MAIL.layout.ConversionPattern=%-d{yyyy-MM-dd HH:mm:ss} [%t] %-5p %c %x -- %m%n
每行配置详解：
3.log4j的邮件发送appender，如果有必要你可以写自己的appender。
4.发送邮件的门槛，仅当等于或高于ERROR级别时，邮件才被发送。
5.缓存文件大小，日志达到10k时发送Email。
6.发送邮件的邮箱帐号。
7.SMTP邮件发送服务器地址。
8.SMTP发送认证的帐号名。
9.SMTP发送认证帐号的密码。
10.是否打印调试信息，如果选true，则会输出和SMTP之间的握手等详细信息
11.邮件主题。
12.发送到什么邮箱，如果要发送给多个邮箱，则用逗号分隔。
如果需要抄送给某人，则添加如下配置：
log4j.appender.MAIL.Bcc=xxx@xxx.xxx 
想让邮件内容日志以HTML格式来输出，则配置：
log4j.appender.MAIL.layout=org.apache.log4j.HTMLLayout 