
while read line; do
#echo "$line" | awk -F "|" '{print $1}';
year=$(echo $line | awk -F "|" '{print $1}' | awk '{print substr($0,0,4)}');
month=$(echo $line | awk -F "|" '{print $1}' | awk '{print substr($0,5,2)}');
day=$(echo $line | awk -F "|" '{print $1}' | awk '{print substr($0,7,2)}');
hours=$(echo $line | awk -F "|" '{print $1}' | awk '{print substr($0,9,2)}');
minutes=$(echo $line | awk -F "|" '{print $1}' | awk '{print substr($0,11,2)}');
seconds=$(echo $line | awk -F "|" '{print $1}' | awk '{print substr($0,13,2)}');
requestLog=$(echo $line | cut -d'|' -f2-)
#requestLog=$(echo "$line" | awk -F "|" '{print $2 " "$3 " "  $4 " " $5 " "$6 " "  $7 " " $8 " " $9}');
echo $year"-"$month"-"$day" "$hours":"$minutes":"$seconds" | "$requestLog
 done < $1

