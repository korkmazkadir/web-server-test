#!/bin/bash

ip_address=$1
base_port_number=$2
number_of_servers=$3
request_count=$4

for (( i=1; i<=$request_count; i++ ))
do 
    sleep_time=$(( ( RANDOM % 5 )  + 0 ))
    port_number=$(( ( RANDOM % number_of_servers )  + 0 ))
    port_number=$(( port_number + base_port_number ))

    # random sleep
    sleep $sleep_time
   
    ts=$(date +%s%N) 
   
    # downloads the file from the selected server    
    #./client-app $ip_address $port_number 1 2>&1

    cmd_out=$( ./client-app $ip_address $port_number 1  )

    # calculates the elapsed time
   
    tt=$((($(date +%s%N) - $ts)/1000000))

    # prints stats
    printf "[${ip_address}:${port_number}]\t[ELT]\t${tt}\tout\t${cmd_out}\n"

done

# the end of the program
echo "Finished: Client has issued ${request_count} requests."

