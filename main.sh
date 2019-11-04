#!/bin/bash
#create files to record in it.
touch all.s Aremoved.r exp.txt

#initialize count of removed A's to 0
count=0

#calculate the initial file size.
SIZE=$(du -BK all.s | cut -f1)
SIZELEN=${#SIZE}
ACTUALL=${size:0:sizeLen-1}

#loop till the file size becomse 1Mib
while [[ $ACTUALL -lt 1000 ]]
do
	#Generate random characters using mktemp
	line=$(mktemp -u)
	#record the line in file that have all entries.
	echo ${line#*.} >> all.s
	if [[ ${line#*.} == a* || ${line#*.} == A* ]]; then
		#if the line starts with a increment the count.
		count=$(($count+1))
	else
		#if the file doesn't start with a, append the line in the
		#file that doesn't contain A's
		echo ${line#*.} >> Aremoved.r
	fi
	#calculate the new file size
	SIZE=$(du -BK all.s | cut -f1)
	SIZELEN=${#SIZE}
	ACTUALL=${SIZE:0:SIZELEN-1}
done	
#sort both files
sort -d -o all.s all.s
sort -d -o Aremoved.r Aremoved.r
echo "Lines removed = $count" >> exp.txt
