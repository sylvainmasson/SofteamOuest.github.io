---
layout: post
title: Projet MeltingPoc
date: 2018-01-07
description: Projet pour se former aux nouvelles technologies
img: meltingpoc.png # Add image post (optional)
author: Mehdi El Kouhen
---

Le Projet MeltingPoc est un projet de Veille Technologique. 

Le Projet est construit par assemblage de micro services (chaque micro service est une POC d'utilisation d'une technologie).

# Déploiement 

Le déploiement des micro services est réalisé par déploiement de conteneurs [Docker](https://www.docker.com/) dans un cluster [Kubernetes](https://kubernetes.io/).

Les services sont accessibles via l'URL meltingpoc.k8.wildwidewest.xyz

# Liste des services

| Service  |  | Build Status |
| ------------- | ------------- |  ------------- |
| api-gateway | une gateway, basée sur [zuul](https://github.com/Netflix/zuul), qui redirige les requêtes vers les bons services | [![Build Status](http://jenkins.k8.wildwidewest.xyz/buildStatus/icon?job=api-gateway/master)](http://jenkins.k8.wildwidewest.xyz/view/MELTING_POC/job/api-gateway/job/master/)|
| [gestion-personnes](https://meltingpoc.k8.wildwidewest.xyz/gestion-personnes-vue/) | un front [Vue.js](https://vuejs.org/) de gestion de personnes | [![Build Status](http://jenkins.k8.wildwidewest.xyz/buildStatus/icon?job=gestion-personnes/master)](http://jenkins.k8.wildwidewest.xyz/view/MELTING_POC/job/gestion-personnes/job/master/)|
| [referentiel-personnes-ui](https://meltingpoc.k8.wildwidewest.xyz/gestion-personnes-react/) | un front [React](https://reactjs.org/) similaire au précédent | [![Build Status](http://jenkins.k8.wildwidewest.xyz/buildStatus/icon?job=referentiel-personnes-ui/master)](http://jenkins.k8.wildwidewest.xyz/view/MELTING_POC/job/referentiel-personnes-ui/job/master/) |
| [referentiel-personnes-api](https://meltingpoc.k8.wildwidewest.xyz/api-personnes) | un back kotlin&spring de gestion de personnes  |  [![Build Status](http://jenkins.k8.wildwidewest.xyz/buildStatus/icon?job=referentiel-personnes-api/master)](http://jenkins.k8.wildwidewest.xyz/view/MELTING_POC/job/referentiel-personnes-api/job/master/)|
| [referentiel-personnes-mock](http://meltingpoc.k8.wildwidewest.xyz/api-personnes-mock) | une api mock [JSON Server](https://github.com/typicode/json-server) de gestion de personnes  | [![Build Status](http://jenkins.k8.wildwidewest.xyz/buildStatus/icon?job=referentiel-personnes-mock/master)](http://jenkins.k8.wildwidewest.xyz/job/referentiel-personnes-mock/job/master/)|
| [referentiel-personnes-swagger](https://meltingpoc.k8.wildwidewest.xyz/api-personnes-swagger/) | une console [swagger](https://swagger.io/) de l'API de gestions de personnes  | [![Build Status](http://jenkins.k8.wildwidewest.xyz/buildStatus/icon?job=referentiel-personnes-swagger/master)](http://jenkins.k8.wildwidewest.xyz/view/MELTING_POC/job/referentiel-personnes-swagger/job/master/)|
