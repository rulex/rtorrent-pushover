rtorrent-pushover
=================

Pushes names of finished torrents in rtorrent to your phone

Howto
=====

* Clone repo
* Edit your *.rtorrent.rc*, replace PUSHOVER_TOKEN, PUSHOVER_USERKEY and /path/to/rtorrent-pushover.sh with your details:
```config
method.insert = cfg.pushover.userkey, private|const|string, (cat,"PUSHOVER_USERKEY")
method.insert = cfg.pushover.apitoken, private|const|string, (cat,"PUSHOVER_TOKEN")
system.method.set_key = event.download.finished,notify_me,"execute=~/path/to/rtorrent-pushover.sh,$d.get_name="
```

