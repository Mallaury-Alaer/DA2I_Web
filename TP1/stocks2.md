/*==============================================================*/
/* Nom de SGBD :  Microsoft Access 2000                         */
/* Date de création :  12/09/2017 11:18:38                      */
/*==============================================================*/


alter table COMMANDES
   drop constraint FK_COMMANDE_CONTIENT_PRODUITS;

alter table COMMANDES
   drop constraint FK_COMMANDE_FOURNIT_FOURNISS;

drop table COMMANDES;

drop table FOURNISSEURS;

drop table PRODUITS;

/*==============================================================*/
/* Table : COMMANDES                                            */
/*==============================================================*/
create table COMMANDES
(
    CNO                  INTEGER         not null,
    FNO                  INTEGER         not null,
    PNO                  INTEGER         not null,
    QUTE                 INTEGER,
constraint PK_COMMANDES primary key (CNO)
);

/*==============================================================*/
/* Table : FOURNISSEURS                                         */
/*==============================================================*/
create table FOURNISSEURS
(
    FNO                  INTEGER         not null,
    NOM                  NOTE,
    ADRESSE              NOTE,
    VILLE                NOTE,
constraint PK_FOURNISSEURS primary key (FNO)
);

/*==============================================================*/
/* Table : PRODUITS                                             */
/*==============================================================*/
create table PRODUITS
(
    PNO                  INTEGER         not null,
    DESIGN               NOTE,
    PRIX                 NOTE,
    POIDS                NOTE,
    COULEUR              NOTE,
constraint PK_PRODUITS primary key (PNO)
);

alter table COMMANDES
   add constraint FK_COMMANDE_CONTIENT_PRODUITS foreign key (PNO)
      references PRODUITS (PNO);

alter table COMMANDES
   add constraint FK_COMMANDE_FOURNIT_FOURNISS foreign key (FNO)
      references FOURNISSEURS (FNO);

