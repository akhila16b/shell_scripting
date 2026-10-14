#!/bin/bash

echo "All args passed to the script : $@"
echo "All args passed to the script as word : $*"
echo "Number of args passed to the script : $#"
echo "First variable passed : $1"
echo "Script name: $0"
echo "realpath: $(realpath$0)"
echo "who is running the current script $USER"
echo "Directory of the current script : $PWD"
echo "Home directory of the current user: $HOME"
echo "PID of the current script: $$"
sleep 10 &
echo "PID of the command running in background now: $!"
wait $!
echo "Line number: $LINENO"
echo "previous command exit status : $?"
echo "Total time executed for this script: $SECONDS"