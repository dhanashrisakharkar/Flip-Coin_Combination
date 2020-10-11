#!/bin/bash -x

Headc=1
Tailc=2
Head=0
Tail=0

HHc=11
TTc=22
HTc=12
THc=21
HH=0
TT=0
HT=0
TH=0

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
declare -A Combi1
declare -A Combi2

j=0

for ((i=1; i<30; i++))
do

Coin=$((1+RANDOM%2))
Coin1=$((1+RANDOM%2))
Coin2=$((1+RANDOM%2))
Coin3=$((1+RANDOM%2))

Triplet=$Coin1$Coin2$Coin3
double=$Coin1$Coin2
#single
if [ $Coin -eq $Headc ]
then
       ((Head++))

elif [ $Coin -eq $Tailc ]
then
         ((Tail++))
fi
#Double
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
#Triple
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
#Single
Combi[Headc]=$Head
Combi[Tailc]=$Tail
echo "Dictionary of Coin is " : ${Combi[@]}
echo "Index of Dictionary is ": ${!Combi[@]}
echo "Lenght Of Dictionary is": ${#Combi[@]}

HeadPer=`echo $Head | awk '{print ($1/30)*100}'`

arr[$j]=$HeadPer
((j++))
TailPer=`echo $Tail | awk '{print ($1/30)*100}'`

arr[$j]=$TailPer
((j++))
echo "percentage of Head Comes : $HeadPer%"
echo "Percentage of Tail Comes : $TailPer%"

#Double
Combi[HHc]=$HH
Combi[TTc]=$TT
Combi[HTc]=$HT
Combi[THc]=$TH

echo "Dictionary of Coin is " : ${Combi[@]}
echo "Index of Dictionary is ": ${!Combi[@]}
echo "Lenght Of Dictionary is": ${#Combi[@]}

#Triple
HHPer=`echo $HH | awk '{print ($1/30)*100}'`
arr[$j]=$HHPer
((j++))
TTPer=`echo $TT | awk '{print ($1/30)*100}'`
arr[$j]=$TTPer
((j++))
HTPer=`echo $HT | awk '{print ($1/30)*100}'`
arr[$j]=$HTPer
((j++))
THPer=`echo $TH | awk '{print ($1/30)*100}'`
arr[$j]=$HeadPer
((j++))
echo "percentage of Double Head Comes : $HHPer%"
echo "Percentage of Double Tail Comes : $TTPer%"
echo "percentage of Double Head Comes : $HHPer%"
echo "Percentage of Double Tail Comes : $TTPer%"

echo "HH Comes $HH Times"
echo "TT comes $TT Times"

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

HHHPer=`echo $HHH | awk '{print ($1/30)*100}'`
arr[$j]=$HHHPer
((j++))
HHTPer=`echo $HHT | awk '{print ($1/30)*100}'`
arr[$j]=$HHTPer
((j++))
HTHPer=`echo $HTH | awk '{print ($1/30)*100}'`
arr[$j]=$HTHPer
((j++))
THHPer=`echo $THH | awk '{print ($1/30)*100}'`
arr[$j]=$THHPer
((j++))
TTHPer=`echo $TTH | awk '{print ($1/30)*100}'`
arr[$j]=$TTHPer
((j++))
THTPer=`echo $THT | awk '{print ($1/30)*100}'`
arr[$j]=$THTPer
((j++))
HTTPer=`echo $HTT | awk '{print ($1/30)*100}'`
arr[$j]=$HTTPer
((j++))
TTTPer=`echo $TTT | awk '{print ($1/30)*100}'`
arr[$j]=$TTTPer
((j++))
echo "percentage of HHH : $HHHPer%"
echo "Percentage of HHT : $HHTPer%"
echo "percentage of HTH : $HTHPer%"
echo "Percentage of THH : $THHPer%"
echo "percentage of TTH : $TTHPer%"
echo "Percentage of THT : $THTPer%"
echo "percentage of HTT : $HTTPer%"
echo "Percentage of TTT : $TTTPer%"

echo ${arr[@]}
#shorting 
temp=0
for ((i=0;i<${#arr[@]};i++))
do
	for ((j=0;j<$((${#arr[@]}-1-$i));j++))
	do
		if [ ${arr[j]} -lt ${arr[j+1]} ]
		then
			temp=${arr[j]}
			arr[j]=${arr[j+1]}
			arr[j+1]=$temp
		fi
	done
done
echo ${arr[@]}
echo ${!arr[@]}

if [ $HeadPer -gt $TailPer ]
then echo "H  wins"
elif [ $TailPer -gt $HeadPer ]
then echo "T wins"
else echo "both H&T wins"
fi
