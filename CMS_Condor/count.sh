#!/bin/bash


## Usage: source count.sh YOUR_CONDOR_OUTPUT_DIR


dir="$1/condorLog/"

list=`ls -1 $dir/*.log`


sum_evt=0
sum_evt_real=0
for f in $list

do

	x=`cat $f | grep "@finalEDMJSON" | awk '{print $4}'`
	y=`cat $f | grep "@finalEDMJSON" | awk '{print $6}'`
	
	sum_evt_real=`expr $x + $sum_evt_real`
	sum_evt=`expr $y + $sum_evt`

	if [ $x != $y ]
	then
	echo "=== Not matched ==="
	echo "Error file: $f"
	echo "Error evts: " `expr $x - $y`
	echo "==================="
	fi

done

echo " "
echo "=== Total Event summary ==="
echo $sum_evt "out of" $sum_evt_real
echo "Error evts: " `expr $sum_evt_real - $sum_evt`
