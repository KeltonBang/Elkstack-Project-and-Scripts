IP lookup.sh

curl -s http://ipinfo.io/$1 | grep -i "country" | awk '{print $2}' | sed 's/\",//g' | sed 's/\"//g'
