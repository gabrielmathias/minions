#!/bin/bash
source /etc/environment

DOW=$(date +%A)

rm -rf  /backups/old/alexandria_backup && echo "Removing old backup" || echo "No old backup to remove"

mv /backups/alexandria_${DOW} /backups/old/alexandria_backup && echo "Moving the old backup to old folder" || echo "No old backup found to move to old folder" 

git clone --mirror git@github.com:adjetiva/alexandria.git /backups/alexandria_${DOW} && \

curl -X POST --data-urlencode 'payload={"channel": "#desenvolvimento", "username": "GitHubBackupMinion", "text": "Just made a backup of alexandria repository in the Jenkins Machine.", "icon_emoji": ":wink:"}' ${MINIONS_SLACK_WEBHOOK} || \

curl -X POST --data-urlencode 'payload={"channel": "#alertas", "username": "GitHubBackupMinion", "text": "I FAILED TO BACKUP THE Alexandia GitHub Repository from GitHub Today. Take a look in the Jenkins machine.", "icon_emoji": ":shit:"}' ${MINIONS_SLACK_WEBHOOK}
