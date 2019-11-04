#!/bin/bash

touch challenge1.s challenge.r exp.txt
count=0
SIZE=$(du -BK challenge1.s | cut -f1)
SIZELEN=${#SIZE}
ACTUALL=${size:0:sizeLen-1}

while [[ $ACTUALL -lt 1000 ]]
do
	line=$(mktemp -u)
	echo ${line#*.} >> challenge1.s
	if [[ ${line#*.} == a* || ${line#*.} == A* ]]; then
		count=$(($count+1))
	else
		echo ${line#*.} >> challenge1.r
	fi
	
	SIZE=$(du -BK challenge1.s | cut -f1)
	SIZELEN=${#SIZE}
	ACTUALL=${SIZE:0:SIZELEN-1}
done	

sort -d -o challenge1.s challenge1.s
sort -d -o challenge1.r challenge1.r
echo "Lines removed = $count" >> exp.txt
