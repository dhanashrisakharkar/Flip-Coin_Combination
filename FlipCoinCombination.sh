#!/bin/bash -x

Coin=$((1+RANDOM%3))

if [ $Coin -eq 1 ]
then
     echo "It Is a HEAD"
elif [ $Coin -eq 2 ]
then
     echo "It Is a TAIL"
else
    echo "It Is not Valid"
fi
