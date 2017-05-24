#!/bin/bash
source /home/ubuntu/minions/MinionsMind.sh

if [ ! -d /alexandria-s3-backups/hdfs ]; then
	s3fs alexandria-backups /alexandria-s3-backups
fi

if [ -d /alexandria-s3-backups/hdfs ]; then
	sayFearful "MasterMinion" "S3RsyncMinion! Please do a backup of /hdfs/csv and /hdfs/storage as soon as possible!"

	echo -n "before: " >> /alexandria-s3-backups/hdfs_csv_backup.log
	date >> /alexandria-s3-backups/hdfs_csv_backup.log
	rsync -avz /hdfs/csv /alexandria-s3-backups/hdfs/csv >> /alexandria-s3-backups/hdfs_csv_backup.log && \
	sayHappy "S3RsyncMinion" "Just made a backup of hdfs/csv in the Amazon S3."  || \
	sayFail "S3RsyncMinion" "Backup of /hdfs/csv in the Amazon S3 has failed!" "Check the '${HOSTNAME}' machine"
	echo -n "after: " >> /alexandria-s3-backups/hdfs_csv_backup.log
	date >> /alexandria-s3-backups/hdfs_csv_backup.log
	

	echo -n "before: " >> /alexandria-s3-backups/hdfs_storage_backup.log
	date >> /alexandria-s3-backups/hdfs_storage_backup.log
	rsync -avz /hdfs/storage /alexandria-s3-backups/hdfs/storage >> /alexandria-s3-backups/hdfs_storage_backup.log  && \
	sayHappy "S3RsyncMinion" "Just made a backup of hdfs/storage in the Amazon S3."  || \
	sayFail "S3RsyncMinion" "Backup of /hdfs/storage in the Amazon S3 has failed!" "Check the '${HOSTNAME}' machine"
	echo -n "after: " >> /alexandria-s3-backups/hdfs_storage_backup.log
	date >> /alexandria-s3-backups/hdfs_storage_backup.log

fi
# curl -X POST --data-urlencode 'payload={"channel": "#desenvolvimento", "username": "S3RsyncMinion", "text": "Just made a backup of alexandria repository in the Jenkins Machine.", "icon_emoji": ":wink:"}' ${MINIONS_SLACK_WEBHOOK} || \
#curl -X POST --data-urlencode 'payload={"channel": "#alertas", "username": "S3RsyncMinion", "text": "I FAILED TO BACKUP THE Alexandia GitHub Repository from GitHub Today. Take a look in the Jenkins machine.", "icon_emoji": ":shit:"}' ${MINIONS_SLACK_WEBHOOK}
