// Emacs style mode select   -*- C++ -*-
//-----------------------------------------------------------------------------
//
// $Id:$
//
// Copyright (C) 1993-1996 by id Software, Inc.
//
// This source is available for distribution and/or modification
// only under the terms of the DOOM Source Code License as
// published by id Software. All rights reserved.
//
// The source is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
// for more details.
//
// DESCRIPTION:
//	Printed strings, french translation.
//
//-----------------------------------------------------------------------------

#ifndef __D_FRENCH__
#define __D_FRENCH__

//
// D_Main.C
//
#define D_DEVSTR "MODE DEVELOPPEMENT ON.\n"
#define D_CDROM "VERSION CD-ROM: DEFAULT.CFG DANS C:\\DOOMDATA\n"

//
//	M_Menu.C
//
#define PRESSKEY "APPUYEZ SUR UNE TOUCHE."
#define PRESSYN "APPUYEZ SUR Y OU N"
#define QUITMSG "VOUS VOULEZ VRAIMENT\nQUITTER CE SUPER JEU?"
#define LOADNET "VOUS NE POUVEZ PAS CHARGER\nUN JEU EN RESEAU!\n\n" PRESSKEY
#define QLOADNET "CHARGEMENT RAPIDE INTERDIT EN RESEAU!\n\n" PRESSKEY
#define QSAVESPOT "VOUS N'AVEZ PAS CHOISI UN EMPLACEMENT!\n\n" PRESSKEY
#define SAVEDEAD                                                               \
	"VOUS NE POUVEZ PAS SAUVER SI VOUS NE JOUEZ "                              \
	"PAS!\n\n" PRESSKEY
#define QSPROMPT "SAUVEGARDE RAPIDE DANS LE FICHIER \n\n'%s'?\n\n" PRESSYN
#define QLPROMPT                                                               \
	"VOULEZ-VOUS CHARGER LA SAUVEGARDE"                                        \
	"\n\n'%s'?\n\n" PRESSYN
#define NEWGAME                                                                \
	"VOUS NE POUVEZ PAS LANCER\n"                                              \
	"UN NOUVEAU JEU SUR RESEAU.\n\n" PRESSKEY
#define NIGHTMARE                                                              \
	"VOUS CONFIRMEZ? CE NIVEAU EST\n"                                          \
	"VRAIMENT IMPITOYABLE!n" PRESSYN
#define SWSTRING                                                               \
	"CECI EST UNE VERSION SHAREWARE DE DOOM.\n\n"                              \
	"VOUS DEVRIEZ COMMANDER LA TRILOGIE COMPLETE.\n\n" PRESSKEY
#define MSGOFF "MESSAGES OFF"
#define MSGON "MESSAGES ON"
#define NETEND                                                                 \
	"VOUS NE POUVEZ PAS METTRE FIN A UN JEU SUR "                              \
	"RESEAU!\n\n" PRESSKEY
#define ENDGAME "VOUS VOULEZ VRAIMENT METTRE FIN AU JEU?\n\n" PRESSYN

#define DOSY "(APPUYEZ SUR Y POUR REVENIR AU OS.)"

#define DETAILHI "GRAPHISMES MAXIMUM "
#define DETAILLO "GRAPHISMES MINIMUM "
#define GAMMALVL0 "CORRECTION GAMMA OFF"
#define GAMMALVL1 "CORRECTION GAMMA NIVEAU 1"
#define GAMMALVL2 "CORRECTION GAMMA NIVEAU 2"
#define GAMMALVL3 "CORRECTION GAMMA NIVEAU 3"
#define GAMMALVL4 "CORRECTION GAMMA NIVEAU 4"
#define EMPTYSTRING "EMPLACEMENT VIDE"

//
//	P_inter.C
//
#define GOTARMOR "ARMURE RECUPEREE."
#define GOTMEGA "MEGA-ARMURE RECUPEREE!"
#define GOTHTHBONUS "BONUS DE SANTE RECUPERE."
#define GOTARMBONUS "BONUS D'ARMURE RECUPERE."
#define GOTSTIM "STIMPACK RECUPERE."
#define GOTMEDINEED "MEDIKIT RECUPERE. VOUS EN AVEZ VRAIMENT BESOIN!"
#define GOTMEDIKIT "MEDIKIT RECUPERE."
#define GOTSUPER "SUPERCHARGE!"

