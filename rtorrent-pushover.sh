#!/bin/bash

LOGFILE="${HOME}/.rtorrent-pushover.log"


ts=$(date -Iseconds)
if [ ! -f ${LOGFILE} ]; then
    touch ${LOGFILE} || exit 1
fi

if [ ${#} -lt 1 ]; then
    str=" (Too few args.)"
    echo ${str}
    echo "${ts} ${str}" >> ${LOGFILE}
    exit 2
fi

tname=$1

# notify-send
if [[ -x $( which notify-send ) ]]; then
    notify-send -t 60000 -a rtorrent "${tname}"
fi

# also notify tmux
if [[ -x $( which tmux ) ]]; then
    tmux display-message "Torrent: ${tname}"
fi

# pushover settings
userkey=${2:-""}
apitoken=${3:-""}

if [ "${userkey}" == "" ] || [ "${apitoken}" == ""]; then
    str=" (Missing pushover settings. Skipping pushover notification)"
    echo ${str}
    curly=${str}
else
    curly=$(curl https://api.pushover.net/1/messages.json -d "token=${apitoken}&user=${userkey}&title=Torrent&message=${tname}&timestamp=${ts}")
fi

# log to file
echo ${ts} ${tname} ${curly} >> ${LOGFILE}

