#!/bin/bash

mkdir echo
cd echo
# 操作系统基本信息
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>systeminfo.html
echo "<h3>操作系统信息</h3>" >>systeminfo.html
echo "<xmp>" >>systeminfo.html
uname -a >>systeminfo.html
echo "</xmp>" >>systeminfo.html
echo "<h3>网络接口信息</h3>" >>systeminfo.html
echo "<xmp>" >>systeminfo.html
ifconfig >>systeminfo.html
echo "</xmp>" >>systeminfo.html

#检查账号安全
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>usercheck.html
echo "<h3>文件说明</h3>" >>usercheck.html
echo "/etc/passwd" >>usercheck.html
echo "<xmp>" >>usercheck.html
echo "root:x:0:0:root:/root:/bin/bash
用户名：密码：用户ID：组ID：用户说明：家目录：登陆之后shell
无密码只允许本机登陆，远程不允许登陆。" >>usercheck.html
echo "</xmp>" >>usercheck.html

echo "/etc/shadow" >>usercheck.html
echo "<xmp>" >>usercheck.html
echo "root:$6$oGs1PqhL2p3ZetrE:16809:0:99999:7:::
用户名：加密密码：密码最后一次修改日期：两次密码的修改时间间隔：密码有效期：密码修改到期到的警告天数：密码过期之后的宽限天数：账号失效时间：保留" >>usercheck.html
echo "</xmp>" >>usercheck.html

echo "<br><br><h3>检查管理员权限的账号</h3>" >>usercheck.html
echo "检查命令：awk -F: '{if($3==0)print $1}' /etc/passwd" >>usercheck.html
echo "<br><br>" >>usercheck.html
echo "检查结果：" >>usercheck.html
echo "<xmp>" >>usercheck.html
awk -F: '{if($3==0)print $1}' /etc/passwd >>usercheck.html
echo "</xmp>" >>usercheck.html

echo "<br><br><h3>检查可远程登录的帐号</h3>" >>usercheck.html
echo "检查命令：awk '/\$1|\$6/{print $1}' /etc/shadow" >>usercheck.html
echo "<br><br>" >>usercheck.html
echo "检查结果：" >>usercheck.html
echo "<xmp>" >>usercheck.html
awk '/\$1|\$6/{print $1}' /etc/shadow >>usercheck.html
echo "</xmp>" >>usercheck.html

echo "<br><br><h3>检查sudo权限的帐号</h3>" >>usercheck.html
echo "检查命令：more /etc/sudoers | grep -v '^#|^$' | grep 'ALL=(ALL)'"  >>usercheck.html
echo "<br><br>" >>usercheck.html
echo "检查结果：" >>usercheck.html
echo "<xmp>" >>usercheck.html
more /etc/sudoers | grep -v '^#|^$' | grep 'ALL=(ALL)'  >>usercheck.html
echo "</xmp>" >>usercheck.html

echo "<br><br><h3>/etc/passwd</h3>" >>usercheck.html
echo "<xmp>" >>usercheck.html
cat /etc/passwd >>usercheck.html
echo "</xmp>" >>usercheck.html

echo "<br><br><h3>/etc/passwd</h3>" >>usercheck.html
echo "<xmp>" >>usercheck.html
cat /etc/shadow >>usercheck.html
echo "</xmp>" >>usercheck.html

# 网络连接信息
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>networkcheck.html
echo "<h3>检查网络连接</h3>" >>networkcheck.html
echo "检查命令：netstat -antup" >>networkcheck.html
echo "<br><br>" >>networkcheck.html
echo "检查结果：" >>networkcheck.html
echo "<xmp>" >>networkcheck.html
netstat -antup >>networkcheck.html
echo "</xmp>" >>networkcheck.html

echo "<br><br><h3>检查对外的网络连接</h3>" >>networkcheck.html
echo "检查命令：netstat -antp|grep ESTABLISHED|awk '{print $5" "$7}'|grep -v '192.168\|0.0.0.0\|127.0.0.1\|:::'" >>networkcheck.html
echo "<br><br>" >>networkcheck.html
echo "检查结果：" >>networkcheck.html
echo "<xmp>" >>networkcheck.html
netstat -antp|grep ESTABLISHED|awk '{print $5" "$7}'|grep -v '192.168\|0.0.0.0\|127.0.0.1\|:::' >>networkcheck.html
echo "</xmp>" >>networkcheck.html

