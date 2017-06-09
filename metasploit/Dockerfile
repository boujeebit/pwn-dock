FROM debian:latest

MAINTAINER Mickey Hefley <x4dx48@gmail.com>

RUN apt-get update && apt-get install -y postgresql postgresql-contrib postgresql-client curl wget nano netcat tmux man
#&& apt-get install && apt-get -y upgrade

#Install Msframework
#WORKDIR /tmp/msf/
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall

#Enable Postgres on boot
RUN curl -sSL https://raw.githubusercontent.com/mhefley/pwn-dock/master/metasploit/scripts/bashrc.sh --output /root/.bashrc
