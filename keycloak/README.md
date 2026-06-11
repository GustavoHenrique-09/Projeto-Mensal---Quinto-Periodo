# Keycloak — Berenice (VM Database)

Servidor de identidade Keycloak em container, usando MariaDB como banco de dados.
Roda como `docker run` isolado (sem docker-compose), conforme o requisito do projeto.

## Pré-requisito: MariaDB

O Keycloak depende de um banco MariaDB rodando na VM Database (porta 3306) com:
- Um banco de dados chamado `keycloak`
- Um usuário com acesso a esse banco

Verifique se o MariaDB está rodando:
```sh
ps aux | grep -i maria | grep -v grep
```

## Run

> Substitua `IP_VM_DB` pelo IP da VM Database e as senhas/credenciais pelos valores reais do seu ambiente.
> **Nunca** comite senhas reais em repositório público.

```sh
docker run -d --name meu_keycloak_mysql \
  -p 5001:8080 \
  -e KC_DB=mariadb \
  -e KC_DB_URL_HOST=IP_VM_DB \
  -e KC_DB_URL_PORT=3306 \
  -e KC_DB_URL_DATABASE=keycloak \
  -e KC_DB_USERNAME=SEU_USUARIO_DB \
  -e KC_DB_PASSWORD=SUA_SENHA_DB \
  -e KC_HOSTNAME_STRICT=false \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=SUA_SENHA_ADMIN \
  quay.io/keycloak/keycloak:latest start-dev
```

### O que cada parâmetro faz
- `-p 5001:8080` — mapeia a porta 5001 do host para a 8080 do container (Keycloak)
- `KC_DB=mariadb` — tipo do banco
- `KC_DB_URL_HOST=IP_VM_DB` — IP da VM onde está o MariaDB
- `KC_DB_URL_DATABASE=keycloak` — nome do banco do Keycloak
- `KC_DB_USERNAME` / `KC_DB_PASSWORD` — credenciais do banco
- `KC_HOSTNAME_STRICT=false` — permite acesso por IP sem hostname fixo
- `KEYCLOAK_ADMIN` / `KEYCLOAK_ADMIN_PASSWORD` — admin do painel
- `start-dev` — modo de desenvolvimento (para produção, usar `start` com configuração adequada)

## Verificar

```sh
docker logs meu_keycloak_mysql --tail 15
# procure por: "Keycloak ... started ... Listening on: http://0.0.0.0:8080"
```

Acesse o painel admin:
```
http://IP_VM_DB:5001
```

## Observações
- O Keycloak leva 1-2 minutos para ficar pronto após iniciar.
- O IP do banco fica embutido na configuração do container. Ao mudar de rede, é preciso recriar o container (`docker rm -f` + `docker run`) com o IP novo.
- `start-dev` é modo de desenvolvimento; não usar em produção.
