#!/bin/bash
source /home/ubuntu/minions/MinionsMind.sh

masterSay "How is elasticsearch machine doing ?"

curl -XGET http://localhost:9200/_cluster/health?pretty=true | grep status | grep  -q green && \
sayHappy 'ElasticSearchCutucatorMinion' 'ElasticSearch health status is GREEN!' || \
sayFail 'ElasticSearchCututatorMinion' 'ElasticSearch health status is NOT GREEN!' "Check the ${HOSTNAME} machine and restore normal operation."


MSG=`curl -s -XGET http://localhost:9200/_cluster/health?pretty=true  | grep number_of_data_nodes | sed "s#.*:#Number of DataNodes:#"`
say 'ElasticSearchCutucatorMinion' """$MSG"""
