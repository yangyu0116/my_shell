#! /bin/bash
# 磁盘监控

send_mail()
{
	date_today=`date +%Y_%m_%d`
	echo "日期：$date_today  `printf \"快满了，需要赶紧处理 %0100d\n\" 0|tr \"0\" \" \"` " | mutt -s "【报警】bc-v01磁盘满了_$1%" yangyu@sina.cn
}

for d in `df -P | grep /dev | awk '{print $5}' | sed 's/%//g'`
do
	if [ $d -gt 80 ]; then
		send_mail $d;
	fi
done