# 进程信息
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>pscheck.html
echo "<h3>说明</h3>" >>pscheck.html
echo "<xmp>" >>pscheck.html
echo "查看进程详情：
ps -aux
查看单个进程详情：
ps aux | grep pid
查看下pid所对应的进程文件路径：
ls -l /proc/$PID/exe
file /proc/$PID/exe" >>pscheck.html
echo "</xmp>" >>pscheck.html

echo "<h3>系统进程</h3>" >>pscheck.html
echo "检查命令：ps -aux" >>pscheck.html
echo "<br><br>" >>pscheck.html
echo "检查结果：" >>pscheck.html
echo "<xmp>" >>pscheck.html
ps -aux >>pscheck.html
echo "</xmp>" >>pscheck.html

echo "<h3>系统进程树</h3>" >>pscheck.html
echo "检查命令：pstree -apnh" >>pscheck.html
echo "<br><br>" >>pscheck.html
echo "检查结果：" >>pscheck.html
echo "<xmp>" >>pscheck.html
pstree -apnh >>pscheck.html
echo "</xmp>" >>pscheck.html

echo "<h3>TOP</h3>" >>pscheck.html
echo "检查命令：top -n 1|tail -n +8|awk '{print $2" "$3" "$13}'" >>pscheck.html
echo "<br><br>" >>pscheck.html
echo "检查结果：" >>pscheck.html
echo "<xmp>" >>pscheck.html
top -n 1|tail -n +8|awk '{print $2" "$3" "$13}' >>pscheck.html
echo "</xmp>" >>pscheck.html

echo "<h3>系统进程CPU占有率降序排列</h3>" >>pscheck.html
echo "检查命令：ps aux | grep -v ^'USER' | sort -rn -k3" >>pscheck.html
echo "<br><br>" >>pscheck.html
echo "检查结果：" >>pscheck.html
echo "<xmp>" >>pscheck.html
ps aux | grep -v ^'USER' | sort -rn -k3 >>pscheck.html
echo "</xmp>" >>pscheck.html

echo "<h3>系统进程内存占有率降序排列</h3>" >>pscheck.html
echo "检查命令：ps aux | grep -v ^'USER' | sort -rn -k4" >>pscheck.html
echo "<br><br>" >>pscheck.html
echo "检查结果：" >>pscheck.html
echo "<xmp>" >>pscheck.html
ps aux | grep -v ^'USER' | sort -rn -k4 >>pscheck.html
echo "</xmp>" >>pscheck.html


# 异常文件信息
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>filecheck.html
echo "<h3>说明</h3>" >>filecheck.html
echo "<xmp>" >>filecheck.html
echo "stat可查看文件的属性：
Access: 在读取文件或者执行文件时更改，即文件最后一次被读取的时间。
Modify: 在写入文件时随文件内容的更改而更改，是指文件内容最后一次被修改的时间。
Change: 在写入文件、更改所有者、权限或链接设置时随 Inode 的内容更改而更改，即文件状态最后一次被改变的时间。" >>filecheck.html
echo "</xmp>" >>filecheck.html

echo "<h3>临时目录文件</h3>" >>filecheck.html
echo "检查命令：ls -all /tmp" >>filecheck.html
echo "<br><br>" >>filecheck.html
echo "检查结果：" >>filecheck.html
echo "<xmp>" >>filecheck.html
ls -all /tmp >>filecheck.html
echo "</xmp>" >>filecheck.html

echo "<h3>一天内创建过的文件</h3>" >>filecheck.html
echo "检查命令：find / -mtime -1 -iname '*'" >>filecheck.html
echo "<br><br>" >>filecheck.html
echo "检查结果：" >>filecheck.html
echo "<xmp>" >>filecheck.html
find / -ctime -1 -iname '*.sh' -o -iname '*.php' -o -iname '*.jsp' -o -iname '*.jspx' -o -iname '*.asp' -o -iname '*.aspx' >>filecheck.html
echo "</xmp>" >>filecheck.html

