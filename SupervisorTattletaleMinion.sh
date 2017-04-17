#!/bin/bash

source /etc/environment

DOW=$(date +%A)
HOST=$(hostname)

if supervisorctl status | grep -v RUNNING | grep -v STARTING ; then
	echo "FAIL" > /tmp/SupervisorTattletaleMinion_${DOW}.fail;
	rm -rf /tmp/SupervisorTattletaleMinion_${DOW}.ok;
	if [ ! -f /tmp/SupervisorTattleTaleMinion_${DOW}.notified ]; then
		curl -X POST --data-urlencode 'payload={"channel": "#alertas", "username": "SupervisorTattletaleMinion", "text": "I was checking on the Supervisor in '$HOST' and cought an error. Check '$HOST' ", "icon_emoji": ":shit:"}' ${MINIONS_SLACK_WEBHOOK} && \
		echo "NOTIFIED" > /tmp/SupervisorTattletaleMinion_${DOW}.notified;
	fi
else
	echo "OK" > /tmp/SupervisorTattletaleMinion_${DOW}.ok;
	rm -rf /tmp/SupervisorTattletaleMinion_${DOW}.fail;
	rm -rf /tmp/SupervisorTattletaleMinion_${DOW}.notified;
fi;

