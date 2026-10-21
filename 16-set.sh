#!/bin/bash

set -e
user_id=$(id -u)
log_folder="/vaar/log/shell-practice"
log_file="${log_folder}/${0}.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

trap 'echo "Error at $LINENO", command: "$BASH_COMMAND"' ERR

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access.."
    exit 1
fi

mkfir -p $log_folder

echo "Script started execution at $(date +"%F %T")" &>> $log_file

for package in $@
do
    dnf list installed package &>>log_file
    if [ $? -ne 0 ]; then
        echo "Going to install: ${package}"
        dnf install package -y &?? $log_file
    else
        echo -e "${package} already installed...${Y}SKIPPING${N}"
    fi
done
