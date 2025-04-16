# 📡 Projet de Surveillance Réseau Local

Ce projet permet de **scanner le réseau local**, d’identifier les **appareils connectés**, de distinguer les **connus des inconnus**, et d'**exporter les données vers Prometheus** pour affichage dans **Grafana**.

---

## ⚙️ Fonctionnalités

- 🔍 Scan régulier du réseau local avec `arp-scan`
- 📁 Gestion d'une liste d'appareils connus (par adresse MAC)
- 📊 Export des métriques vers Prometheus
- 📈 Dashboard Grafana prêt à l’emploi
- 📦 Projet entièrement conteneurisé avec Docker Compose

---

## 🚀 Lancer le projet

### 1. 🛠️ Prérequis

- Docker
- Docker Compose
- Interface réseau configurée (ex: `wlan0`, `eth0`, `wlp1s0`…)
- Grafana et Prometheus configuré

### 2. 🔧 Configuration

- Modifie `appareils_connus.json` pour lister les MAC que tu connais.
- Dans `scan_reseau.sh`, adapte l’interface réseau si besoin

### 3. ▶️ Démarrage

```bash
docker-compose up -d
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

## ✍️ Auteur

Solal Bouzanquet – 2025  