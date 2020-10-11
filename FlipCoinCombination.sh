#!/bin/bash -x

Headc=1
Tailc=2
Head=0
Tail=0

declare -A Combi
for ((i=1; i<30; i++))
do

Coin=$((1+RANDOM%2))

if [ $Coin -eq $Headc ]
then
       ((Head++))

elif [ $Coin -eq $Tailc ]
then
         ((Tail++))
fi

done

Combi[Headc]=$Head
Combi[Tailc]=$Tail


echo "Dictionary of Coin is " : ${Combi[@]}
echo "Index of Dictionary is ": ${!Combi[@]}
echo "Lenght Of Dictionary is": ${#Combi[@]}


HeadPer=`echo $Head | awk '{print ($1/30)*100}'`
TailPer=`echo $Tail | awk '{print ($1/30)*100}'`

echo "percentage of Head Comes : $HeadPer%"
echo "Percentage of Tail Comes : $TailPer%"

