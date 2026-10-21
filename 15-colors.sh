#!/bin/bash

user_id=$(id -u)
log_folder="/var/log/shell-practice"
log_file="${log_folder}/${0}.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access.."
    exit 1
fi

mkdir -p $log_folder

echo "Script started execution at $(date +"%F %T")" &>> $log_file

validate(){
    if [ $! -ne 0 ]; then
        echo -e "${R}${2}..FAILED${N}" | tee -a $log_file
        exit 1
    else
        echo -e "${G}${2}..SUCCESS${N}" | tee -a $log_file
    fi
}

for package in $@
do 
    dnf list installed $package &>> $log_file
    if [ $? -ne 0 ]; then
        echo -e "${Y}Going to install": ${package}${N}"
        dnf install $package -y &>> $log_file
        validate $? "Installing ${package}"
    else
        echo -e "${package} already installed...${Y}SKIPPING${N}"
        fi
done
