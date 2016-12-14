
--Oracle函数
--取绝对值
SELECT abs(100) a, abs(-100) b FROM dual;  --返回100,100
--返回正负值,如果是正数返回1,负数返回-1,0直接返回0
SELECT sign(100),sign(-100),sign(0) FROM dual;   --返回1,-1,0
--返回比该小数大的最小整数
SELECT ceil(3.1) , ceil(2.9+1.2),ceil(0) FROM dual; --返回4,5,0
--返回比改小数小的最大整数
SELECT floor(3.1),floor(2.9+1.2),floor(0) FROM dual;  --返回3,4,0
--返回ascii码值
SELECT ascii('A') A,ascii('a') a,ascii(' ') space, ascii('滨') bin FROM dual;
--将ASCII 码转换为字符
select chr(15121320) bin,chr(65) chr65 from dual; --返回 滨,A
--连接两个字符串 可以用concat或者||
SELECT concat('0774-','1234567') || '转11' telphone FROM dual; --返回 0774-1234567转11
--将字符串的每个单词第一个字母变为大写，其它字母小写;
SELECT initcap('wolf liao bIN') upp FROM dual;  --return Wolf Liao Bin
select nls_initcap('ab cde') "test",nls_initcap('a c b d e','NLS_LANGUAGE=AMERICAN') "test1" from dual;
--将字符串全部转为小写
SELECT lower('aSDFWeWERSF') FROM dual;
--在一个字符串中搜索指定的字符,返回发现指定的字符的位置;INSTR-->多字节符(汉字、全角符等)，按1个字符计算,INSTRB-->多字节符(汉字、全角符等)，按3个字符计算
select instr('深圳一手活','手',1,1) instr,instrb('深圳一手活','手',1,1) instrb from dual;
--字符串的长度;LENGTH-->多字节符(汉字、全角符等)，按1个字符计算,LENGTHB-->多字节符(汉字、全角符等)，按3个字符计算
select length('廖滨'),lengthB('廖滨') from dual;
--LPAD(c1,n[,c2]) 在字符串c1的左边用字符串c2填充，直到长度为n时为止
SELECT lpad(22,6,0) from dual;
--RPAD(c1,n[,c2]) 在字符串c1的右边用字符串c2填充，直到长度为n时为止
SELECT rpad('bin',6,'o') FROM dual;
--LTRIM(c1,[,c2])删除左边出现的字符串
SELECT ltrim('xxwolfbin','xx') text FROM dual;
--RTRIM(c1,[,c2]) 删除右边出现的字符串
SELECT rtrim('wolfbinxx','xx') text from dual;
--REPLACE(c1,c2[,c3]) 将字符表达式值中，部分相同字符串，替换成新的字符串
SELECT replace('this is fucking you','this','there') text from dual;
--SUBSTR(c1,n1[,n2])取子字符串
SELECT substr('123456789',2,5) FROM dual;
--TRIM(c1 from c2) 删除左边和右边出现的字符串,C2 删除前字符串 c1 删除字符串,默认为空格
SELECT trim('x' from 'xxxwolf binxx') text from dual;
--sysdate 返回当前日期
SELECT sysdate data from dual;
--add_months(d1,n1)
--【功能】：返回在日期d1基础上再加n1个月后新的日期。
SELECT sysdate,add_months(sysdate,2) FROM dual;
/**
last_day(d1)
【功能】：返回日期d1所在月份最后一天的日期。
 */
SELECT sysdate , last_day(sysdate) FROM dual;
/*
months_between(d1,d2)
【功能】：返回日期d1到日期d2之间的月数。
 */
SELECT sysdate , months_between(sysdate,to_date('2015-09-06','YYYY-MM-DD')) FROM dual;
/*
round(d1[,c1])
【功能】：给出日期d1按期间(参数c1)四舍五入后的期间的第一天日期（与数值四舍五入意思相近）
【参数】：d1日期型,c1为字符型(参数)，c1默认为j（即最近0点日期)
【参数表】：c1对应的参数表:
最近0点日期: 取消参数c1或j
最近的星期日：day或dy或d
最近月初日期：month或mon或mm或rm
最近季日期：q
最近年初日期：syear或year或yyyy或yyy或yy或y(多个y表示精度)
最近世纪初日期：cc或scc
 */
