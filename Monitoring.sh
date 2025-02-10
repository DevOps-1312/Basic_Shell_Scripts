#!/bin/bash

echo
echo "###############################################################"
date

ls /var/run/httpd/httpd.pid &> /dev/null


if [ $? -eq 0 ]
then
        echo "Httpd process is running."
else
        echo "Httpd process is NOT Running."
        echo "Starting the process"
        systemctl start httpd
        if [ $? -eq 0 ]
        then
                echo "Process started successfully"
        else
                echo "Process failed to start, contact admin."
        fi
fi
echo "###############################################################"
echo
