#!/bin/bash -x

HHc=11
TTc=22
HTc=12
THc=21
HH=0
TT=0
HT=0
TH=0

declare -A Combi
for ((i=1; i<30; i++))
do

Coin1=$((1+RANDOM%2))
Coin2=$((1+RANDOM%2))
double=$Coin1$Coin2

case $double in
              11 )
                    echo " It is a HH "
                    ((HH++))
                     ;;
              12 )
                    echo " It is a HT "
                    ((HT++))
                     ;;
              21 )
                    echo " It is a HT "
                    ((TH++))
                     ;;
              22 )
                    echo " It is a TT "
                    ((TT++))
                     ;;
esac
done

Combi[HHc]=$HH
Combi[TTc]=$TT
Combi[HTc]=$HT
Combi[THc]=$TH

echo "Dictionary of Coin is " : ${Combi[@]}
echo "Index of Dictionary is ": ${!Combi[@]}
echo "Lenght Of Dictionary is": ${#Combi[@]}

echo "HH Comes $HH Times"
echo "TT comes $TT Times"


HHPer=`echo $HH | awk '{print ($1/30)*100}'`
TTPer=`echo $TT | awk '{print ($1/30)*100}'`
HTPer=`echo $HT | awk '{print ($1/30)*100}'`
THPer=`echo $TH | awk '{print ($1/30)*100}'`

echo "percentage of Double Head Comes : $HHPer%"
echo "Percentage of Double Tail Comes : $TTPer%"
echo "percentage of Double Head Comes : $HHPer%"
echo "Percentage of Double Tail Comes : $TTPer%"
