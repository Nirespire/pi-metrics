
## Individual comamands to get necessary containers running for metrics collection and presentation
## Note, all command below use Docker host networking which is only available in Linux installations of Docker, 
## such as on a Raspberry Pi running Raspbian OS

# Start InfluxDB container
sudo docker run --rm -d --name=metricsdb --net=host --volume=/var/influxdb:/data influxdb

# Start the Telegraf container
sudo docker run --rm -d --net=host --name telegraf -v $PWD/telegraf.conf:/etc/telegraf/telegraf.conf:ro telegraf

# Create docker volume for grafana storage
sudo docker run -d -v /var/lib/grafana --name grafana-storage busybox

# Start the Grafana container
sudo docker run -d --rm --net=host --name grafana --user root --volumes-from grafana-storage grafana/grafana
