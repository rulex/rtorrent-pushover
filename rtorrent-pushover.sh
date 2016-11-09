#!/bin/bash

# pushover settings
userkey="XXXXXXXX"
apitoken="ZZZZZZZZZZZ"

tname=$1
ts=$(date +%s)

# notify-send
if [[ -x $( which notify-send ) ]]; then
    notify-send -t 60000 -a rtorrent "${tname}"
fi

# also notify tmux
if [[ -x $( which tmux ) ]]; then
    tmux display-message "Torrent: ${tname}"
fi

# pushover
curly=$(curl https://api.pushover.net/1/messages.json -d "token=${apitoken}&user=${userkey}&title=Torrent&message=${tname}&timestamp=${ts}")
echo ${ts} ${tname} ${curly} >> ~/.rtorrent-pushover.log
