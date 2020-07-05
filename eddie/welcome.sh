#!/bin/bash

COLUMNS=$(tput cols)
name=$USER

title=$(date +"%F %a %H:%M")
printf "%*s\n" $(((${#name} + $COLUMNS) / 2)) "$name"
printf "%*s\n" $(((${#title} + $COLUMNS) / 2)) "$title" | lolcat
