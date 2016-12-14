#Appendable 接口
能够被添加 char 序列和值的对象。如果某个类的实例打算接收取自 Formatter 的格式化输出，那么该类必须实现 Appendable 接口。
Appendable 对于多线程访问而言没必要是安全的。线程安全由扩展和实现此接口的类负责。
Appendable	append(char c)  //向此 Appendable 添加指定字符。
Appendable	append(CharSequence csq) //向此 Appendable 添加指定的字符序列。
Appendable	append(CharSequence csq, int start, int end) //向此 Appendable 添加指定字符序列的子序列。

#所有已知实现类：
BufferedWriter, CharArrayWriter, CharBuffer, FileWriter, FilterWriter, LogStream, 
OutputStreamWriter, PipedWriter, PrintStream, PrintWriter, StringBuffer, StringBuilder,
StringWriter, Writer
