# Système de Contrôle d'Éclairage Automatique

Ce dépôt contient la conception et la mise en œuvre d'un circuit logique séquentiel pour un système de contrôle d'éclairage automatique. Le système a pour but de détecter la présence de personnes dans une pièce et de contrôler automatiquement l'éclairage, en l'allumant lorsque quelqu'un entre dans la pièce et en l'éteignant après une certaine période d'inactivité. De plus, il permet un contrôle manuel grâce à un interrupteur.

## Spécification

Le circuit est conçu pour avoir les entrées et la sortie suivantes :

**Entrées :**
1. **Détecteur de Présence (P) :** Une entrée qui est activée (mise à l'état haut, 1) lorsqu'une présence est détectée dans la pièce et désactivée (mise à l'état bas, 0) lorsqu'aucune présence n'est détectée.
2. **Interrupteur Manuel (S) :** Une entrée qui permet à l'utilisateur de contrôler manuellement l'éclairage en appuyant sur un interrupteur. Lorsque l'interrupteur est enfoncé, l'entrée S est activée (mise à l'état haut, 1), et lorsque l'interrupteur est relâché, l'entrée S est désactivée (mise à l'état bas, 0).

**Sortie :**
- **Commande d'Éclairage (L) :** La sortie L est définie à 1 (Vrai) dans les cas suivants :
  - Le Détecteur de Présence (P) est activé, et l'Interrupteur Manuel (S) est soit activé (éclairage forcé) soit désactivé (éclairage automatique).
  - Le Détecteur de Présence (P) est désactivé, mais l'éclairage automatique est toujours actif (c'est-à-dire que le système doit maintenir les lumières allumées pendant un certain temps après l'absence de présence).

La sortie L est définie à 0 (Faux) dans tous les autres cas.

## Comportement Exemple :
- P : 1010...
- S : 1100
- L : 1010...

## Tâches
Pour mener à bien ce projet, les tâches suivantes sont requises :

a) **Créer le Diagramme d'États :** Concevoir le diagramme d'états pour le circuit logique séquentiel.

b) **Implémentation en VHDL :** Rédiger le code VHDL pour le circuit logique séquentiel.

c) **Testbench Auto-vérificateur :** Développer un testbench auto-vérificateur en VHDL pour tester rigoureusement le comportement de votre circuit par simulation.

d) **Vérification par Simulation :** Vérifier le comportement de votre circuit en le simulant à l'aide du testbench.

## Structure du Dossier
Ce dépôt est organisé comme suit :

- `diagrammes/` : Contient les fichiers du diagramme d'états.
- `vhdl/` : Comprend le code source VHDL pour le circuit logique séquentiel.
- `testbench/` : Contient le testbench auto-vérificateur pour la simulation.