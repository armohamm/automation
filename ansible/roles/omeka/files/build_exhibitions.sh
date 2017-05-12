#!/bin/sh

LOGFILE=/tmp/build_exhibitions.log

echo "starting." > $LOGFILE

echo "rsync home to /srv/www ..." >> $LOGFILE
/usr/bin/rsync -rIptolgC --delete --checksum --delay-updates \
    --exclude 'themes/dpla/exhibitions-assets' \
    --exclude 'application/logs' \
    --exclude 'files' \
    --exclude 'plugins/Dropbox/files' \
    /home/omeka/exhibitions/ /srv/www/exhibitions

if [ $? -ne 0 ]; then
	exit 1
fi

echo "rsync exhibitions-assets ..." >> $LOGFILE
/usr/bin/rsync -rIptolgC --delete --checksum --delay-updates \
    /home/omeka/exhibitions-assets/ /srv/www/exhibitions/themes/dpla/exhibitions-assets

echo "done." >> $LOGFILE
