#!/bin/bash
source /etc/environment

function sayFail
{
        curl -X POST --data-urlencode "payload={\"channel\":\"#alerts\",\"username\":\"""$1""\",\"text\":\"FAIL :bangbang::scream:\",\"icon_emoji\":\":hankey:\",\"attachments\":[{\"color\":\"#a6364f\",\"fields\":[{\"title\":\"""$2""\",\"value\":\"""$3""\",\"short\":false}],\"footer\":\"""$4""\"}]}" ${MINIONS_SLACK_WEBHOOK}

}

function masterSay
{
	curl -X POST --data-urlencode "payload={\"channel\":\"#general\",\"username\":\"MasterMinion\",\"text\":\"""$1""\",\"icon_emoji\":\":fearful:\"}" ${MINIONS_SLACK_WEBHOOK}
}

function sayFearful
{
	curl -X POST --data-urlencode "payload={\"channel\":\"#general\",\"username\":\"""$1""\",\"text\":\"""$2""\",\"icon_emoji\":\":fearful:\"}" ${MINIONS_SLACK_WEBHOOK}
}

function sayWorried
{
	curl -X POST --data-urlencode "payload={\"channel\":\"#general\",\"username\":\"""$1""\",\"text\":\"""$2""\",\"icon_emoji\":\":worried:\"}" ${MINIONS_SLACK_WEBHOOK}
}

function sayHappy
{
	curl -X POST --data-urlencode "payload={\"channel\":\"#general\",\"username\":\"""$1""\",\"text\":\"""$2"":+1:\",\"icon_emoji\":\":wink:\"}" ${MINIONS_SLACK_WEBHOOK}
}

function say
{
	curl -X POST --data-urlencode "payload={\"channel\":\"#general\",\"username\":\"""$1""\",\"text\":\"""$2""\",\"icon_emoji\":\":wink:\"}" ${MINIONS_SLACK_WEBHOOK}
}