select sysdate 当时日期,
round(sysdate) 最近0点日期,
round(sysdate,'day') 最近星期日,
round(sysdate,'month') 最近月初,
round(sysdate,'q') 最近季初日期,
round(sysdate,'year') 最近年初日期,
round(sysdate,'cc') 最近世纪初日期 from dual;
/*
trunc(d1[,c1])
【功能】：返回日期d1所在期间(参数c1)的第一天日期
【参数】：d1日期型,c1为字符型(参数)，c1默认为j（即当前日期)
【参数表】：c1对应的参数表:
最近0点日期: 取消参数c1或j
最近的星期日：day或dy或d (每周顺序：日，一，二，三，四，五，六）
最近月初日期：month或mon或mm或rm
最近季日期：q
最近年初日期：syear或year或yyyy或yyy或yy或y(多个y表示精度)
最近世纪初日期：cc或scc
 */
select sysdate 当时日期,
trunc(sysdate) 今天日期,
trunc(sysdate,'day') 本周星期日,
trunc(sysdate,'month') 本月初,
trunc(sysdate,'q') 本季初日期,
trunc(sysdate,'year') 本年初日期 from dual;
/*
next_day(d1[,c1])
【功能】：返回日期d1在下周，星期几(参数c1)的日期
【参数】：d1日期型,c1为字符型(参数)，c1默认为j（即当前日期)
【参数表】：c1对应:星期一，星期二，星期三……星期日
【返回】：日期
 */
select sysdate 当时日期,
next_day(sysdate,'星期一') 下周星期一,
next_day(sysdate,'星期二') 下周星期二,
next_day(sysdate,'星期三') 下周星期三,
next_day(sysdate,'星期四') 下周星期四,
next_day(sysdate,'星期五') 下周星期五,
next_day(sysdate,'星期六') 下周星期六,
next_day(sysdate,'星期日') 下周星期日 from dual;

/*
extract(c1 from d1)
【功能】：日期/时间d1中，参数(c1)的值
【参数】：d1日期型(date)/日期时间型(timestamp),c1为字符型(参数)
【参数表】：c1对应的参数表详见示例
 */
select sysdate 当前日期,
extract(hour from cast(sysdate as timestamp)) 小时,
extract(DAY from  sysdate ) 日,
extract(MONTH from sysdate ) 月,
extract(YEAR from sysdate ) 年
 from dual;

select localtimestamp from dual;
select current_timestamp from dual;
select current_date from dual;
select dbtimezone from dual;
/*
INTERVAL c1 set1
【功能】：变动日期时间数值
【参数】：c1为数字字符串或日期时间字符串，set1为日期参数
【参数表】：set1具体参照示例
 */
select
trunc(sysdate)+(interval '1' second), --加1秒(1/24/60/60)
trunc(sysdate)+(interval '1' minute), --加1分钟(1/24/60)
trunc(sysdate)+(interval '1' hour), --加1小时(1/24)
trunc(sysdate)+(INTERVAL '1' DAY),  --加1天(1)
trunc(sysdate)+(INTERVAL '1' MONTH), --加1月
trunc(sysdate)+(INTERVAL '1' YEAR), --加1年
trunc(sysdate)+(interval '01:02:03' hour to second), --加指定小时到秒
trunc(sysdate)+(interval '01:02' minute to second), --加指定分钟到秒
trunc(sysdate)+(interval '01:02' hour to minute), --加指定小时到分钟
trunc(sysdate)+(interval '2 01:02' day to minute) --加指定天数到分钟
from dual;

SELECT ROWIDTOCHAR(rowid) FROM DUAL;

SELECT rowid FROM dual;

select HEXTORAW(11)  from dual;

select to_date('199912','yyyymm'),
to_date('2000.05.20','yyyy.mm.dd'),
(date '2008-12-31') XXdate,
to_date('2008-12-31 12:31:30','yyyy-mm-dd hh24:mi:ss'),
(timestamp '2008-12-31 12:31:30') XXtimestamp
from dual;

select TO_NUMBER('199912'),TO_NUMBER('450.05') from dual;

SELECT greatest(10,32,'123','2006') FROM dual;
 SELECT greatest('kdnf','dfd','a','206') FROM dual;

SELECT user,uid from dual;

SELECT rownum from dual;

select sys_guid() from  dual;

