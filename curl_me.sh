#!/bin/bash

while read ip ; do
	echo $ip && curl -sS --connect-timeout .1 --max-time .3 -I http://$ip:8080/script
done < ip_list.txt