echo "<h3>一天内修改过的文件</h3>" >>filecheck.html
echo "检查命令：find / -ctime -1 -iname '*'" >>filecheck.html
echo "<br><br>" >>filecheck.html
echo "检查结果：" >>filecheck.html
echo "<xmp>" >>filecheck.html
find / -mtime -1 -iname '*.sh' -o -iname '*.php' -o -iname '*.jsp' -o -iname '*.jspx' -o -iname '*.asp' -o -iname '*.aspx' >>filecheck.html
echo "</xmp>" >>filecheck.html

# 账号登录信息
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>logincheck.html
echo "<h3>账号在线&登录信息</h3>" >>logincheck.html
echo "检查命令：last && lastb && w && who" >>logincheck.html
echo "<br><br>" >>logincheck.html
echo "<h6>last检查结果：</h6>" >>logincheck.html
echo "<xmp>" >>logincheck.html
last >>logincheck.html
echo "</xmp>" >>logincheck.html
echo "<h6>lastb检查结果：</h6>" >>logincheck.html
echo "<xmp>" >>logincheck.html
lastb >>logincheck.html
echo "</xmp>" >>logincheck.html
echo "<h6>w检查结果：</h6>" >>logincheck.html
echo "<xmp>" >>logincheck.html
w >>logincheck.html
echo "</xmp>" >>logincheck.html
echo "<h6>who检查结果：</h6>" >>logincheck.html
echo "<xmp>" >>logincheck.html
who >>logincheck.html
echo "</xmp>" >>logincheck.html

# 历史命令
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>historycheck.html
echo "<h3>文件属性</h3>" >>historycheck.html
echo "检查命令：find / -name .bash_history|xargs|xargs stat" >>historycheck.html
echo "<br><br>" >>historycheck.html
echo "检查结果：" >>historycheck.html
echo "<xmp>" >>historycheck.html
find / -name .bash_history|xargs|xargs stat >>historycheck.html
echo "</xmp>" >>historycheck.html

echo "<h3>文件内容</h3>" >>historycheck.html
echo "检查命令：find / -name .bash_history|xargs|xargs cat" >>historycheck.html
echo "<br><br>" >>historycheck.html
echo "检查结果：" >>historycheck.html
echo "<xmp>" >>historycheck.html
find / -name .bash_history|xargs|xargs cat >>historycheck.html
echo "</xmp>" >>historycheck.html

# SSH公钥
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>authorized_keyscheck.html
echo "<h3>文件属性</h3>" >>authorized_keyscheck.html
echo "检查命令：find / -name authorized_keys|xargs|xargs stat" >>authorized_keyscheck.html
echo "<br><br>" >>authorized_keyscheck.html
echo "检查结果：" >>authorized_keyscheck.html
echo "<xmp>" >>authorized_keyscheck.html
find / -name authorized_keys|xargs|xargs stat >>authorized_keyscheck.html
echo "</xmp>" >>authorized_keyscheck.html

echo "<h3>SSH公钥</h3>" >>authorized_keyscheck.html
echo "检查命令：find / -name authorized_keys|xargs|xargs cat" >>authorized_keyscheck.html
echo "<br><br>" >>authorized_keyscheck.html
echo "检查结果：" >>authorized_keyscheck.html
echo "<xmp>" >>authorized_keyscheck.html
find / -name authorized_keys|xargs|xargs cat >>authorized_keyscheck.html
echo "</xmp>" >>authorized_keyscheck.html