#define GOTBLUECARD "CARTE MAGNETIQUE BLEUE RECUPEREE."
#define GOTYELWCARD "CARTE MAGNETIQUE JAUNE RECUPEREE."
#define GOTREDCARD "CARTE MAGNETIQUE ROUGE RECUPEREE."
#define GOTBLUESKUL "CLEF CRANE BLEUE RECUPEREE."
#define GOTYELWSKUL "CLEF CRANE JAUNE RECUPEREE."
#define GOTREDSKULL "CLEF CRANE ROUGE RECUPEREE."

#define GOTINVUL "INVULNERABILITE!"
#define GOTBERSERK "BERSERK!"
#define GOTINVIS "INVISIBILITE PARTIELLE "
#define GOTSUIT "COMBINAISON ANTI-RADIATIONS "
#define GOTMAP "CARTE INFORMATIQUE "
#define GOTVISOR "VISEUR A AMPLIFICATION DE LUMIERE "
#define GOTMSPHERE "MEGASPHERE!"

#define GOTCLIP "CHARGEUR RECUPERE."
#define GOTCLIPBOX "BOITE DE BALLES RECUPEREE."
#define GOTROCKET "ROQUETTE RECUPEREE."
#define GOTROCKBOX "CAISSE DE ROQUETTES RECUPEREE."
#define GOTCELL "CELLULE D'ENERGIE RECUPEREE."
#define GOTCELLBOX "PACK DE CELLULES D'ENERGIE RECUPERE."
#define GOTSHELLS "4 CARTOUCHES RECUPEREES."
#define GOTSHELLBOX "BOITE DE CARTOUCHES RECUPEREE."
#define GOTBACKPACK "SAC PLEIN DE MUNITIONS RECUPERE!"

#define GOTBFG9000 "VOUS AVEZ UN BFG9000!  OH, OUI!"
#define GOTCHAINGUN "VOUS AVEZ LA MITRAILLEUSE!"
#define GOTCHAINSAW "UNE TRONCONNEUSE!"
#define GOTLAUNCHER "VOUS AVEZ UN LANCE-ROQUETTES!"
#define GOTPLASMA "VOUS AVEZ UN FUSIL A PLASMA!"
#define GOTSHOTGUN "VOUS AVEZ UN FUSIL!"
#define GOTSHOTGUN2 "VOUS AVEZ UN SUPER FUSIL!"

//
// P_Doors.C
//
#define PD_BLUEO "IL VOUS FAUT UNE CLEF BLEUE"
#define PD_REDO "IL VOUS FAUT UNE CLEF ROUGE"
#define PD_YELLOWO "IL VOUS FAUT UNE CLEF JAUNE"
#define PD_BLUEK PD_BLUEO
#define PD_REDK PD_REDO
#define PD_YELLOWK PD_YELLOWO

//
//	G_game.C
//
#define GGSAVED "JEU SAUVEGARDE."

//
//	HU_stuff.C
//
#define HUSTR_MSGU "[MESSAGE NON ENVOYE]"

#define HUSTR_E1M1 "E1M1: HANGAR"
#define HUSTR_E1M2 "E1M2: USINE NUCLEAIRE "
#define HUSTR_E1M3 "E1M3: RAFFINERIE DE TOXINES "
#define HUSTR_E1M4 "E1M4: CENTRE DE CONTROLE "
#define HUSTR_E1M5 "E1M5: LABORATOIRE PHOBOS "
#define HUSTR_E1M6 "E1M6: TRAITEMENT CENTRAL "
#define HUSTR_E1M7 "E1M7: CENTRE INFORMATIQUE "
#define HUSTR_E1M8 "E1M8: ANOMALIE PHOBOS "
#define HUSTR_E1M9 "E1M9: BASE MILITAIRE "

#define HUSTR_E2M1 "E2M1: ANOMALIE DEIMOS "
#define HUSTR_E2M2 "E2M2: ZONE DE CONFINEMENT "
#define HUSTR_E2M3 "E2M3: RAFFINERIE"
#define HUSTR_E2M4 "E2M4: LABORATOIRE DEIMOS "
#define HUSTR_E2M5 "E2M5: CENTRE DE CONTROLE "
#define HUSTR_E2M6 "E2M6: HALLS DES DAMNES "
#define HUSTR_E2M7 "E2M7: CUVES DE REPRODUCTION "
#define HUSTR_E2M8 "E2M8: TOUR DE BABEL "
#define HUSTR_E2M9 "E2M9: FORTERESSE DU MYSTERE "

