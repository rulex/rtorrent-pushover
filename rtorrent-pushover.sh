#!/bin/bash

userkey="XXXXXXXX"
apitoken="ZZZZZZZZZZZ"

tname=$1
ts=$(date +%s)

curly=`curl https://api.pushover.net/1/messages.json -d "token=${apitoken}&user=${userkey}&title=Torrent&message=${tname}&timestamp=${ts}"`
echo ${ts} ${tname} ${curly} >> ~/.rtorrent-pushover.log