# 爆破记录
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>intrudercheck.html
echo "<h3>说明</h3>" >>intrudercheck.html
echo "日志文件主要为/var/log/secure、/var/log/auth.log
<table>
	<tr>
	<td>/var/log/cron</td><td>记录了系统定时任务相关的日志</td>
	</tr>
	<tr>
	<td>/var/log/cups	</td><td>记录打印信息的日志</td></tr>
	<tr>
	<td>/var/log/dmesg	</td><td>记录了系统在开机时内核自检的信息，也可以使用dmesg命令直接查看内核自检信息</td></tr>
	<tr>
	<td>/var/log/mailog	</td><td>记录邮件信息</td></tr>
	<tr>
	<td>/var/log/message	</td><td>记录系统重要信息的日志。这个日志文件中会记录Linux系统的绝大多数重要信息，如果系统出现问题时，首先要检查的就应该是这个日志文件</td></tr>
	<tr>
	<td>/var/log/btmp	</td><td>记录错误登录日志，这个文件是二进制文件，不能直接vi查看，而要使用lastb命令查看</td></tr>
	<tr>
	<td>/var/log/lastlog	</td><td>记录系统中所有用户最后一次登录时间的日志，这个文件是二进制文件，不能直接vi，而要使用lastlog命令查看</td></tr>
	<tr>
	<td>/var/log/wtmp	</td><td>永久记录所有用户的登录、注销信息，同时记录系统的启动、重启、关机事件。同样这个文件也是一个二进制文件，不能直接vi，而需要使用last命令来查看</td></tr>
	<tr>
	<td>/var/log/utmp	</td><td>记录当前已经登录的用户信息，这个文件会随着用户的登录和注销不断变化，只记录当前登录用户的信息。同样这个文件不能直接vi，而要使用w,who,users等命令来查询</td></tr>
	<tr>
	<td>/var/log/secure	</td><td>记录验证和授权方面的信息，只要涉及账号和密码的程序都会记录，比如SSH登录，su切换用户，sudo授权，甚至添加用户和修改用户密码都会记录在这个日志文件中</td></tr>
</table>" >>intrudercheck.html

echo "<br><br><h3>爆破的IP地址</h3>" >>intrudercheck.html
echo "检查命令：grep 'Failed password' /var/log/secure*|grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'|uniq -c" >>intrudercheck.html
echo "<br><br>" >>intrudercheck.html
echo "检查结果：" >>intrudercheck.html
echo "<xmp>" >>intrudercheck.html
grep 'Failed password' /var/log/secure*|grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'|uniq -c >>intrudercheck.html
grep 'Failed password' /var/log/auth.*|grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'|uniq -c >>intrudercheck.html
echo "</xmp>" >>intrudercheck.html

echo "<br><br><h3>root账号爆破次数</h3>" >>intrudercheck.html
echo "检查命令：grep 'Failed password for root' /var/log/secure* | awk '{print $11}' | sort | uniq -c |sort -nr" >>intrudercheck.html
echo "<br><br>" >>intrudercheck.html
echo "检查结果：" >>intrudercheck.html
echo "<xmp>" >>intrudercheck.html
grep 'Failed password for root' /var/log/secure* | awk '{print $11}' | sort | uniq -c |sort -nr >>intrudercheck.html
grep 'Failed password for root' /var/log/auth.* | awk '{print $11}' | sort | uniq -c |sort -nr >>intrudercheck.html
echo "</xmp>" >>intrudercheck.html

echo "<br><br><h3>爆破的字典</h3>" >>intrudercheck.html
echo "检查结果：" >>intrudercheck.html
echo "<xmp>" >>intrudercheck.html
grep "Failed password" /var/log/secure*|perl -e 'while($_=<>){ /for(.*?) from/; print "$1\n";}'|uniq -c|sort -nr >>intrudercheck.html
grep "Failed password" /var/log/auth.*|perl -e 'while($_=<>){ /for(.*?) from/; print "$1\n";}'|uniq -c|sort -nr >>intrudercheck.html
echo "</xmp>" >>intrudercheck.html

echo "<br><br><h3>成功登录的IP地址</h3>" >>intrudercheck.html
echo "检查命令：grep 'Accepted ' /var/log/secure* | awk '{print $11}' | sort | uniq -c | sort -nr" >>intrudercheck.html
echo "<br><br>" >>intrudercheck.html
echo "检查结果：" >>intrudercheck.html
echo "<xmp>" >>intrudercheck.html
grep 'Accepted ' /var/log/secure* | awk '{print $11}' | sort | uniq -c | sort -nr >>intrudercheck.html
grep 'Accepted ' /var/log/auth.* | awk '{print $11}' | sort | uniq -c | sort -nr >>intrudercheck.html
echo "</xmp>" >>intrudercheck.html

