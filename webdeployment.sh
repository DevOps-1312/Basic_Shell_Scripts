#!/bin/bash

USR='devops'

for host in `cat remotehost`
do
        echo "############################"
        echo "Connecting to $host"
        echo "Pushing Script to $host"
        scp multiOS_websetup.sh $USR@$host:/tmp/
        echo "Exexutting Script on $host"
        ssh $USR@$host sudo /tmp/multiOS_websetup.sh
        ssh $USR@$host sudo rm -rf /tmp/multiOS_websetup.sh
        echo "#############################"
        echo
done
