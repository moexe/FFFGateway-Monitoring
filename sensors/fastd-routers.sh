#!/bin/bash

port=10001
hood=hbergsued

for ip in $(tcpdump -n -i  eth0 udp port $port -c 500 2>/dev/null | cut -f 3 -d " " | sort -n | uniq | grep -v 1000 | cut -f 1-4 -d .); do 
	grep -3 $ip /etc/fastd/fff.$hood/peers/* | grep name | cut -f2 -d\"  
done | grep -v netmon
