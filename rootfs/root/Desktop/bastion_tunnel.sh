#!/bin/bash

#You first need openconnect remote.locgov.nl << Follow instructions here
sshpass -e ssh -o PreferredAuthentications=password -D127.0.0.1:7272 -f -C -N "ionasc50@172.18.10.2"
