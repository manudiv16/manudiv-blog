---
author: "Manu Martin"
title: "Setup traefik"
date: "2021-03-09"

description: "Set up the loadbalancer traefik on docker-compose."
categories:
    - Docker
tags:
    - "Traefik"
    - Docker
    - Docker Compose
  
image: "pexels-davis-sanchez-1727004-min.jpg"
---

```bash
mkdir -p traefik/data/configurations
touch traefik/data/{acme.json,traefik.yml} \
  traefik/docker-compose.yml \
  traefik/data/configurations/dynamic.yml
chmod 600 traefik/data/acme.json
```
```bash
traefik
├── data
│   ├── acme.json
│   ├── configurations
│   │   └── dynamic.yml
│   └── traefik.yml
└── docker-compose.yml
```
`docker-compose.yml`
```yaml
version: '3.7'

services:
  traefik:
    image: traefik:latest
    restart: always
    security_opt:
      - no-new-privileges:true
    ports:
      - 80:80
      - 443:443
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./data/traefik.yml:/traefik.yml:ro
      - ./data/acme.json:/acme.json
      - ./data/configurations:/configurations
    networks:
      - proxy
    labels:
      - "traefik.enable=true"
      - "traefik.docker.network=proxy"
      - "traefik.http.routers.traefik-secure.entrypoints=websecure"
      - "traefik.http.routers.traefik-secure.rule=Host(`traefik.example.com`)"
      - "traefik.http.routers.traefik-secure.middlewares=user-auth@file"
      - "traefik.http.routers.traefik-secure.service=api@internal"      
networks:
  proxy:
    external: true
```
`traefik.yml`
```yaml
api:
  dashboard: true

entryPoints:
  web:
    address: :80
    http:
      redirections:
        entryPoint:
          to: websecure

  websecure:
    address: :443
    http:
      middlewares:
        - secureHeaders@file
      tls:
        certResolver: letsencrypt
providers:
  docker:
    watch: true
    endpoint: "unix:///var/run/docker.sock"
    exposedByDefault: false
  file:
    filename: /configurations/dynamic.yml

certificatesResolvers:
  letsencrypt:
    acme:
      email: admin@example.com
      storage: acme.json
      keyType: EC384
      httpChallenge:
        entryPoint: web
pilot:
    token: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"       

```

`dynamic.yml`
```yaml
# Dynamic configuration
http:
  middlewares:
    secureHeaders:
      headers:
        sslRedirect: true
        forceSTSHeader: true
        stsIncludeSubdomains: true
        stsPreload: true
        stsSeconds: 31536000   
                 
    user-auth:
      basicAuth:
        users:
        # - "admin:admin"
          - "admin:$apr1$2alk61vd$FKIsRoz15pYd2QlRPFzTg/"
            
tls:
  options:
    default:
      cipherSuites:
        - TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
        - TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        - TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
        - TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        - TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305
        - TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305
      minVersion: VersionTLS12

```


{{< css.inline >}}
<style>
.canon { background: white; width: 100%; height: auto; }
</style>
{{< /css.inline >}}