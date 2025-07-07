# 1. Adicionar repositório Helm do Prometheus + Grafana
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# 2. Instalar Prometheus + Grafana com Helm, incluindo o plugin Zabbix
helm install kube-monitoring prometheus-community/kube-prometheus-stack  -f grafana-zabbix-values.yaml


# Acesse o Grafana depois via http://localhost:<porta-do-NodePort>
# Login: admin / admin

# 3. Adicionar repositório Helm do Zabbix
helm repo add zabbix-chart https://zabbix-community.github.io/helm-zabbix
helm repo update

# 4. Instalar o Zabbix
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.26/deploy/local-path-storage.yaml
helm install zabbix zabbix-community/zabbix `
  --set zabbixserver.enabled=true `
  --set zabbixweb.enabled=true `
  --set postgresql.enabled=true `
  --set postgresql.postgresqlDatabase=zabbix `
  --set postgresql.postgresqlUsername=zabbix `
  --set postgresql.postgresqlPassword=zabbix `
  --set zabbixserver.replicaCount=1 `
  --set zabbixwebservice.enabled=true `
  -f ./observability/zabbix-personalizations.yaml


 
kubectl apply -f prometheus.yaml
kubectl apply -f grafana.yaml
kubectl apply -f zabbix-agent.yaml
