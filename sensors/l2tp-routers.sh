#!/bin/bash
# Diese Datei in /etc/sudoers eintragen!!!! z.B. so:
# www-data ALL=(ALL) NOPASSWD: /var/www/html/has-mon/sensors/l2tp-routers.sh


ips=$(ip l2 s tunnel | awk '/From/  {print $4}')
#journalctl -u tunneldigger-broker-sued.service > /tmp/td.log
cat /var/log/syslog /var/log/syslog.1 | grep tunneldigger  | grep Creating > /tmp/td.log
zcat /var/log/syslog.?.gz | grep tunneldigger  | grep Creating >> /tmp/td.log
for ip in $ips; do
	rname="$rname$(grep $ip /tmp/td.log | awk '/Creating/ {gsub ("\\(","");gsub ("\\)",""); print $10"\\n"}')" 
done

echo -e $rname | grep -v ^" " | uniq | sort -f | uniq
