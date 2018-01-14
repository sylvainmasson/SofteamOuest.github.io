---
layout: post
title: Déploiement d'une application dans Kubernetes
date: 2018-01-14
description: Tutorial Kubernetes
img: software-factory.jpg # Add image post (optional)
author: Mehdi El Kouhen
---

# Objectif 

L'objectif de cet article est de présenter les concepts de base de déploiement d'une application Dockerisée dans un cluster Kubernetes.

# Dépôts GIT 

Le code présenté dans cet article est extrait des deux dépôts GIT suivants.

## [books-api-simple](https://github.com/SofteamOuest/books-api-simple)

API de gestion de livres.

## [books-api-simple-run](https://github.com/SofteamOuest/books-api-simple-run)

Module de déploiement de l'API dans Kubernetes.

# Déploiement de l'API

Le déploiement des conteneurs est réalisé en définissant un objet Deployment.

Le déployment spécifie :

* l'image Docker à déployer (registry.k8.wildwidewest.xyz/repository/docker-repository/pocs/books-api-simple)
* le nombre de réplicas (1 ci-dessous)
* le port exposé par l'application (8080 ci-dessous)
* le mot de passe d'accès au registry docker stocké sous forme de secret (regsecret ci-dessous)

```
apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: books-api-simple
spec:
  replicas: 1
  template:
    metadata:
     labels:
        app: books-api-simple
    spec:
      containers:
      - name: books-api-simple
        image: registry.k8.wildwidewest.xyz/repository/docker-repository/pocs/books-api-simple:version
        ports:
        - containerPort: 8080
      imagePullSecrets:
      - name: regsecret 

```

## Création d'un service d'accès

Kubernetes fournit la notion de service comme point d'accès aux conteneurs déployés.



```
kind: Service
apiVersion: v1
metadata:
  name: books-api-simple
spec:
  selector:
    app: books-api-simple
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
```

## Publication du service 

Kubernetes permet via la notion d'Ingress de publier les services en dehors du cluster.

Le fragment de code ci-dessous map les requêtes envoyées à l'URL books-api-simple.k8.wildwidewest.xyz vers le service books-api-simple.

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: books-api-simple
  annotations:
    kubernetes.io/ingress.class: traefik
    traefik.frontend.rule.type: PathPrefixStrip
spec:
  rules:
  - host: books-api-simple.k8.wildwidewest.xyz
    http:
      paths:
      - path: /
        backend:
          serviceName: books-api-simple
          servicePort: 80
  tls:
  - secretName: traefik-cert
```