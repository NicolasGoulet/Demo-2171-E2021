;Voici un endroit o� l'on trouverait des choses
;d�crivant intelligemment votre travail.

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
         STOP    ;N�C�SSAIRE   



;VARIABLES
var1:    .BYTE   0; une variable au nom informatif
;CONSTANTES
msgF:    .ASCII " Pour finir, voici une citation de bon go�t qui devrait motiver tous et toutes pour le reste de la session : \n"
         .ASCII "Il faut cultiver son jardin\n"
         .ASCII "En voici m�me une autre :  \n"
         .ASCII "Seule une partie de l'art peut s'enseigner, l'artiste a besoin de l'art tout entier.\n\x00"
msg10:   .ASCII "Et faire quelque chose si la somme est 10.\n\x00"
pas10:   .ASCII "Et faire quelque chose si la somme n'est pas 10.\n\x00"
allo:    .ASCII "L'assembleur, c'est tr�s cool.\n" 
         .ASCII "C'est tr�s utile � apprendre et de nombreux concepts que vous apprendrez cette session vous seront utiles dans d'autres cours.\n"
         .ASCII "C'est utile en s�curit� informatique, en reverse-engineering, et m�me dans des trucs comme le speedrunning pour faire l'ex�cution arbitraire de code.\n"
         .ASCII "C'est tr�s puissant aussi. Je peux par exemple additionner des valeurs: \n\x00"
debut:   .ASCII "-----------------------------------------------\nBienvenue au cours d'Assembleur!\n-----------------------------------------------\n\n\n\x00" ;
         .END    ; N�C�SSAIRE