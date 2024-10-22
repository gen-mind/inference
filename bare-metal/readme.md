
# 🖥️ **Bare Metal LLM Deployment Guide**

This guide will walk you through deploying a custom LLM on a **bare-metal server** running **Ubuntu** with a **GPU**. The setup includes everything needed to serve an LLM, including **NVIDIA drivers** and **Docker** with GPU support.

## 🛠️ **Steps to Deploy the LLM on Bare Metal**

### Start with a Fresh Ubuntu Server

Ensure you have a **fresh installation of Ubuntu** with a **GPU** available on your server.

### Clone the Repository

First, clone this repository to your server:

```bash
git clone https://github.com/gen-mind/inference.git
cd inference/bare-metal
```

### Provisioning the Server

Run the provisioning script to install all the necessary components. This will:
- Install **NVIDIA drivers** and **CUDA toolkit**
- Set up **Docker** with GPU support
- Install all dependencies required for the LLM deployment

```bash
cd deployment
./deployment/provision.sh
```

### Adjust Configuration

Edit the `config/common/common.env` file to set up your domain and SSL email:

```bash
nano config/common/common.env
```

Modify the following variables:

```env
INFERENCE_SSL_EMAIL=your@mail
BASE_DOMAIN=your domain eg ai.genmind.ch
CHAT_DOMAIN=your domain eg chat.genmind.ch
INFERENCE_DOMAIN=your domain eg inference.genmind.ch
```

Make sure to set up your **DNS** to point to your server's public IP for each of these domains.

### Deploy the Inference Server

Bring up the containers:

```bash
./deployment/inference.sh up -d
```

This will launch the inference server, ready to serve LLM requests.

### Access the LLM UI

Once the deployment is complete, you can access the LLM via the following domains:

- **LLM UI**: `CHAT_DOMAIN`
- **LLM Inference Server**: `INFERENCE_DOMAIN`
---

### Access Portainer and Grafana

You can access Portainer and Grafana at the following links:

- **Portainer**: `BASE_DOMAIN/portainer`
- **LLM UI**: `BASE_DOMAIN/grafana`


Feel free to reach out for any questions or contribute to improving this deployment guide!

---

### Grafana dashboards
The goal is to have all the Grafana data sources and dashboards provisioned by the installation
At the moment Prometheus and Loki data sources are provisioned automatically as well as on traefik dashboard.
We strongly suggest to manually install the following awesome dashboards until we find a way to provision them automatically 

- [Node exporter full](https://grafana.com/grafana/dashboards/1860-node-exporter-full/)
- [NVIDIA GPU metrics](https://grafana.com/grafana/dashboards/14574-nvidia-gpu-metrics/)
- [TGI](https://github.com/huggingface/text-generation-inference/blob/main/assets/tgi_grafana.json) 
- [TGI](https://grafana.com/grafana/dashboards/19831-text-generation-inference-dashboard/)
- [Traefik](https://grafana.com/grafana/dashboards/17346-traefik-official-standalone-dashboard/)
- [Traefik](https://grafana.com/grafana/dashboards/4475-traefik/)