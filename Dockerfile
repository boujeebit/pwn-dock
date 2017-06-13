FROM debian:latest

MAINTAINER Mickey Hefley <x4dx48@gmail.com>

RUN apt-get update && apt-get install -y postgresql postgresql-contrib  \
        postgresql-client build-essential libssl-dev libffi-dev apache2 \
        openssh-server python python-pip python-dev gdb binwalk php5    \
        ruby curl wget nano netcat nasm tmux man vim zip git

RUN apt-get upgrade -y

#Install pip packages
RUN pip install --upgrade pip && pip install --upgrade cffi
RUN pip install flask virtualenv pwntools pycrypto angr

#Install Msframework
WORKDIR /tmp/msf/
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > \
        msfinstall && chmod 755 msfinstall && ./msfinstall

#Overwrite msfconsole to hit wrapper first
RUN curl -sSL  https://raw.githubusercontent.com/mhefley/pwn-dock/master/scripts/bashrc --output /root/.bashrc
RUN mkdir /root/bin
RUN curl -sSL  https://raw.githubusercontent.com/mhefley/pwn-dock/master/wappers/msfconsole --output /root/bin/msfconsole && chmod a+x /root/bin/msfconsole

WORKDIR /
