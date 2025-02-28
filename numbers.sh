#!/bin/bash

mult=1
sum=0

#вычисляем число, с которого начинает считать сумму
(( $1 % 2 == 0 )) && startSum=$(( $1/2 + 1)) || startSum=$(( $1/2 + 2 ))

for ((x=1; x<=$1/2; x++))
do
	mult=$(( mult * x ))
done

for ((x=startSum; x<=$1; x++))
do
	sum=$(( sum + x ))
done

echo "mult: $mult"
echo "sum: $sum"
