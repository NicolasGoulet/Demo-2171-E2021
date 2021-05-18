;Voici un endroit où l'on trouverait des choses
;décrivant intelligemment votre travail.

         LDA     0,i
         LDX     0,i
         STRO    debut,d     

main:    STRO    allo,d   
         DECI    var1,d
         ADDA    var1,d 
         DECI    var1,d
         ADDA    var1,d
         CPA     10,i
         BREQ    dix
         BR      pasDix
dix:     STRO    msg10,d
         BR      fin
pasDix:  STRO    pas10,d
fin:     CHARI   var1,d
         STRO    msgF,d 
         STOP    ;NÉCÉSSAIRE   



;VARIABLES
var1:    .BYTE   0; une variable au nom informatif
;CONSTANTES
msgF:    .ASCII " Pour finir, voici une citation de bon goût qui devrait motiver tous et toutes pour le reste de la session : \n"
         .ASCII "Il faut cultiver son jardin\n"
         .ASCII "En voici même une autre :  \n"
         .ASCII "Seule une partie de l'art peut s'enseigner, l'artiste a besoin de l'art tout entier.\n\x00"
msg10:   .ASCII "Et faire quelque chose si la somme est 10.\n\x00"
pas10:   .ASCII "Et faire quelque chose si la somme n'est pas 10.\n\x00"
allo:    .ASCII "L'assembleur, c'est très cool.\n" 
         .ASCII "C'est très utile à apprendre et de nombreux concepts que vous apprendrez cette session vous seront utiles dans d'autres cours.\n"
         .ASCII "C'est utile en sécurité informatique, en reverse-engineering, et même dans des trucs comme le speedrunning pour faire l'exécution arbitraire de code.\n"
         .ASCII "C'est très puissant aussi. Je peux par exemple additionner des valeurs: \n\x00"
debut:   .ASCII "-----------------------------------------------\nBienvenue au cours d'Assembleur!\n-----------------------------------------------\n\n\n\x00" ;
         .END    ; NÉCÉSSAIRE