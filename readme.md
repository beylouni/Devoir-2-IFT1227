ENONCÉ DU DEVOIR:

I. Circuits logiques séquentiels
Vous êtes un étudiant en électronique chargé de concevoir un circuit séquentiel pour contrôler un système d'éclairage automatique. Le système doit être capable de détecter la présence de personnes dans une pièce et d'allumer automatiquement les lumières lorsqu'une personne entre dans la pièce. De plus, il doit éteindre les lumières après un certain temps si aucune présence n'est détectée.
Spécification
Le circuit doit avoir deux entrées :
• Détecteur de Présence (P) : Une entrée qui est activée (élevée à l'état haut, 1) lorsqu'une présence est détectée dans la pièce et désactivée (élevée à l'état bas, 0) lorsqu'il n'y a pas de présence.
• Interrupteur Manuel (S) : Une entrée qui permet à l'utilisateur de forcer l'allumage ou l'extinction des lumières en appuyant sur un interrupteur. Lorsque l'interrupteur est enfoncé, l'entrée S est activée (élevée à l'état haut, 1) et lorsque l'interrupteur est relâché, l'entrée S est désactivée (élevée à l'état bas, 0).
Le circuit doit avoir une sortie Commande d'Éclairage (L) :
La sortie L doit être égale à 1 (Vrai) lorsque l'une des deux conditions suivantes est remplie:
• Le détecteur de présence (P) est activé ET l'interrupteur manuel (S) est soit activé
(éclairage forcé) soit désactivé (éclairage automatique).
• Le détecteur de présence (P) est désactivé, mais l'éclairage automatique est encore
actif (c'est-à-dire que le système doit maintenir les lumières allumées pendant un certain temps (un cycle) après la détection de l'absence de présence).
La sortie L doit être égale à 0 (Faux) dans tous les autres cas.
Exemple du comportement : P : 1010...
S: 1100
L : 1010...
Temps :
a) Créer le diagramme d’états;
b) Codez la machine en VHDL ;
c) Écrire un testbench auto-vérificateur en VHDL
d) Vérifiez le comportement de votre circuit par simulation