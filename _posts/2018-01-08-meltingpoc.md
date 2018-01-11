---
layout: post
title: Projet MeltingPoc
date: 2018-01-07
description: Projet Nantais pour se former aux nouvelles technologies
img: meltingpoc.png # Add image post (optional)
author: Mehdi El Kouhen
---

Le Projet MeltingPoc est un projet de Veille Technologique. Le Projet est construit par assemblage de micro services (chaque micro service étant une POC d'utilisation d'une technlogie).

== Déploiement 

Le déploiement des micro services est réalisé par déploiement de conteneurs Docker dans un cluster Kubernetes.

Les services sont accessibles via l'URL meltingpoc.k8.wildwidewest.xyz

== Liste des services

* une gateway qui redirige les requêtes vers les bons services
* un front [vue](https://meltingpoc.k8.wildwidewest.xyz/gestion-personnes-vue/) de gestion de personnes
* un front [react](https://meltingpoc.k8.wildwidewest.xyz/gestion-personnes-vue/) similaire au précédent
* un back [kotlin-spring](api-personnes) de gestion de personnes
