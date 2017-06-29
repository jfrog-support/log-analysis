#!/bin/bash
# This script finds rows on the Artifactory request.log that have a request time >= to the specified time in millis.
# Execute the script by running:
# sh requestTimeFinder.sh request.log 3000

# Args:
# $1 = filename (you can use *)
# $2 = request time (request time >= $2)

for i in `cat $1| awk -F "|" '{print "request_user:"$5"&request_date:"$1"&request_time:"$2"&request_method:"$6"&request_path:"$7}'`
do
	echo $i > temp
	TIME=`cat temp| awk -F "&" '{print $3}'| awk -F ":" '{print $2}'| awk '{$1=$1};1'`
	if [ $TIME -ge $2 ]; then
		echo "Row: " $i
    fi
done