echo "<br><br><h3>登录成功的日期、用户名、IP</h3>" >>intrudercheck.html
echo "检查命令：grep 'Accepted ' /var/log/secure* | awk '{print $1,$2,$3,$9,$11}'" >>intrudercheck.html
echo "<br><br>" >>intrudercheck.html
echo "检查结果：" >>intrudercheck.html
echo "<xmp>" >>intrudercheck.html
grep 'Accepted ' /var/log/secure* | awk '{print $1,$2,$3,$9,$11}' >>intrudercheck.html
grep 'Accepted ' /var/log/auth.* | awk '{print $1,$2,$3,$9,$11}' >>intrudercheck.html
echo "</xmp>" >>intrudercheck.html


# 计划任务
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>croncheck.html
echo "<h3>说明</h3>" >>croncheck.html
echo "<xmp>" >>croncheck.html
echo "1、利用 crontab 创建计划任务
crontab -l   列出某个用户cron服务的详细内容
Tips：默认编写的crontab文件会保存在 (/var/spool/cron/用户名 例如: /var/spool/cron/root
crontab -r   删除每个用户cront任务(谨慎：删除所有的计划任务)
crontab -e   使用编辑器编辑当前的crontab文件 
如：*/1 * * * * echo "hello world" >> /tmp/test.txt 每分钟写入文件
" >>croncheck.html
echo "</xmp>" >>croncheck.html
echo "<xmp>" >>croncheck.html
echo "2、利用 anacron 命令实现异步定时任务调度
每天运行 /home/backup.sh 脚本：
vi /etc/anacrontab 
@daily    10    example.daily   /bin/bash /home/backup.sh
当机器在 backup.sh 期望被运行时是关机的，anacron会在机器开机十分钟之后运行它，而不用再等待 7天。
" >>croncheck.html
echo "</xmp>" >>croncheck.html

echo "<h3>/var/spool/cron</h3>" >>croncheck.html
echo "检查命令：more /var/spool/cron/*" >>croncheck.html
echo "<br><br>" >>croncheck.html
echo "检查结果：" >>croncheck.html
echo "<xmp>" >>croncheck.html
more /var/spool/cron/* >>croncheck.html
echo "</xmp>" >>croncheck.html

echo "<h3>/etc/cron.d/</h3>" >>croncheck.html
echo "检查命令：more /etc/cron.d/*" >>croncheck.html
echo "<br><br>" >>croncheck.html
echo "检查结果：" >>croncheck.html
echo "<xmp>" >>croncheck.html
more /etc/cron.d/* >>croncheck.html
echo "</xmp>" >>croncheck.html

echo "<h3>/etc/cron.daily/</h3>" >>croncheck.html
echo "检查命令：more /etc/cron.daily/*" >>croncheck.html
echo "<br><br>" >>croncheck.html
echo "检查结果：" >>croncheck.html
echo "<xmp>" >>croncheck.html
more /etc/cron.daily/* >>croncheck.html
echo "</xmp>" >>croncheck.html

echo "<h3>/etc/cron.hourly/</h3>" >>croncheck.html
echo "检查命令：more /etc/cron.hourly/*" >>croncheck.html
echo "<br><br>" >>croncheck.html
echo "检查结果：" >>croncheck.html
echo "<xmp>" >>croncheck.html
more /etc/cron.hourly/* >>croncheck.html
echo "</xmp>" >>croncheck.html

echo "<h3>/etc/cron.monthly/</h3>" >>croncheck.html
echo "检查命令：more /etc/cron.monthly/*" >>croncheck.html
echo "<br><br>" >>croncheck.html
echo "检查结果：" >>croncheck.html
echo "<xmp>" >>croncheck.html
more /etc/cron.monthly/* >>croncheck.html
echo "</xmp>" >>croncheck.html

echo "<h3>/etc/cron.weekly/</h3>" >>croncheck.html
echo "检查命令：more /etc/cron.weekly/*" >>croncheck.html
echo "<br><br>" >>croncheck.html
echo "检查结果：" >>croncheck.html
echo "<xmp>" >>croncheck.html
more /etc/cron.weekly/* >>croncheck.html
echo "</xmp>" >>croncheck.html

echo "<h3>/var/spool/anacron/</h3>" >>croncheck.html
echo "检查命令：more /var/spool/anacron/*" >>croncheck.html
echo "<br><br>" >>croncheck.html
echo "检查结果：" >>croncheck.html
echo "<xmp>" >>croncheck.html
more /var/spool/anacron/* >>croncheck.html
echo "</xmp>" >>croncheck.html

echo "<h3>/etc/crontab</h3>" >>croncheck.html
echo "检查命令：cat /etc/crontab" >>croncheck.html
echo "<br><br>" >>croncheck.html
echo "检查结果：" >>croncheck.html
echo "<xmp>" >>croncheck.html
cat /etc/crontab >>croncheck.html
echo "</xmp>" >>croncheck.html

echo "<h3>/etc/anacrontab</h3>" >>croncheck.html
echo "检查命令：cat /etc/anacrontab" >>croncheck.html
echo "<br><br>" >>croncheck.html
echo "检查结果：" >>croncheck.html
echo "<xmp>" >>croncheck.html
cat /etc/anacrontab >>croncheck.html
echo "</xmp>" >>croncheck.html

# 开机启动
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>rccheck.html
echo "<h3>说明</h3>" >>rccheck.html
echo "<xmp>" >>rccheck.html
echo "系统运行级别示意图：
0	关机
1	单用户模式，可以想象为windows的安全模式，主要用于系统修复
2	不完全的命令行模式，不含NFS服务
3	完全的命令行模式，就是标准字符界面
4	系统保留
5	图形模式
6	重启动

查看运行级别命令 runlevel

系统默认允许级别
vi  /etc/inittab
id=3：initdefault  #系统开机后直接进入哪个运行级别

开机启动配置文件
/etc/rc.local
/etc/rc.d/rc[0~6].d
部分系统变更为/etc/rc[0~6].d

例子：当我们需要开机启动自己的脚本时，只需要将可执行脚本丢在 /etc/init.d 目录下，然后在 /etc/rc.d/rc*.d 文件中建立软链接即可。

注：此中的 * 代表 0,1,2,3,4,5,6 这七个等级

ln -s /etc/init.d/sshd /etc/rc.d/rc3.d/S100ssh

此处sshd是具体服务的脚本文件，S100ssh是其软链接，S开头代表加载时自启动；如果是K开头的脚本文件，代表运行级别加载时需要关闭的。
" >>rccheck.html
echo "</xmp>" >>rccheck.html

echo "<h3>/etc/init.d</h3>" >>rccheck.html
echo "检查命令：ls -all /etc/init.d" >>rccheck.html
echo "<br><br>" >>rccheck.html
echo "检查结果：" >>rccheck.html
echo "<xmp>" >>rccheck.html
ls -all /etc/init.d >>rccheck.html
echo "</xmp>" >>rccheck.html

echo "<h3>/etc/rc.local</h3>" >>rccheck.html
echo "检查命令：more /etc/rc.local" >>rccheck.html
echo "<br><br>" >>rccheck.html
echo "检查结果：" >>rccheck.html
echo "<xmp>" >>rccheck.html
more /etc/rc.local >>rccheck.html
echo "</xmp>" >>rccheck.html

echo "<h3>/etc/rc.d/rc0.d/</h3>" >>rccheck.html
echo "检查命令：ls -l /etc/rc.d/rc0.d/" >>rccheck.html
echo "<br><br>" >>rccheck.html
echo "检查结果：" >>rccheck.html
echo "<xmp>" >>rccheck.html
ls -l /etc/rc.d/rc0.d/ >>rccheck.html
ls -l /etc/rc0.d/ >>rccheck.html
echo "</xmp>" >>rccheck.html

echo "<h3>/etc/rc.d/rc1.d/</h3>" >>rccheck.html
echo "检查命令：ls -l /etc/rc.d/rc1.d/" >>rccheck.html
echo "<br><br>" >>rccheck.html
echo "检查结果：" >>rccheck.html
echo "<xmp>" >>rccheck.html
ls -l /etc/rc.d/rc1.d/ >>rccheck.html
ls -l /etc/rc1.d/ >>rccheck.html
echo "</xmp>" >>rccheck.html

echo "<h3>/etc/rc.d/rc2.d/</h3>" >>rccheck.html
echo "检查命令：ls -l /etc/rc.d/rc2.d/" >>rccheck.html
echo "<br><br>" >>rccheck.html
echo "检查结果：" >>rccheck.html
echo "<xmp>" >>rccheck.html
ls -l /etc/rc.d/rc2.d/ >>rccheck.html
ls -l /etc/rc2.d/ >>rccheck.html
echo "</xmp>" >>rccheck.html

echo "<h3>/etc/rc.d/rc3.d/</h3>" >>rccheck.html
echo "检查命令：ls -l /etc/rc.d/rc3.d/" >>rccheck.html
echo "<br><br>" >>rccheck.html
echo "检查结果：" >>rccheck.html
echo "<xmp>" >>rccheck.html
ls -l /etc/rc.d/rc3.d/ >>rccheck.html
ls -l /etc/rc3.d/ >>rccheck.html
echo "</xmp>" >>rccheck.html

echo "<h3>/etc/rc.d/rc4.d/</h3>" >>rccheck.html
echo "检查命令：ls -l /etc/rc.d/rc4.d/" >>rccheck.html
echo "<br><br>" >>rccheck.html
echo "检查结果：" >>rccheck.html
echo "<xmp>" >>rccheck.html
ls -l /etc/rc.d/rc4.d/ >>rccheck.html
ls -l /etc/rc4.d/ >>rccheck.html
echo "</xmp>" >>rccheck.html

echo "<h3>/etc/rc.d/rc5.d/</h3>" >>rccheck.html
echo "检查命令：ls -l /etc/rc.d/rc5.d/" >>rccheck.html
echo "<br><br>" >>rccheck.html
echo "检查结果：" >>rccheck.html
echo "<xmp>" >>rccheck.html
ls -l /etc/rc.d/rc5.d/ >>rccheck.html
ls -l /etc/rc5.d/ >>rccheck.html
echo "</xmp>" >>rccheck.html

echo "<h3>/etc/rc.d/rc6.d/</h3>" >>rccheck.html
echo "检查命令：ls -l /etc/rc.d/rc6.d/" >>rccheck.html
echo "<br><br>" >>rccheck.html
echo "检查结果：" >>rccheck.html
echo "<xmp>" >>rccheck.html
ls -l /etc/rc.d/rc6.d/ >>rccheck.html
ls -l /etc/rc6.d/ >>rccheck.html
echo "</xmp>" >>rccheck.html

# 服务启动
echo "<style>xmp{font-size: 14px; font-family: "微软雅黑";}</style>" >>chkconfigcheck.html
echo "<h3>说明</h3>" >>chkconfigcheck.html
echo "<xmp>" >>chkconfigcheck.html
echo "
第一种修改方法：

	chkconfig [--level 运行级别] [独立服务名] [on|off]
	chkconfig –level  2345 httpd on  开启自启动
	chkconfig httpd on （默认level是2345）
	systemctl list-unit-files 部分系统使用更高级的systemctl

第二种修改方法：

	修改 /etc/rc.d/rc.local 文件  
	加入 /etc/init.d/httpd start

第三种修改方法：

使用 ntsysv 命令管理自启动，可以管理独立服务和 xinetd 服务。" >>chkconfigcheck.html
echo "</xmp>" >>chkconfigcheck.html

echo "<h3>chkconfig、systemctl</h3>" >>chkconfigcheck.html
echo "<xmp>" >>chkconfigcheck.html
echo "检查命令：chkconfig --list | grep '3:启用\|5:启用'
chkconfig --list | grep '3:on\|5:on'
systemctl list-unit-files  | grep enabled" >>chkconfigcheck.html
echo "</xmp>" >>chkconfigcheck.html
echo "检查结果：" >>chkconfigcheck.html
echo "<xmp>" >>chkconfigcheck.html
chkconfig --list | grep "3:启用\|5:启用" >>chkconfigcheck.html
chkconfig --list | grep '3:on\|5:on' >>chkconfigcheck.html
systemctl list-unit-files  | grep enabled >>chkconfigcheck.html
echo "</xmp>" >>chkconfigcheck.html

echo "<h3>/etc/rc.d/rc.local</h3>" >>chkconfigcheck.html
echo "检查命令：more /etc/rc.d/rc.local" >>chkconfigcheck.html
echo "<br><br>" >>chkconfigcheck.html
echo "检查结果：" >>chkconfigcheck.html
echo "<xmp>" >>chkconfigcheck.html
more /etc/rc.d/rc.local >>chkconfigcheck.html
echo "</xmp>" >>chkconfigcheck.html