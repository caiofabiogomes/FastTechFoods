# 1. Criar namespace de observabilidade
kubectl create namespace observability

# 2. Adicionar repositório Helm do Prometheus + Grafana
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# 3. Instalar Prometheus + Grafana com Helm, incluindo o plugin Zabbix
helm install kube-monitoring prometheus-community/kube-prometheus-stack  -f grafana-zabbix-values.yaml


# Acesse o Grafana depois via http://localhost:<porta-do-NodePort>
# Login: admin / admin

# 4. Adicionar repositório Helm do Zabbix
helm repo add zabbix-chart https://zabbix-community.github.io/helm-zabbix
helm repo update

# 5. Instalar o Zabbix
helm install zabbix zabbix-community/zabbix --set zabbixserver.enabled=true --set zabbixweb.enabled=true --set postgresql.enabled=true --set postgresql.postgresqlDatabase=zabbix --set postgresql.postgresqlUsername=zabbix --set postgresql.postgresqlPassword=zabbix --set zabbixserver.replicaCount=1 --set zabbixwebservice.enabled=true


 
kubectl apply -f prometheus.yaml
kubectl apply -f grafana.yaml
kubectl apply -f zabbix-agent.yaml
