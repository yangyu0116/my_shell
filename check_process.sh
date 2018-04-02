#! /bin/bash
# 磁盘监控

send_mail()
{
	mutt -s "【报警】bc-v01 php进程异常_$1%" yangyu@sina.cn
}

for d in `ps -ef | grep php-fpm | wc -l`
do
	if [ $d -gt 30 ]; then
		send_mail $d;
	fi
done
