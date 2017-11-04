#!/bin/bash
# This script will curl web servers through a proxy with a given input list
# Ref: https://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable
# Usage: ./curl_me.sh ip_list.txt

while IFS='' read -r ip || [[ -n "$ip" ]]; do
	echo $ip && curl -I --proxy proxy_host:8080 -U user:yubikey -sS --connect-timeout 1 --max-time 1 http://$ip
done < "$1"
