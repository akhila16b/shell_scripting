#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
logs_file="${logs_folder}/${0}.log"

if [ $user_id -ne 0 ];then
    echo "Please run this script as root user"
    exit 1
fi

mkdir -p $logs_folder

echo "Script started execution at $(date +"%F %T")" >> $logs_file

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}..FAILED" >> $logs_file
        exit 1
    else
        echo "${2}..SUCCESS" >> $logs_file
    fi
}

dnf install nginx -y &>> $logs_file
validate $? "nginx installation"

dnf install mysql -y &>> $logs_file
validate $? "Mysql Installation"

echo "Script completed execution at $(date +"%F %T")" &>> $logs_file
