# First:
I talk to Slack, so grabe me a token key and put it in /etc/environment, like this:  

MINIONS_SLACK_WEBHOOK=https://hooks.slack.com/services/XXXXXXXX/BBBBBBBBBB/RanDoMChar4ct3rs


# Put me in your crontab hourly or half-hourly is best

0,30 * * * * /home/ubuntu/minions/SupervisorTattletaleMinion.sh > /home/ubuntu/logs/SupervisorTattletaleMinion.log 2> /home/ubuntu/logs/SupervisorTattletaleMinion.err
