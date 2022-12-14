#!/bin/bash
apt update -y
apt install curl -y
apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
apt install default-jre -y
apt install git -y
apt install ansible -y
apt install docker.io -y
usermod -a -G docker jenkins
chmod 777 /var/run/docker.sock