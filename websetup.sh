#!/bin/bash

echo "##################################"
echo "Installing packages"
echo "##################################"
sudo yum install wget unzip httpd -y > /dev/null
echo

echo "##################################"
sudo systemctl start httpd
sudo systemctl enable httpd

# Creating temp Directory
echo "##################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles

# Start Artifact Deployment
echo "##################################"
wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/

# Bounce Service
echo "##################################"
sudo systemctl restart httpd
echo

# Clean up
echo "##################################"
rm -rf /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html
