#!/bin/bash

#get the file from has2
wget -O /tmp/clients http://5.189.166.50/test.html

date=$(date +%Y:%m:%d:%H:%M:%S)

all=$(grep Clients /tmp/clients | cut -f 2 -d" " | cut -f1 -d"<")
has=$(grep Hassberge: /tmp/clients | cut -f 2 -d" " | cut -f1 -d"<")
sued=$(grep Sued /tmp/clients | cut -f 3 -d" " | cut -f1 -d"<")

echo "$date $all $has $sued" >> /var/www/html/has-mon/data/clients.dat
# dat länge begrenzen
tail -450 /var/www/html/has-mon/data/clients.dat > /tmp/clients.dat
grep -v ^$ /tmp/clients.dat > /var/www/html/has-mon/data/clients.dat

/var/www/html/has-mon/sensors/clients.pl
