#!/bin/bash

LOG_FILE="/var/log/syslog"
#SEARCH_KEYWORDS=("error" "errors")



SEARCHED="Permission denied"
previous_loop_line=$( tail -n 1 $LOG_FILE )
while true ; do
line=$( tail -n 1 $LOG_FILE )
if [[ $line =~ $SEARCHED && "$previous_loop_line" != "$line" ]] ; then
sh slackquery.sh
previous_loop_line=$line
fi
done
