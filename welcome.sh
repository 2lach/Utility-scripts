#!/bin/bash

# In order to run this script lolcat & figlet must be installed (both are highly available for most systems)
    # lolcat > [original (ruby) https://github.com/busyloop/lolcat] (c) [https://github.com/jaseg/lolcat] 
    # figlet > [http://www.figlet.org/]


COLUMNS=$(tput cols) 
name=$USER 

title=$(date +"%A %d-%b-%Y %H:%M")
printf "%*s\n" $(((${#name}+$COLUMNS)/2)) "$name"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title" | lolcat

