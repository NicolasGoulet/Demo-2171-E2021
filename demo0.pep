; Cette classe permet de creer une suite de Fibonacci ou une suite triangulaire ? partir
; des nombres entr?s par l'utilisateur.
;
; @author Nicolas Goulet, Julien Frenette
; CodePermanent : GOUN12109401, FREJ12059205
; @version 15 octobre 2020


         LDA     0,i
         STRO    debut,d     ; Entete du programme

main:    STRO    menu,d      ; do {
         CHARI   choixM,d

         LDBYTEA choixM,d    ; if (choixM == '\n' || dud != '\n')
         CPA     '\n',i      ;    GOTO fin
         BREQ    fin
         CHARI   dud,d
         LDBYTEA dud,d  
         CPA     '\n',i
         BRNE    fin

         LDBYTEA choixM,d    ; if (choixM == 'f' || choixM == 't')
         CPA     'f',i       ;    GOTO iter
         BREQ    iter        ; else 
         CPA     't',i       ;    GOTO fin
         BREQ    iter        
         BR      fin

iterErr: STRO    msgE,d      ; do { 
iter:    STRO    nbrT,d      ;    print(nbrT)
         DECI    lSuite,d    ;    if (lSuite < 2)
         LDA     lSuite,d    ;        print(msgE)
         CPA     2,i         ;    
         BRLT    iterErr     ; } while (lSuite < 2)
         
         LDBYTEA choixM,d    ; Reconfirme si t ou f pour eviter d'ecrire
         CPA     'f',i       ; deux fois les blocs iterErr et iter
         BREQ    fibo
         BR      tri

fibo:    STRO    premT,d     ; Demande d'entrer les deux premiers termes de la suite
         DECI    avant,d     ; puis les affiche
         STRO    deuxT,d
         DECI    dernier,d
         DECO    avant,d
         CHARO    ' ',i 
         DECO    dernier,d

loopF:   LDA     count,d     ; for(i = 2; i < lSuite; i++)
         CPA     lSuite,d
         BREQ    fibFin      
         LDA     avant,d     ;    
         ADDA    dernier,d   ;    
         STA     somme,d     ; somme = avant + dernier

         CHARO   ' ',i         
         DECO    somme,d
         LDA     dernier,d
         STA     avant,d     ; avant = dernier
         LDA     somme,d
         STA     dernier,d   ; dernier = somme

         LDA     count,d     
         ADDA    1,i
         STA     count,d     

         BR     loopF
fibFin:  CHARO   '\n',i
         CHARO   '\n',i 
         LDA     2,i         ; Reinitialisation a 2 de l'iterateur
         STA     count,d             
         BR      main        ; Retour au menu principal apres creation suite de fibonacci


tri:     STRO    premT,d     ; Demande d'entrer le premier terme de la suite
         DECI    avant,d     ; puis l'affiche
         DECO    avant,d
         CHARO   ' ',i
         LDA     lSuite,d
         ADDA    1,i         ; Ajout de 1 a lSuite puisque count est initialise a deux
         STA     lSuite,d    
loopT:   LDA     count,d     ; for(i = 2; i < lSuite ; i++)
         CPA     lSuite,d    
         BREQ    finTri      
         LDA     avant,d
         ADDA    count,d
         STA     dernier,d   ; dernier = avant + count
         DECO    dernier,d
         
         CHARO   ' ',i
         LDA     dernier,d
         STA     avant,d     ; avant = dernier
         LDA     count,d 
         ADDA    1,i
         STA     count,d  
   
         BR      loopT       
finTri:  CHARO   '\n',i
         CHARO   '\n',i
         LDA     2,i         ; reintialisation a 2 de l'iterateur
         STA     count,d
         BR      main        ; retour au menu principal apres creation suite triangulaire
         

fin:     CHARO   '\n',i      ; if (dud != '\n' || choixM != 'q')
         LDBYTEA dud,d       ;    print(msgI)
         CPA     '\n',i      ; else 
         BRNE    err         ;    print(msgF)
         LDBYTEA choixM,d
         CPA     'q',i
         BREQ    finNorm
err:     STRO    msgI,d        

finNorm: STRO    msgF,d
         STOP


;VARIABLES
dud:     .BYTE   0           ; Bidon
count:   .WORD   2           ; i = 2
choixM:  .BYTE   0           ; Choix Menu
lSuite:  .WORD   0           ; Longueur Suite
avant:   .WORD   0
dernier: .WORD   0
somme:   .WORD   0
;CONSTANTES
nbrT:    .ascii"\nCombien de termes ? la suite?\n\x00"
premT:   .ascii"Valeur du premier terme?\n\x00"
deuxT:   .ascii"Valeur du deuxieme terme?\n\x00" 
msgE:    .ascii"Une suite doit comporter au moins 2 termes.\n\x00"
msgF:    .ascii"Au revoir!\n\x00"
msgI:    .ascii"Entree invalide. Fin du programme.\n\n\x00"
menu:    .ascii"Quelle action desirez-vous effectuer?\n   [f]ibonacci / [t]riangulaire/ [q]uitter\n\x00"
debut:   .ascii"-----------------------------------------------\nBienvenue au generateur de suites!\n-----------------------------------------------\n\n\n\x00" ;
         .END