# FastTech Foods Hackathon - Postgraduate in .NET Systems Architecture

This was the final project for the [**Postgraduate course in .NET Systems Architecture**.](https://postech.fiap.com.br/curso/arquitetura-sistemas-net/) The goal was build a proprietary digital platform for the FastTech Foods, focusing on scalability, observability, security, and automation. The solution replaces third-party tools to modernize and scale customer service and ordering services.

This repository centralizes the Kubernetes manifest files for deploying the infrastructure and microservices of the FastTech Foods project.

## Technologies Used
- **.NET 8.0**
- **Microservices Architecture**
- **Docker**
- **Kubernetes** (Orchestration)
- **RabbitMQ** (Messaging)
- **Zabbix and Grafana** (Observability)
- **GitHub Actions** (CI/CD)
- **SQL Server**
- **MongoDB**
- **Kong / API Gateway**

## Architecture
The solution's architecture is based on Domain-Driven Design (DDD) and microservices, with asynchronous event-driven communication. The Bounded Contexts were defined as follows:

1.  **Identity and Access**: Responsible for authenticating customers and employees.
2.  **Product Catalog - Manager**: Manages the registration, editing, and querying of menu items.
3.  **Product Catalog - Customer**:  Allows the customer to search for available products with filters like (Snacks, Juices , etc).
4.  **Orders**: Orchestrates the creation, processing, and cancellation of orders placed by customers.
5.  **Kitchen**: Manages the receipt and preparation flow of orders, allowing the kitchen staff to accept or reject items.

## Microservices Repositories
Each microservice has its own repository, promoting team autonomy and maintainability.

- **Identity and Access API:** [fasttech-auth-api](https://github.com/bribeiro1/FastTechFoods.AuthService)
- **Catalog API (Write/Admin):** [fasttech-catalog-write-api](https://github.com/Mauro-Benitez/FastTechFoods.ProductsManagerService)
- **Catalog API (Read/Client):** [fasttech-catalog-read-api](https://github.com/ErickGoldberg/FastTechFoods.ProductsService)
- **Orders API:** [fasttech-ordering-api](https://github.com/caiofabiogomes/OrderService)
- **Kitchen API:** [fasttech-kitchen-api](https://github.com/ffvieira/KitchenService)

## Kubernetes Environment Setup
This repository contains all the necessary manifest files (`.yaml`) to deploy the complete environment in a Kubernetes cluster.

## Postman Collection
To test the Api routes, import the Postman collection:
[Download](./postman/FastTechFoods.postman_collection.json)

## Colaborators
We would like to thank all the contributors to this project:
- [@caiofabiogomes](https://github.com/caiofabiogomes)
- [@ErickGoldberg](https://github.com/ErickGoldberg)
- [@mauro_benitez](https://github.com/Mauro-Benitez)
- [@bribeiro1](https://github.com/bribeiro1)
- [@ffvieira](https://github.com/ffvieira)
