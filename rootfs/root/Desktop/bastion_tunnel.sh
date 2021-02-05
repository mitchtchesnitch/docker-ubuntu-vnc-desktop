#!/bin/bash

printf "Creating bastion ssh tunnel"
sshpass -e ssh -o PreferredAuthentications=password -D127.0.0.1:7272 -f -C -N "ionasc50@172.18.10.2"