#define HUSTR_E3M1 "E3M1: DONJON DE L'ENFER "
#define HUSTR_E3M2 "E3M2: BOURBIER DU DESESPOIR "
#define HUSTR_E3M3 "E3M3: PANDEMONIUM"
#define HUSTR_E3M4 "E3M4: MAISON DE LA DOULEUR "
#define HUSTR_E3M5 "E3M5: CATHEDRALE PROFANE "
#define HUSTR_E3M6 "E3M6: MONT EREBUS"
#define HUSTR_E3M7 "E3M7: LIMBES"
#define HUSTR_E3M8 "E3M8: DIS"
#define HUSTR_E3M9 "E3M9: CLAPIERS"

#define HUSTR_1 "NIVEAU 1: ENTREE "
#define HUSTR_2 "NIVEAU 2: HALLS SOUTERRAINS "
#define HUSTR_3 "NIVEAU 3: LE FEU NOURRI "
#define HUSTR_4 "NIVEAU 4: LE FOYER "
#define HUSTR_5 "NIVEAU 5: LES EGOUTS "
#define HUSTR_6 "NIVEAU 6: LE BROYEUR "
#define HUSTR_7 "NIVEAU 7: L'HERBE DE LA MORT"
#define HUSTR_8 "NIVEAU 8: RUSES ET PIEGES "
#define HUSTR_9 "NIVEAU 9: LE PUITS "
#define HUSTR_10 "NIVEAU 10: BASE DE RAVITAILLEMENT "
#define HUSTR_11 "NIVEAU 11: LE CERCLE DE LA MORT!"

#define HUSTR_12 "NIVEAU 12: L'USINE "
#define HUSTR_13 "NIVEAU 13: LE CENTRE VILLE"
#define HUSTR_14 "NIVEAU 14: LES ANTRES PROFONDES "
#define HUSTR_15 "NIVEAU 15: LA ZONE INDUSTRIELLE "
#define HUSTR_16 "NIVEAU 16: LA BANLIEUE"
#define HUSTR_17 "NIVEAU 17: LES IMMEUBLES"
#define HUSTR_18 "NIVEAU 18: LA COUR "
#define HUSTR_19 "NIVEAU 19: LA CITADELLE "
#define HUSTR_20 "NIVEAU 20: JE T'AI EU!"

#define HUSTR_21 "NIVEAU 21: LE NIRVANA"
#define HUSTR_22 "NIVEAU 22: LES CATACOMBES "
#define HUSTR_23 "NIVEAU 23: LA GRANDE FETE "
#define HUSTR_24 "NIVEAU 24: LE GOUFFRE "
#define HUSTR_25 "NIVEAU 25: LES CHUTES DE SANG"
#define HUSTR_26 "NIVEAU 26: LES MINES ABANDONNEES "
#define HUSTR_27 "NIVEAU 27: CHEZ LES MONSTRES "
#define HUSTR_28 "NIVEAU 28: LE MONDE DE L'ESPRIT "
#define HUSTR_29 "NIVEAU 29: LA LIMITE "
#define HUSTR_30 "NIVEAU 30: L'ICONE DU PECHE "

#define HUSTR_31 "NIVEAU 31: WOLFENSTEIN"
#define HUSTR_32 "NIVEAU 32: LE MASSACRE"

#define HUSTR_CHATMACRO1 "JE SUIS PRET A LEUR EN FAIRE BAVER!"
#define HUSTR_CHATMACRO2 "JE VAIS BIEN."
#define HUSTR_CHATMACRO3 "JE N'AI PAS L'AIR EN FORME!"
#define HUSTR_CHATMACRO4 "AU SECOURS!"
#define HUSTR_CHATMACRO5 "TU CRAINS!"
#define HUSTR_CHATMACRO6 "LA PROCHAINE FOIS, MINABLE..."
#define HUSTR_CHATMACRO7 "VIENS ICI!"
#define HUSTR_CHATMACRO8 "JE VAIS M'EN OCCUPER."
#define HUSTR_CHATMACRO9 "OUI"
#define HUSTR_CHATMACRO0 "NON"

