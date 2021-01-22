#!/bin/bash

ip_address=$1
base_port_number=$2
number_of_servers=$3
request_count=$4

for (( i=1; i<=$request_count; i++ ))
do 
    sleep_time=$(( ( RANDOM % 10 )  + 0 ))
    port_number=$(( ( RANDOM % number_of_servers )  + 0 ))
    port_number=$(( port_number + base_port_number ))

    # random sleep
    sleep $sleep_time
   
    # download the file
    #wget  -q --show-progress "http://${ip_address}:${port_number}/test1MB" >> clients.log
    #/usr/bin/time -f "%e"  wget -q   http://localhost:9003/test1MB >> clients.log


    ts=$(date +%s%N) 
    # downloads the file from the selected server    
    wget -O/dev/null -q "http://${ip_address}:${port_number}/test1MB"
    exit_code=$?
    # calculates the elapsed time
    tt=$((($(date +%s%N) - $ts)/1000000))

    # prints stats
    printf "[${ip_address}:${port_number}]\t[elapsed-time]\t${tt}\t${exit_code}\n"

done

# the end of the program
echo "Finished: Client has issued ${request_count} requests."

