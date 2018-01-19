---
layout: post
title: Ma première journée avec VueJS
date: 2018-01-19
description: Tutorial VueJS
img: software-factory.jpg # Add image post (optional)
author: Mehdi El Kouhen
---

# Objectif 

L'objectif de cet article est de présenter un retour (le mien) d'expérience d'une première mise en place de [Vue.js](https://vuejs.org/).

# Description de l'application

L'application contient deux pages :

* Une page d'affichage de tous les événements dans un tableau.
* Une page d'édition d'un événement donné.

Pour le développement de l'application, j'ai développé 3 composants : 

* un composant EventList d'affichage d'une liste d'événements
* un composant Event d'affichage d'un événement 

# Dépôt GIT

Les sources du projet sont disponibles sur [github](https://github.com/SofteamOuest/event-gui).

# Génération du projet

Pour générer la structure du projet, j'ai utilisé [vue-cli](https://github.com/vuejs/vue-cli).

# Structure d'un composant

Un composant Vue.js est un fichier (suffixé .vue) structuré comme le code ci-dessous. 

```
<template>
# code HTML
</template>

<script>
# code JS
</script>

<style>
# code CSS
</style>
```

Ceci permet de colocaliser le code HTML/JS/CSS d'un composant dans un fichier unique. Pour ma part, j'ai préféré conserver le code HTML/JS/CSS dans des fichiers dédiés et les importer dans les composants Vue (cf. attribut src).

```
<template src='./Event.html'>

</template>

<script src='./Event.js'>

</script>

<style scoped>

</style>
```

# Intégration de Bootstrap

Pour intégrer Bootstrap dans le code, je me suis servi du projet [Bootstrap + Vue](https://bootstrap-vue.js.org/). Le projet [Bootstrap + Vue](https://bootstrap-vue.js.org/) apporte des composants Vue.js pour chaque composant Bootstrap.

Exemple de barre de navigation avec Bootstrap + Vue. 
```
<b-navbar toggleable type="light" variant="light">
    <b-navbar-toggle target="nav_text_collapse"></b-navbar-toggle>
    <b-navbar-brand>EventMgr</b-navbar-brand>
    <b-collapse is-nav id="nav_text_collapse">
      <b-navbar-nav>
        <b-nav-item href="#/events">Home</b-nav-item>
        <b-nav-item href="#/events/1">Events</b-nav-item>
      </b-navbar-nav>
    </b-collapse>
</b-navbar>
```

Comme décrit [dans la documentation du projet](https://bootstrap-vue.js.org/docs), il suffit d'ajouter au projet les dépendances bootstrap-vue et bootstrap puis d'enregistrer le plugin BootstrapVue dans le composant "point d'entrée" (composant App.vue).

```
import BootstrapVue from 'bootstrap-vue'

// nécessaire pour webpack
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css

Vue.use(BootstrapVue);
```

# Intégration d'un routeur

Le projet généré intègre le [routeur par défaut](https://github.com/vuejs/vue-router) de Vue.js.

Le routeur est paramétré par un ensemble de routes :

* une route /events (pour afficher tous les événements)
* une route paramétrée /events/:id par l'identifiant d'un événement (pour afficher l'événement)

```
export default new Router({
  routes: [
    {
      path: '/events/:id',
      name: 'Event',
      component: Event
    }, {
      path: '/events',
      name: 'EventList',
      component: EventList
    }
  ]
})
```

L'intégration du routeur se fait au niveau du composant App.vue (composant point d'entrée) par intégration du fragment HTML ci-dessous (dans le code HTML du composant).

```
 <router-view/>
```

# Intégration d'un client HTTP

En suivant le tutorial [alligator.io](https://alligator.io/vuejs/rest-api-axios/), j'ai intégré le client axios.

# Compilation du projet 

La compilation du projet est géré par [webpack](https://webpack.js.org/).

## Compilation Live Reload

La compilation à chaud se fait en exécutant la ligne de commande suivante : webpack publie les sources du projet (via un serveur http local) sur http://localhost:8080

```
npm run dev
```

## Génération des statiques

La génération des fichiers HTML/JS/CSS se fait en exécutant la ligne de commande suivante :

```
npm run build
```

