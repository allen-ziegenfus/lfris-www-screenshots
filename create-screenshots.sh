#!/bin/bash

SERVER=https://www-dev.liferay.com/web
SERVER=https://www.liferay.com/web
create_screenshot() {


URL=$1

FILENAME=${URL////-}
FILENAME=${FILENAME/-/}

echo /usr/bin/firefox -P headless -headless --screenshot screenshots/${FILENAME}.jpg ${SERVER}${1}
/usr/bin/firefox -P headless -headless --screenshot screenshots/${FILENAME}.jpg ${SERVER}${1}
}


while IFS="" read -r p || [ -n "$p" ]
do
	create_screenshot $p
done < contentpages.txt
