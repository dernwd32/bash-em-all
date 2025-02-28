#!/bin/bash

FILES=()

while [[ $# -gt 0 ]];
do
        case $1 in
                --file)
                        FILES+=("$2")
                        shift 2
                        ;;
                --ext)
                        EXT=$2
                        shift 2
                        ;;
                --rep)
                        REP=$2
                        shift 2
                        ;;
               *)
                        echo "Неизвестный аргумент: $1 со значением $2"
                        exit 666
                        shift 2
                        ;;
        esac
done

for file in ${FILES[@]};
do
	oldpath=$(realpath "$file")

	if [[ "$oldpath" =~ $EXT$ ]]; then
		newpath="${oldpath%.$EXT}.$REP"
		echo "~~ Переименовываю $oldpath > $newpath"
		mv "$oldpath" "$newpath"
	else
		echo "~~ Файл $oldpath имеет иное расширение, нежели .$EXT, поэтому не будет переименован"
	fi
done

ls
