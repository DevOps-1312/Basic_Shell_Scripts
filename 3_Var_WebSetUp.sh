#!/bin/bash

# Variables Declaration
PACAKGE="httpd wget unzip"
SVC="https"
URL="https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME='2098_health'
TEMPDIR='/tmp/webfiles'

echo "##################################"
echo "Installing packages"
echo "##################################"
sudo yum install $PACAKGE -y > /dev/null
echo

echo "##################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC

# Creating temp Directory
echo "##################################"
mkdir -p $TEMPDIR
cd $TEMPDIR

# Start Artifact Deployment
echo "##################################"
wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/

# Bounce Service
echo "##################################"
sudo systemctl restart httpd
echo

# Clean up
echo "##################################"
rm -rf $TEMPDIR
echo

sudo systemctl status httpd
ls /var/www/html
