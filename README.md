rtorrent-pushover
=================

Pushes names of finished torrents in rtorrent to your phone


#Howto

* Download script and edit userkey and apitoken
* Put ```system.method.set_key = event.download.finished,notify_me,"execute=~/path/to/rtorrent-pushover.sh,$d.get_name="```

