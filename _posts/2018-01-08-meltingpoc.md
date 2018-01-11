---
layout: post
title: Projet MeltingPoc
date: 2018-01-07
description: Projet Nantais pour se former aux nouvelles technologies
img: meltingpoc.png # Add image post (optional)
author: Mehdi El Kouhen
---

Le Projet MeltingPoc est un projet de Veille Technologique. 

Le Projet est construit par assemblage de micro services (chaque micro service est une POC d'utilisation d'une technologie).

# Déploiement 

Le déploiement des micro services est réalisé par déploiement de conteneurs [Docker](https://www.docker.com/) dans un cluster [Kubernetes](https://kubernetes.io/).

Les services sont accessibles via l'URL meltingpoc.k8.wildwidewest.xyz

# Liste des services

* une gateway qui redirige les requêtes vers les bons services
* un front [vue](https://meltingpoc.k8.wildwidewest.xyz/gestion-personnes-vue/) de gestion de personnes
* un front [react](https://meltingpoc.k8.wildwidewest.xyz/gestion-personnes-vue/) similaire au précédent
* un back [kotlin-spring](https://meltingpoc.k8.wildwidewest.xyz/api-personnes) de gestion de personnes
* une api [mock JSON Server](http://meltingpoc-api-personnes-mock) de gestion de personnes

# Statuts des Builds

* referentiel-personnes-mock-run [![Build Status](http://jenkins.k8.wildwidewest.xyz/buildStatus/icon?job=referentiel-personnes-mock/master)](http://jenkins.k8.wildwidewest.xyz/job/referentiel-personnes-mock/job/master/)


