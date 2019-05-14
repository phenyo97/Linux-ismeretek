#!/bin/bash

#Szelvények vásárlása és kimutatása

tickets="$1"

printf "Üdvözöljük az Ötöslottó szelvény váltó oldalán! \n\n";
function get_tickets { printf "Hány szelvényt szeretnél vásárolni? \n"; read tickets;}

function gen_numbers { printf "Ezek a szelvényeid: \n";
	for ((z = 0; z<tickets ; z++)); do
		i=0
		used=( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
		for (( ; i<5;  )); do
			x=`echo $[ 1 + $[ RANDOM % 89 ]]`;
			if [ ${used[$x]} -eq 0 ]
			then
				printf "\t $x";
				i=$((i + 1))
				used[$x]=1
			fi
		done;
		printf "\n"
	done;
	printf "\n"; }

if [[ -z $tickets ]] ; then
	get_tickets
	gen_numbers
else
	gen_numbers
fi


#A nyerő számok húzása

printf "\n\nA nyerő számok:\n"
seq 90 | shuf | tail -n5 | xargs
