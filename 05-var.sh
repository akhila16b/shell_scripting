#!/bin/bash

start_time=$(date +%s)
echo "Start time = $start_time"
sleep 5
end_time=$(date +%s)
echo "End time = $end_time"

echo "Total time = $(($end_time-$start_time))"