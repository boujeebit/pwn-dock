#!/bin/bash

service postgresql start

if [ ! -d /root/.msf4 ]; then
    mkdir /root/.msf4/
    su -c "msfdb init" postgres
    cp /var/lib/postgresql/.msf4/database.yml /root/.msf4/database.yml
else
    su -c "msfdb init" postgres
fi
