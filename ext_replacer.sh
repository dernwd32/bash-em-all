#!/bin/bash

FILES=()

while [[ $# -gt 0 ]];
do
        case $1 in
                --file)
                        FILES+=("$2")
                        shift
                        shift
                        ;;
                --ext)
                        EXT=$2
                        shift
                        shift
                        ;;
                --rep)
                        REP=$2
                        shift
                        shift
                        ;;
               *)
                        echo "Неизвестный аргумент: $1 со значением $2"
                        exit 666
                        shift
                        shift
                        ;;
        esac
done

for file in ${FILES[@]};
do
	fullpath=$(realpath "$file")
	oldpath=$fullpath

	if [[ "$oldpath" =~ $EXT$ ]]; then
		newpath="${fullpath%.$EXT}.$REP"
		echo "~~ Переименовываю $oldpath > $newpath"
		mv "$oldpath" "$newpath"
	else
		echo "~~ Файл $oldpath имеет иное расширение, нежели .$EXT, поэтому не будет переименован"
	fi
done

ls
