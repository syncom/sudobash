#!/usr/bin/env bash
#####################################################
# A sudoku solver in bash using sed, grep, echo, etc.
#
# Created 2006 summer
#####################################################

sed 's/[0-9]/&\n/g'< "$1" > ttt
{
for ((i=0;i<=80;i++))
do
 read -r a[$i]
done
} < ttt

rm ttt

sudoku () {
	local i
	local j
	local k
	for ((i=0;i<=80;i++))
	do

	 if [ "${a[$i]}" -ne 0  ]
 	 then 
	  continue
	 fi
	 local non_cand=
	 
	 for ((j=0;j<=80;j++))
	 do
	  if (( j / 9 == i / 9 || j % 9 == i % 9 || j / 27 == i / 27 && j % 9 / 3 == i % 9 / 3 ))
	  then
	    non_cand=${non_cand}${a[$j]}
	  fi
	 done
	 local cand
	 cand="$(echo "123456789" | tr -d "$non_cand")"
#echo "\$i = $i, \$cand = $cand"
	 for ((k=1;k<=9;k++))
	 do
	  if echo -n "$cand" | grep -q "$k"
	  then a[$i]=$k
	  sudoku
	  fi 
	 done	
	 a[$i]=0
	 return 
	done
	for ((k=0;k<=80;k++))
	do
	echo -n ${a[$k]}
	done
	kill $$
}

sudoku
