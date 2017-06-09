FROM debian:latest

MAINTAINER Mickey Hefley <x4dx48@gmail.com>

RUN apt-get update && apt-get install -y postgresql postgresql-contrib postgresql-client curl wget nano netcat tmux man
#&& apt-get install && apt-get -y upgrade

#Install Msframework
#WORKDIR /tmp/msf/
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall

#Enable Postgres on boot
RUN echo service postgresql start >> /root/.bashrc
RUN echo "su -c \"mkdir /var/lib/postgresql/.msf4 && createuser msf && createdb --owner=msf msf && msfdb init \" postgres" >> /root/.bashrc
RUN echo mkdir /root/.msf4/ >> /root/.bashrc
RUN echo cp /var/lib/postgresql/.msf4/database.yml /root/.msf4/database.yml >> /root/.bashrc



# OPTIONAL PACKAGES

#RUN apt-get -y install python python-pip python-dev build-essential libssl-dev libffi-dev wget
#RUN apt-get -y install apache2 openssh-server tmux nano vim

#RUN pip install --upgrade pip
#RUN pip install flask virtualenv pwntools pycrypto
#wget | ida remote | ruby | php | nvm | nmap | tcpdump | metaspliot | angr?
