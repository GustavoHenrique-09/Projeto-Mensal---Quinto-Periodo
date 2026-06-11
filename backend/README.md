# Backend — Berenice (VM Back)

API Java (Spring Boot) empacotada em WAR, servida pelo Tomcat em container.

## Conteúdo
- `Dockerfile` — imagem do backend
- `demo.war` — aplicação compilada

## Build

```sh
cd backend
docker build -t berenice-back .
```

## Run

> Substitua `IP_VM_DB` pelo IP da VM Database e as senhas pelos valores reais.

```sh
docker run -d -p 8080:8080 \
  --add-host authentication.projeto.com:IP_VM_DB \
  -e SPRING_DATASOURCE_URL="jdbc:mysql://IP_VM_DB:3306/berenice?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true" \
  --name meu-back berenice-back
```

### O que cada parâmetro faz
- `-d` — roda em segundo plano (detached)
- `-p 8080:8080` — mapeia a porta 8080 do host para a 8080 do container
- `--add-host authentication.projeto.com:IP_VM_DB` — ensina o container a resolver o nome do Keycloak para o IP da VM Database
- `-e SPRING_DATASOURCE_URL=...` — sobrescreve a URL do banco (configuração por variável de ambiente, sem alterar o WAR)
- `--name meu-back` — nome do container

## Verificar

```sh
docker logs meu-back --tail 10        # procure por "Started DemoApplication"
curl -I http://localhost:8080/demo/api/auth/login   # esperado: 401 (API viva e protegida)
```

## Observações
- A aplicação responde no contexto `/demo` (ex: `/demo/api/auth/login`).
- O Tomcat instalado diretamente na VM (se houver) deve ser parado antes, pois ocupa a porta 8080.
- A configuração do banco é injetada por variável de ambiente — a mesma imagem funciona em qualquer rede, bastando trocar o IP no `docker run`.
