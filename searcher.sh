#!/bin/bash

while [[ $# -gt 0 ]];
do
	case $1 in
		--file)
			file=$2
			shift
			shift
			;;
		--search)
			search=$2
			shift
			shift
			;;
		*)
			echo "Неизвестный аргумент: $1 со значением $2"
			exit 1
			shift
			shift
			;;
	esac
done


fullpath=$(realpath $file)
answer=$(grep -o "$search" $file | wc -l)

if ((answer==0)); 
then echo "Не найдено совпадений в файле $fullpath"
else echo $answer
fi
