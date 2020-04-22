#!/bin/bash

SERVER=https://www.liferay.com
#FIREFOX=/Applications/Firefox.app/Contents/MacOS/firefox
FIREFOX=/usr/bin/firefox

create_screenshot() {
    URL=$1
    FOLDERNAME=$2

    FILENAME=${URL////-}
    FILENAME=${FILENAME/-/}

    echo ${FIREFOX} -P headless -headless --screenshot screenshots/${FOLDERNAME}/desktop/${FILENAME}.jpg ${SERVER}${URL}
    ${FIREFOX} -P headless -headless --screenshot --window-size=1200 screenshots/${FOLDERNAME}/desktop/${FILENAME}.jpg ${SERVER}${URL}
    echo ${FIREFOX} -P headless -headless --screenshot screenshots/${FOLDERNAME}/mobile/${FILENAME}.jpg ${SERVER}${URL}
    ${FIREFOX} -P headless -headless --screenshot --window-size=600 screenshots/${FOLDERNAME}/mobile/${FILENAME}.jpg ${SERVER}${URL}
}

while IFS="" read -r p || [ -n "$p" ]
do
    create_screenshot $p "contentpages"
done < contentpages.txt

while IFS="" read -r p || [ -n "$p" ]
do
    create_screenshot $p "toppages"
done < toppages.txt