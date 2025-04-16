FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y arp-scan iproute2 cron nmap && \
    apt-get clean

WORKDIR /app

COPY scan_reseau.sh exporter.py known_devices.txt prometheus_metrics.txt ./
RUN chmod +x scan_reseau.sh

CMD bash -c "\
    while true; do \
    ./scan_reseau.sh; \
    sleep 60; \
    done & \
    python3 exporter.py"