#define HUSTR_TALKTOSELF1 "VOUS PARLEZ TOUT SEUL "
#define HUSTR_TALKTOSELF2 "QUI EST LA?"
#define HUSTR_TALKTOSELF3 "VOUS VOUS FAITES PEUR "
#define HUSTR_TALKTOSELF4 "VOUS COMMENCEZ A DELIRER "
#define HUSTR_TALKTOSELF5 "VOUS ETES LARGUE..."

#define HUSTR_MESSAGESENT "[MESSAGE ENVOYE]"

// The following should NOT be changed unless it seems
// just AWFULLY necessary

#define HUSTR_PLRGREEN "VERT: "
#define HUSTR_PLRINDIGO "INDIGO: "
#define HUSTR_PLRBROWN "BRUN: "
#define HUSTR_PLRRED "ROUGE: "

#define HUSTR_KEYGREEN 'g' // french key should be "V"
#define HUSTR_KEYINDIGO 'i'
#define HUSTR_KEYBROWN 'b'
#define HUSTR_KEYRED 'r'

//
//	AM_map.C
//

#define AMSTR_FOLLOWON "MODE POURSUITE ON"
#define AMSTR_FOLLOWOFF "MODE POURSUITE OFF"

#define AMSTR_GRIDON "GRILLE ON"
#define AMSTR_GRIDOFF "GRILLE OFF"

#define AMSTR_MARKEDSPOT "REPERE MARQUE "
#define AMSTR_MARKSCLEARED "REPERES EFFACES "

//
//	ST_stuff.C
//

#define STSTR_MUS "CHANGEMENT DE MUSIQUE "
#define STSTR_NOMUS "IMPOSSIBLE SELECTION"
#define STSTR_DQDON "INVULNERABILITE ON "
#define STSTR_DQDOFF "INVULNERABILITE OFF"

#define STSTR_KFAADDED "ARMEMENT MAXIMUM! "
#define STSTR_FAADDED "ARMES (SAUF CLEFS) AJOUTEES"

#define STSTR_NCON "BARRIERES ON"
#define STSTR_NCOFF "BARRIERES OFF"

#define STSTR_BEHOLD " inVuln, Str, Inviso, Rad, Allmap, or Lite-amp"
#define STSTR_BEHOLDX "AMELIORATION ACTIVEE"

#define STSTR_CHOPPERS "... DOESN'T SUCK - GM"
#define STSTR_CLEV "CHANGEMENT DE NIVEAU..."

//
//	F_Finale.C
//
#define E1TEXT                                                                 \
	"APRES AVOIR VAINCU LES GROS MECHANTS\n"                                   \
	"ET NETTOYE LA BASE LUNAIRE, VOUS AVEZ\n"                                  \
	"GAGNE, NON? PAS VRAI? OU EST DONC VOTRE\n"                                \
	" RECOMPENSE ET VOTRE BILLET DE\n"                                         \
	"RETOUR? QU'EST-QUE CA VEUT DIRE?CE"                                       \
	"N'EST PAS LA FIN ESPEREE!\n"                                              \
	"\n"                                                                       \
	"CA SENT LA VIANDE PUTREFIEE, MAIS\n"                                      \
	"ON DIRAIT LA BASE DEIMOS. VOUS ETES\n"                                    \
	"APPAREMMENT BLOQUE AUX PORTES DE L'ENFER.\n"                              \
	"LA SEULE ISSUE EST DE L'AUTRE COTE.\n"                                    \
	"\n"                                                                       \
	"POUR VIVRE LA SUITE DE DOOM, JOUEZ\n"                                     \
	"A 'AUX PORTES DE L'ENFER' ET A\n"                                         \
	"L'EPISODE SUIVANT, 'L'ENFER'!\n"

#define E2TEXT                                                                 \
	"VOUS AVEZ REUSSI. L'INFAME DEMON\n"                                       \
	"QUI CONTROLAIT LA BASE LUNAIRE DE\n"                                      \
	"DEIMOS EST MORT, ET VOUS AVEZ\n"                                          \
	"TRIOMPHE! MAIS... OU ETES-VOUS?\n"                                        \
	"VOUS GRIMPEZ JUSQU'AU BORD DE LA\n"                                       \
	"LUNE ET VOUS DECOUVREZ L'ATROCE\n"                                        \
	"VERITE.\n"                                                                \
	"\n"                                                                       \
	"DEIMOS EST AU-DESSUS DE L'ENFER!\n"                                       \
	"VOUS SAVEZ QUE PERSONNE NE S'EN\n"                                        \
	"EST JAMAIS ECHAPPE, MAIS CES FUMIERS\n"                                   \
	"VONT REGRETTER DE VOUS AVOIR CONNU!\n"                                    \
	"VOUS REDESCENDEZ RAPIDEMENT VERS\n"                                       \
	"LA SURFACE DE L'ENFER.\n"                                                 \
	"\n"                                                                       \
	"VOICI MAINTENANT LE CHAPITRE FINAL DE\n"                                  \
	"DOOM! -- L'ENFER."

