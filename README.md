# 📡 Projet de Surveillance Réseau Local

Ce projet permet de **scanner le réseau local**, d’identifier les **appareils connectés**, de distinguer les **connus des inconnus**, et d'**exporter les données vers Prometheus** pour un affichage dans **Grafana**.

---

## ⚙️ Fonctionnalités

- 🔍 Scan régulier du réseau local avec `arp-scan`
- 📁 Gestion d'une liste d'appareils connus (par adresse MAC)
- 📊 Export des métriques sur le port 9100 pour y acceder depuis Prometheus
- 📦 Projet entièrement conteneurisé avec Docker

---

## 🚀 Lancer le projet

### 1. 🛠️ Prérequis

- docker
- docker-compose
- Interface réseau configurée (ex: `wlan0`, `eth0`, `wlp1s0`…)
- Grafana et Prometheus configuré

### 2. 🔧 Configuration

- Modifie `known_devices.txt` pour lister les adresses MAC que tu connais.
- Dans `scan_reseau.sh`, adapte l’interface réseau si besoin

### 3. ▶️ Démarrage

```bash
docker-compose up --build
```
---

---

## 📦 Metrics exposées

| Métrique                   | Description                                 |
|----------------------------|---------------------------------------------|
| `reseau_device_count`      | Nombre total d'appareils détectés           |
| `reseau_device_known`      | Infos enrichies : IP / MAC / Nom (ou unknown) |

---

## 📚 Licence

Projet personnel – libre de réutilisation et amélioration ✅  

---

## 🤝 Collaborations

Les contributions sont les bienvenues ! N'hésitez pas à soumettre des issues ou des pull requests.

---

## ✍️ Auteur

Solal Bouzanquet – 2025  