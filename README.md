# Pi Metrics 🥧

Simple system metrics collection and monitoring using [InfuxDB](https://www.influxdata.com/), [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/), and [Grafana](https://grafana.com/) running in [Docker](https://www.docker.com/) using [Docker Compose](https://docs.docker.com/compose/).

![GitHub Logo](/images/metrics.png)

## Requirements

- Docker
- Docker Compose

## Quickstart

### Start the Containers

```bash
docker-compose up -d
```

This will create a network called `pi-metrics_default` and start 3 containers running on that network with the following images:

- influxdb
- telegraf
- grafana/grafana

Run `docker ps` to check the container statuses.

Run `docker-compose logs` to check container logs.

### Grafana Setup

Grafana might need permission to write to the mounted directory for it's data.
Run `sudo chown -R 472:472 /var/lib/grafana/` where `/var/lib/grafana` is the default directory where data is stored on the host machine.

Once the container processes have started, you can access the Grafana dashboard at http://localhost:3000 .

Default Grafana credentials are `admin/admin`.

On first run, go to `Configuration > Data Sources` and add an InfluxDB datasource and edit the following details:

- url: `http://metricsdb:8086`
- database: `telegraf`

`Save & Test` the connection. Once successful, you can go to `Dashboards > Manage` and create a new Dashboard. Select your InfluxDB datasouce and pick some default system metrics being reported like `disk` or `cpu` to visualize.

Telegraf is also configured to ping the `8.8.8.8` DNS server as well as some common websites like Google and Amazon to poll and record network latencies.

### Customizations

The `telegraf.conf` file can be edited to report on many more metrics. You can check the [telegraf docs](https://docs.influxdata.com/telegraf/v1.14/administration/configuration/) for more information or check the [full example conf file](https://github.com/influxdata/telegraf/blob/master/etc/telegraf.conf).

## Acknowledgements

This was created by roughly following a tutorial [here](https://medium.com/@petey5000/monitoring-your-home-network-with-influxdb-on-raspberry-pi-with-docker-78a23559ffea) with some enhancements.

The commands used in the original tutorial (which was written specifically to be run on a Raspberry Pi) can be found in the `setup.sh` script.
