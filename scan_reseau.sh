#!/bin/bash

INTERFACE="wlp1s0"
NETWORK="192.168.1.0/24"
KNOWN_DEVICES="/app/known_devices.txt"
OUTPUT_METRICS="/app/prometheus_metrics.txt"

echo "🔍 Scan du réseau $NETWORK via l'interface $INTERFACE..."

# Lancer arp-scan
SCAN=$(arp-scan --interface=$INTERFACE $NETWORK)

echo "➡️ Récupération des IP et adresses MAC..."

# Nettoyer les anciennes métriques
echo "# HELP reseau_device_count Nombre total d'appareils détectés" > $OUTPUT_METRICS
echo "# TYPE reseau_device_count gauge" >> $OUTPUT_METRICS

DEVICE_COUNT=$(echo "$SCAN" | grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3}\s" | wc -l)
echo "reseau_device_count $DEVICE_COUNT" >> $OUTPUT_METRICS

echo "# HELP reseau_device_known Appareil connu (1 = oui, 0 = non)" >> $OUTPUT_METRICS
echo "# TYPE reseau_device_known gauge" >> $OUTPUT_METRICS

# Analyser les résultats
echo "$SCAN" | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}\s" | while read -r IP MAC REST; do
    DEVICE_NAME=$(grep -i "$MAC" "$KNOWN_DEVICES" | cut -d' ' -f2-)
    if [ -n "$DEVICE_NAME" ]; then
        echo "reseau_device_known{ip=\"$IP\",mac=\"$MAC\",name=\"$DEVICE_NAME\"} 1" >> $OUTPUT_METRICS
    else
        echo "reseau_device_known{ip=\"$IP\",mac=\"$MAC\",name=\"unknown\"} 0" >> $OUTPUT_METRICS
    fi
done
