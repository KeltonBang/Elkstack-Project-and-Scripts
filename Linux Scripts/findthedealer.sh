Find the dealer by time .sh

cat $1 | awk '{print $1,$2,$5,$6}' | grep $2
