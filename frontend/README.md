# Frontend — Berenice (VM Front)

Aplicação Angular (build estático) servida pelo NGINX em container.

## Conteúdo
- `Dockerfile` — imagem do frontend
- `nginx.conf` — configuração do NGINX (com suporte a rotas do Angular)
- Arquivos do build Angular (`index.html`, `main.*.js`, `styles.*.css`, etc.)

## ⚠️ Antes de buildar: ajustar a URL do backend

O endereço do backend está embutido no arquivo `main.*.js` (build compilado do Angular).
É preciso apontá-lo para o IP da VM Backend **antes** de buildar a imagem.

Verifique a URL atual:
```sh
grep -o "http://[0-9.]*:8080/demo/api\|https://[a-z.]*:8443/demo/api" main.*.js
```

Troque para o IP da VM Backend (substitua `IP_ANTIGO` pelo que apareceu acima e `IP_VM_BACK` pelo IP atual):
```sh
sed -i 's#http://IP_ANTIGO:8080/demo/api#http://IP_VM_BACK:8080/demo/api#g' main.SEU_HASH.js
```

> Mantenha um backup do JS original (`.bak`) antes de editar, para poder refazer a troca em outra rede.

## Build

```sh
cd frontend
docker build -t berenice-front .
```

## Run

```sh
docker run -d -p 80:80 --name meu-front berenice-front
```

### O que cada parâmetro faz
- `-d` — roda em segundo plano
- `-p 80:80` — mapeia a porta 80 (web) do host para a 80 do container
- `--name meu-front` — nome do container

## Verificar

Acesse pelo **IP da VM Front** (nunca por `localhost`):
```
http://IP_VM_FRONT
```

Faça login. O frontend chama o backend no IP configurado no JS.

## Observação importante
A URL do backend é **absoluta** dentro do JS. Por isso:
- Sempre acesse o frontend pelo **IP da VM Front**, não por `localhost`.
- Ao mudar de rede, é preciso refazer a troca de URL no JS e rebuildar a imagem.
