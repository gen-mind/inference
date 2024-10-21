#!/bin/bash

# Ensure USER are set

if [ -z "$USER" ]; then
  echo "USER is not set. Exiting."
  exit 1
fi

# Function to check if directory exists, then create it or verify permissions
ensure_dir() {
  dir_path=$1
  user=$2
  group=$3

  if [ ! -d "$dir_path" ]; then
    echo "Creating directory: $dir_path"
    sudo mkdir -p "$dir_path"
    sudo chown "$user:$group" "$dir_path"
    sudo chmod 755 "$dir_path"
  else
    echo "Directory already exists: $dir_path"
    current_owner=$(stat -c "%U:%G" "$dir_path")
    expected_owner="$user:$group"
    if [ "$current_owner" != "$expected_owner" ]; then
      echo "Fixing ownership of $dir_path to $user:$group"
      sudo chown "$user:$group" "$dir_path"
    fi
    sudo chmod 755 "$dir_path"
  fi
}

# Ensure directories exist and have correct permissions
ensure_dir "data" "$USER" "$USER"
ensure_dir "data/portainer" "$USER" "$USER"
ensure_dir "data/letsencrypt" "$USER" "$USER"
ensure_dir "data/anythingllm" "$USER" "$USER"
ensure_dir "data/loki" "$USER" "$USER"
ensure_dir "data/portainer/compose" "$USER" "$USER"
ensure_dir "data/portainer/tls" "$USER" "$USER"
ensure_dir "data/portainer/chisel" "$USER" "$USER"
ensure_dir "data/prometheus" "$USER" "$USER"
ensure_dir "data/certificates" "$USER" "$USER"
ensure_dir "data/certificates/www" "$USER" "$USER"
ensure_dir "data/certificates/conf" "$USER" "$USER"
ensure_dir "data/authentik" "$USER" "$USER"
ensure_dir "data/authentik/postgres" "$USER" "$USER"
ensure_dir "data/authentik/certs" "$USER" "$USER"
ensure_dir "data/authentik/redis" "$USER" "$USER"
ensure_dir "data/authentik/media" "$USER" "$USER"
ensure_dir "data/authentik/media/custom-templates" "$USER" "$USER"
ensure_dir "data/authentik/media/public" "$USER" "$USER"
ensure_dir "data/models" "$USER" "$USER"
ensure_dir "data/grafana/provisioning" "$USER" "$USER"
ensure_dir "data/grafana/data" "$USER" "$USER"

# Ensure data/grafana directories exist and have correct permissions
ensure_dir "data/grafana/provisioning" 472 472  # Grafana UID and GID
ensure_dir "data/grafana/data" 472 472  # Grafana UID and GID


sudo chown 472:472 data/grafana/data  # Set ownership to Grafana's UID and GID
sudo chmod 755 data/grafana/data      # Set permissions


# Verify if Docker networks exist, if not, create them as external
check_and_create_network() {
  network_name=$1
  if ! docker network ls --format "{{.Name}}" | grep -q "^$network_name\$"; then
    echo "Creating external Docker network: $network_name"
    docker network create --driver bridge "$network_name"
  else
    echo "Docker network already exists: $network_name"
  fi
}

check_and_create_network "frontend-network"
check_and_create_network "backend-network"


# Check if combined.env exists, if not create it
COMBINED_ENV="config/combined.env"

if [ ! -f "$COMBINED_ENV" ]; then
  touch "$COMBINED_ENV"
fi

# Combine environment variables from anythingllm.env and common.env
cat config/anythingllm/anythingllm.env config/common/common.env config/tgi/tgi.env > "$COMBINED_ENV"

echo "updated $COMBINED_ENV"

# calling all necessary compose,y passing -p
# will create different stacks in portainer
docker compose \
  -p infra \
  --env-file config/combined.env \
  -f deployment/compose-infra.yml \
  "$@"

docker compose \
  -p inference \
  --env-file config/combined.env \
  -f deployment/compose-inference.yml \
  "$@"

docker compose \
  -p observability \
  --env-file config/combined.env \
  -f deployment/compose-observability.yml \
  "$@"

# Final message for authentik
echo "Important: the first time you install authentik"
echo "go to /if/flow/initial-setup/"
echo "You also need to login authentik admin and setup application/provider for each service you want to use authentik auth"
