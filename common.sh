
script_location=$(pwd)
LOG=/tmp/roboshop.log

status_check() {
    if [ $? == 0 ]; then
     echo "SUCCESS"
    else
     echo "FAILURE"
     echo "Refer log file for more information, LOG - $LOG"
    fi 
}

