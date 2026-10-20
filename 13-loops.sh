#!/bin/bash

user_id=$(id -u)
log_folder="/var/log/shell-practice"
log_file="${logg_folder}/${0}.log"

if [ $user_id -ne 0 ]; then
       echo "Please run this script as root user"
       exit 1
fi

mkdir -p $log_folder

echo "Script started execution at $(date + %F %T)" >> $log_file

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}..FAILED" >> tee -a $log_file
        exit 1
    else
        echo "${2}..SUCCESS" >> tee -a $log_file
    fi
}

for package in $@
do
    echo "Going to install: ${package}"
    dnf install ${package} -y &>> $log_file
    validate $? "Installaing ${package}"
done
