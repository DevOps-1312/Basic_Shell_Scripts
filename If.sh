#!/bin/bash

read -p "Enter a number: " NUM
echo

if [ $NUM -ge 100 ]
then
        echo "we  have entered in IF block"
        sleep 3
        echo "Your Number is greater than 100"
        echo
        date
else
        echo "Your have entered less than 100"
echo
fi

echo "Script execution completed successfully"