#define E3TEXT                                                                 \
	"LE DEMON ARACHNEEN ET REPUGNANT\n"                                        \
	"QUI A DIRIGE L'INVASION DES BASES\n"                                      \
	"LUNAIRES ET SEME LA MORT VIENT DE SE\n"                                   \
	"FAIRE PULVERISER UNE FOIS POUR TOUTES.\n"                                 \
	"\n"                                                                       \
	"UNE PORTE SECRETE S'OUVRE. VOUS ENTREZ.\n"                                \
	"VOUS AVEZ PROUVE QUE VOUS POUVIEZ\n"                                      \
	"RESISTER AUX HORREURS DE L'ENFER.\n"                                      \
	"IL SAIT ETRE BEAU JOUEUR, ET LORSQUE\n"                                   \
	"VOUS SORTEZ, VOUS REVOYEZ LES VERTES\n"                                   \
	"PRAIRIES DE LA TERRE, VOTRE PLANETE.\n"                                   \
	"\n"                                                                       \
	"VOUS VOUS DEMANDEZ CE QUI S'EST PASSE\n"                                  \
	"SUR TERRE PENDANT QUE VOUS AVEZ\n"                                        \
	"COMBATTU LE DEMON. HEUREUSEMENT,\n"                                       \
	"AUCUN GERME DU MAL N'A FRANCHI\n"                                         \
	"CETTE PORTE AVEC VOUS..."

// after level 6, put this:

#define C1TEXT                                                                 \
	"VOUS ETES AU PLUS PROFOND DE L'ASTROPORT\n"                               \
	"INFESTE DE MONSTRES, MAIS QUELQUE CHOSE\n"                                \
	"NE VA PAS. ILS ONT APPORTE LEUR PROPRE\n"                                 \
	"REALITE, ET LA TECHNOLOGIE DE L'ASTROPORT\n"                              \
	"EST AFFECTEE PAR LEUR PRESENCE.\n"                                        \
	"\n"                                                                       \
	"DEVANT VOUS, VOUS VOYEZ UN POSTE AVANCE\n"                                \
	"DE L'ENFER, UNE ZONE FORTIFIEE. SI VOUS\n"                                \
	"POUVEZ PASSER, VOUS POURREZ PENETRER AU\n"                                \
	"COEUR DE LA BASE HANTEE ET TROUVER \n"                                    \
	"L'INTERRUPTEUR DE CONTROLE QUI GARDE LA \n"                               \
	"POPULATION DE LA TERRE EN OTAGE."

// After level 11, put this:

#define C2TEXT                                                                 \
	"VOUS AVEZ GAGNE! VOTRE VICTOIRE A PERMIS\n"                               \
	"A L'HUMANITE D'EVACUER LA TERRE ET \n"                                    \
	"D'ECHAPPER AU CAUCHEMAR. VOUS ETES \n"                                    \
	"MAINTENANT LE DERNIER HUMAIN A LA SURFACE \n"                             \
	"DE LA PLANETE. VOUS ETES ENTOURE DE \n"                                   \
	"MUTANTS CANNIBALES, D'EXTRATERRESTRES \n"                                 \
	"CARNIVORES ET D'ESPRITS DU MAL. VOUS \n"                                  \
	"ATTENDEZ CALMEMENT LA MORT, HEUREUX \n"                                   \
	"D'AVOIR PU SAUVER VOTRE RACE.\n"                                          \
	"MAIS UN MESSAGE VOUS PARVIENT SOUDAIN\n"                                  \
	"DE L'ESPACE: \"NOS CAPTEURS ONT LOCALISE\n"                               \
	"LA SOURCE DE L'INVASION EXTRATERRESTRE.\n"                                \
	"SI VOUS Y ALLEZ, VOUS POURREZ PEUT-ETRE\n"                                \
	"LES ARRETER. LEUR BASE EST SITUEE AU COEUR\n"                             \
	"DE VOTRE VILLE NATALE, PRES DE L'ASTROPORT.\n"                            \
	"VOUS VOUS RELEVEZ LENTEMENT ET PENIBLEMENT\n"                             \
	"ET VOUS REPARTEZ POUR LE FRONT."

