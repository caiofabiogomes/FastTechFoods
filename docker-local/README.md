# Local Infrastructure with Docker Compose

This setup provides a simplified version of the project's infrastructure for local testing.

## Prerequisites

- Docker
- Docker Compose

## How to use

1. Navigate to this directory:
   ```bash
   cd docker-local
   ```

2. Start the infrastructure:
   ```bash
   docker-compose up -d
   ```

## Services and Ports

- **Kong (API Gateway):** http://localhost:8000
- **RabbitMQ Management:** http://localhost:15672 (guest/guest)
- **MongoDB:** localhost:27017 (user/pass)
- **SQL Server:** localhost:1433 (SA_PASSWORD=YourStrong!Password)
- **Prometheus:** http://localhost:9090
- **Grafana:** http://localhost:3001 (admin/admin)

### Individual Microservices (Direct Access)

- **Auth Service:** http://localhost:8081
- **Kitchen Service:** http://localhost:8082
- **Manager Menu Service:** http://localhost:8083
- **Menu Service:** http://localhost:8084
- **Order Service:** http://localhost:8085

## Note

The microservices are configured to communicate with each other and the infrastructure using Docker container names. Kong is configured to route traffic to the services as follows:

- `/orders` -> Order Service
- `/auth` -> Auth Service
- `/managermenu` -> Manager Menu Service
- `/kitchen` -> Kitchen Service
- `/menu` -> Menu Service
