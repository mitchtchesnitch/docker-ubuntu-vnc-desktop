#!/bin/bash
green='\e[1;32m%s\e[0m\n'
USER=${1}
PASS=${2}

ssh-keyscan -H 172.18.10.2 >> ~/.ssh/known_hosts
export SSHPASS="$PASS" && sshpass -e ssh -o PreferredAuthentications=password -D127.0.0.1:7272 -f -C -N ""$USER"@172.18.10.2"

verif=$(ps aux | grep ssh | grep 172.18.10.2 | grep 7272)
if [ -z "$verif" ]; then
  printf "NOT OK, tunnel not up, please check VPN!\n"
else
  printf "$green\n" "OK, tunnel is up!"
fi

while true; do
        printf "$green" "Keepalive ping..."
        ping -q -c 3 172.17.0.2
        sleep 120
done