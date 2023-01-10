#!/bin/bash
apt update
# apt install nginx -y
# apt install docker.io -y
apt install net-tools -y
# systemctl start nginx
# echo $(curl http://169.254.169.254/latest/meta-data/public-ipv4) > /var/www/html/index.nginx-debian.html
apt install ansible -y
apt install software-properties-common -y
add-apt-repository ppa:deadsnakes/ppa -y
apt update
apt install python3.8 -y