// After level 20, put this:

#define C3TEXT                                                                 \
	"VOUS ETES AU COEUR DE LA CITE CORROMPUE,\n"                               \
	"ENTOURE PAR LES CADAVRES DE VOS ENNEMIS.\n"                               \
	"VOUS NE VOYEZ PAS COMMENT DETRUIRE LA PORTE\n"                            \
	"DES CREATURES DE CE COTE. VOUS SERREZ\n"                                  \
	"LES DENTS ET PLONGEZ DANS L'OUVERTURE.\n"                                 \
	"\n"                                                                       \
	"IL DOIT Y AVOIR UN MOYEN DE LA FERMER\n"                                  \
	"DE L'AUTRE COTE. VOUS ACCEPTEZ DE\n"                                      \
	"TRAVERSER L'ENFER POUR LE FAIRE?"

// After level 29, put this:

#define C4TEXT                                                                 \
	"LE VISAGE HORRIBLE D'UN DEMON D'UNE\n"                                    \
	"TAILLE INCROYABLE S'EFFONDRE DEVANT\n"                                    \
	"VOUS LORSQUE VOUS TIREZ UNE SALVE DE\n"                                   \
	"ROQUETTES DANS SON CERVEAU. LE MONSTRE\n"                                 \
	"SE RATATINE, SES MEMBRES DECHIQUETES\n"                                   \
	"SE REPANDANT SUR DES CENTAINES DE\n"                                      \
	"KILOMETRES A LA SURFACE DE L'ENFER.\n"                                    \
	"\n"                                                                       \
	"VOUS AVEZ REUSSI. L'INVASION N'AURA.\n"                                   \
	"PAS LIEU. LA TERRE EST SAUVEE. L'ENFER\n"                                 \
	"EST ANEANTI. EN VOUS DEMANDANT OU IRONT\n"                                \
	"MAINTENANT LES DAMNES, VOUS ESSUYEZ\n"                                    \
	"VOTRE FRONT COUVERT DE SUEUR ET REPARTEZ\n"                               \
	"VERS LA TERRE. SA RECONSTRUCTION SERA\n"                                  \
	"BEAUCOUP PLUS DROLE QUE SA DESTRUCTION.\n"

// Before level 31, put this:

#define C5TEXT                                                                 \
	"FELICITATIONS! VOUS AVEZ TROUVE LE\n"                                     \
	"NIVEAU SECRET! IL SEMBLE AVOIR ETE\n"                                     \
	"CONSTRUIT PAR LES HUMAINS. VOUS VOUS\n"                                   \
	"DEMANDEZ QUELS PEUVENT ETRE LES\n"                                        \
	"HABITANTS DE CE COIN PERDU DE L'ENFER."

// Before level 32, put this:

#define C6TEXT                                                                 \
	"FELICITATIONS! VOUS AVEZ DECOUVERT\n"                                     \
	"LE NIVEAU SUPER SECRET! VOUS FERIEZ\n"                                    \
	"MIEUX DE FONCER DANS CELUI-LA!\n"

//
// Character cast strings F_FINALE.C
//
#define CC_ZOMBIE "ZOMBIE"
#define CC_SHOTGUN "TYPE AU FUSIL"
#define CC_HEAVY "MEC SUPER-ARME"
#define CC_IMP "DIABLOTIN"
#define CC_DEMON "DEMON"
#define CC_LOST "AME PERDUE"
#define CC_CACO "CACODEMON"
#define CC_HELL "CHEVALIER DE L'ENFER"
#define CC_BARON "BARON DE L'ENFER"
#define CC_ARACH "ARACHNOTRON"
#define CC_PAIN "ELEMENTAIRE DE LA DOULEUR"
#define CC_REVEN "REVENANT"
#define CC_MANCU "MANCUBUS"
#define CC_ARCH "ARCHI-INFAME"
#define CC_SPIDER "L'ARAIGNEE CERVEAU"
#define CC_CYBER "LE CYBERDEMON"
#define CC_HERO "NOTRE HEROS"

#endif
//-----------------------------------------------------------------------------
//
// $Log:$
//
//-----------------------------------------------------------------------------
