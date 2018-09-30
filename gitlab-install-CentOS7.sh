#!/bin/bash

echo " copy from  https://about.gitlab.com/installation/#centos-7 ....."

sudo yum install -y curl policycoreutils-python openssh-server

sudo systemctl enable sshd
sudo systemctl start sshd
sudo firewall-cmd --permanent --add-service=http
sudo systemctl reload firewalld

sudo yum install postfix -y
sudo systemctl enable postfix
sudo systemctl start postfix


curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash

IP=`ifconfig |grep inet |awk '{print $2}' |xargs -I % echo % | egrep -e "^[1-9][0-9][0-9]" |grep  -v ".1$"`

sudo EXTERNAL_URL="http://$IP" yum install -y gitlab-ee
