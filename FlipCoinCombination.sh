#!/bin/bash -x

HHHc=111
TTTc=222
HHTc=112
HTHc=121
THHc=211
TTHc=221
THTc=212
HTTc=122

HHH=0
TTT=0
HHT=0
HTH=0
THH=0
TTH=0
THT=0
HTT=0

declare -A Combi
for ((i=1; i<30; i++))
do

Coin1=$((1+RANDOM%2))
Coin2=$((1+RANDOM%2))
Coin3=$((1+RANDOM%2))

Triplet=$Coin1$Coin2$Coin3

case $Triplet in
              111 )
                    ((HHH++))
                     ;;
              112 )
                    ((HHT++))
                     ;;
              121 )
                    ((HTH++))
                     ;;
              211 )
                    ((THH++))
                     ;;
              221 )
                    ((HHT++))
                     ;;
              212 )
                    ((THT++))
                     ;;
              221 )
                    ((TTH++))
                     ;;
              222 )
                    ((TTT++))
                     ;;

esac
done

Combi[HHHc]=$HHH
Combi[HHTc]=$HHT
Combi[HTHc]=$HTH
Combi[THHc]=$THH
Combi[TTHc]=$TTH
Combi[THTc]=$THT
Combi[HTTc]=$HTT
Combi[TTTc]=$TTT

echo "Dictionary of Coin is " : ${Combi[@]}
echo "Index of Dictionary is ": ${!Combi[@]}
echo "Lenght Of Dictionary is": ${#Combi[@]}

echo "HH Comes $HH Times"
echo "TT comes $TT Times"


HHHPer=`echo $HHH | awk '{print ($1/30)*100}'`
HHTPer=`echo $HHT | awk '{print ($1/30)*100}'`
HTHPer=`echo $HTH | awk '{print ($1/30)*100}'`
THHPer=`echo $THH | awk '{print ($1/30)*100}'`
TTHPer=`echo $TTH | awk '{print ($1/30)*100}'`
THTPer=`echo $THT | awk '{print ($1/30)*100}'`
HTTPer=`echo $HTT | awk '{print ($1/30)*100}'`
TTTPer=`echo $TTT | awk '{print ($1/30)*100}'`

echo "percentage of HHH : $HHHPer%"
echo "Percentage of HHT : $HHTPer%"
echo "percentage of HTH : $HTHPer%"
echo "Percentage of THH : $THHPer%"
echo "percentage of TTH : $TTHPer%"
echo "Percentage of THT : $THTPer%"
echo "percentage of HTT : $HTTPer%"
echo "Percentage of TTT : $TTTPer%"
