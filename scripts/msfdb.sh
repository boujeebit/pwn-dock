#!/bin/bash

service postgresql start
su -c "msfdb init" postgres
