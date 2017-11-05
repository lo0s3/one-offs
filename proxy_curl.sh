#!/bin/bash
# Python requests module doesn't play nice with HTTPS through a proxy, hence using curl
read -s -p "Tap your YubiKey: " yubi
echo " "

for ip in 10.0.0.{1..255}
do
      proxy_curl=$(curl -s -I -o /dev/null -w '%{http_code} \n' --insecure --proxy proxy_ip:8080 -U user:$yubi -sS --max-time 1 https://$ip//page/login.html 2> /dev/null &)
      echo ip:$ip status:$proxy_curl | grep "status:200"
wait
done
