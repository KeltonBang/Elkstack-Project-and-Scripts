 Log Analysis.sh

cat $1 |sed 's/INCORRECT_PASSWORD/ACCESS_DENIED/g' >
cat $1 |awk ' {print $4, $6}' >  
