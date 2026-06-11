# Projeto 04 — Containerização (Berenice)

Sistema **Berenice** containerizado em Docker, com autenticação centralizada via Keycloak.
Cada componente roda em um container Docker isolado, em sua respectiva máquina virtual.

## Arquitetura

| Componente | Tecnologia | VM | Porta |
|------------|-----------|-----|-------|
| Frontend | Angular + NGINX | VM Front | 80 |
| Backend | Java (Spring Boot) + Tomcat | VM Back | 8080 |
| Keycloak | Keycloak + MariaDB | VM Database | 5001 |

O fluxo de autenticação: o navegador acessa o **Frontend**, que chama a API do **Backend**,
que por sua vez valida o token JWT no **Keycloak**. O banco de dados (MariaDB) armazena os
dados da aplicação e do Keycloak.

> **Importante:** cada container é gerido de forma isolada com `docker run` (sem docker-compose),
> conforme o requisito do projeto.

## Pré-requisitos

- Docker instalado nas 3 VMs
- MariaDB rodando na VM Database (porta 3306) com os bancos `berenice` e `keycloak`
- As 3 VMs na mesma rede, alcançáveis entre si
- Relógios das VMs sincronizados (importante: relógio dessincronizado quebra a validação do token JWT)

## Configuração de rede

Os IPs mudam conforme a rede. Antes de cada deploy, descubra os IPs atuais das VMs:

```sh
ip a | grep "inet "   # rode em cada VM, procure o IP da interface principal (ex: eth1)
```

Substitua nos comandos abaixo:
- `IP_VM_BACK` → IP da VM Backend
- `IP_VM_DB` → IP da VM Database (banco + Keycloak)

## Deploy

A ordem recomendada é: **Database/Keycloak → Backend → Frontend**.

Veja o README de cada pasta para os comandos específicos:
- [`keycloak/`](./keycloak) — passo 1
- [`backend/`](./backend) — passo 2
- [`frontend/`](./frontend) — passo 3

## Credenciais (exemplo)

> ⚠️ Os comandos usam placeholders. Substitua pelas senhas reais do seu ambiente.
> **Nunca** comite senhas reais em repositório público.

- Banco da aplicação (`berenice`): usuário e senha próprios
- Banco do Keycloak (`keycloak`): usuário e senha próprios
- Keycloak admin: definido na criação do container

## Sincronização de relógio (todas as VMs)

```sh
chronyc makestep && date
# se não corrigir, ajuste manual:
# date -s "AAAA-MM-DD HH:MM:00"
```
