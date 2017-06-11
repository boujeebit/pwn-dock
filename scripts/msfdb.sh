#!/bin/bash

service postgresql start

#If the database.yml file is not found create the database else have msf init it.
if [ ! -f /var/lib/postgresql/.msf4/database.yml ]; then
    su -c "mkdir /var/lib/postgresql/.msf4 && createuser msf && createdb --owner=msf msf && msfdb init" postgres
else
    su -c "msfdb init" postgres
fi

if [ ! -d /root/.msf4 ]; then
    mkdir /root/.msf4
fi

if [ ! -f /root/.msf4/database.yml ]; then
  cp /var/lib/postgresql/.msf4/database.yml /root/.msf4/database.yml
fi
