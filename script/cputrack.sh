#!/bin/bash
# Usage: cputrack [output_filename]

ahn_pid=`cat log/adhearsion.pid`
timelimit=6000
freq=1

while [ "$SECONDS" -le "$timelimit" ] ; do
  mydate=`date "+%H:%M:%S"`
  top -p $ahn_pid -bn1 |grep $ahn_pid |awk '{print $1" "$9" ahn"}' | sed "s/^/$mydate /" |tee -a $1
  #ps pcpu time is an average utilization over the full runtime of the process
  #ps -p$ahn_pid -opid -opcpu -ocomm | grep $ahn_pid | sed "s/^/$mydate /" |tee $1
  sleep $freq
done
