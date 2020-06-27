sudo docker run --rm -d --name=metricsdb --net=host --volume=/var/influxdb:/data influxdb


sudo docker exec -it metricsdb /usr/bin/influx

createdb.sql:

CREATE DATABASE metricsdb
use metricsdb
CREATE USER root WITH PASSWORD 'opensesame' WITH ALL PRIVILEGES
GRANT ALL PRIVILEGES ON metricsdb TO root

sudo docker run --rm telegraf telegraf config > telegraf.conf # pull container telegraph config

sudo docker run --rm -d --net=host --name telegraf -v $PWD/telegraf.conf:/etc/telegraf/telegraf.conf:ro telegraf


sudo docker run -d -v /var/lib/grafana --name grafana-storage busybox

sudo docker run -d --rm --net=host --name grafana --user root --volumes-from grafana-storage grafana/grafana