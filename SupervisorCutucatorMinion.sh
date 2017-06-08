#!/bin/bash
source /home/ubuntu/minions/MinionsMind.sh

DOW=$(date +%A)
HOST=$(hostname)

if supervisorctl status | grep -v RUNNING | grep -v STARTING ; then
	echo "FAIL" > /tmp/SupervisorCutucatorMinion_${DOW}.fail;
	rm -rf /tmp/SupervisorCutucatorMinion_${DOW}.ok;
	if [ ! -f /tmp/SupervisorCutucatorMinion_${DOW}.notified ]; then
		sayFail 'SupervisorCutucatorMinion'  'ElasticSearch Supervisor is NOT GREEN!' "Check '$HOST' machine and restore normal operation!" && \
		echo "NOTIFIED" > /tmp/SupervisorCutucatorMinion_${DOW}.notified;
	fi
else
	echo "OK" > /tmp/SupervisorCutucatorMinion_${DOW}.ok;
	rm -rf /tmp/SupervisorCutucatorMinion_${DOW}.fail;
	rm -rf /tmp/SupervisorCutucatorMinion_${DOW}.notified;
fi;

