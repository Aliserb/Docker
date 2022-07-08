FROM debian:stable

RUN apt-get update && apt-get install -y cron rsyslog

COPY cron /etc/cron.d/kode-test-task

CMD service rsyslog start && service cron start && crontab /etc/cron.d/kode-test-task && tail -f /var/log/syslog
