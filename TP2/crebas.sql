/*==============================================================*/
/* Nom de SGBD :  Microsoft Access 2000                         */
/* Date de création :  13/09/2017 13:32:41                      */
/*==============================================================*/


alter table EXPOSANT
   drop constraint FK_EXPOSANT_APPARTIEN_TYPE_EXP;

alter table PAYE
   drop constraint FK_PAYE_PAYE_TYPE_EXP;

alter table PAYE
   drop constraint FK_PAYE_PAYE2_TYPESTAN;

alter table STAND
   drop constraint FK_STAND_EST_TYPESTAN;

drop table EXPOSANT;

drop table PAYE;

drop table STAND;

drop table TYPESTAND;

drop table TYPE_EXPOSANT;

/*==============================================================*/
/* Table : EXPOSANT                                             */
/*==============================================================*/
create table EXPOSANT
(
    ENO                  INTEGER         not null,
    CODIF                NOTE            not null,
    NOM                  NOTE,
    ADRESSE              NOTE,
    CODEPOSTAL           NOTE,
constraint PK_EXPOSANT primary key (ENO)
);

/*==============================================================*/
/* Table : PAYE                                                 */
/*==============================================================*/
create table PAYE
(
    CODIF                NOTE            not null,
    TYPE                 NOTE            not null,
    TARIF                INTEGER,
constraint PK_PAYE primary key (CODIF, TYPE)
);

/*==============================================================*/
/* Table : STAND                                                */
/*==============================================================*/
create table STAND
(
    IDSTAND              NOTE            not null,
    TYPE                 NOTE            not null,
    ALLEE                INTEGER,
    PLACE                INTEGER,
constraint PK_STAND primary key (IDSTAND)
);

/*==============================================================*/
/* Table : TYPESTAND                                            */
/*==============================================================*/
create table TYPESTAND
(
    TYPE                 NOTE            not null,
    DESCRIPTION          NOTE,
constraint PK_TYPESTAND primary key (TYPE)
);

/*==============================================================*/
/* Table : TYPE_EXPOSANT                                        */
/*==============================================================*/
create table TYPE_EXPOSANT
(
    CODIF                NOTE            not null,
    DESCRIPTION          NOTE,
constraint PK_TYPE_EXPOSANT primary key (CODIF)
);

alter table EXPOSANT
   add constraint FK_EXPOSANT_APPARTIEN_TYPE_EXP foreign key (CODIF)
      references TYPE_EXPOSANT (CODIF);

alter table PAYE
   add constraint FK_PAYE_PAYE_TYPE_EXP foreign key (CODIF)
      references TYPE_EXPOSANT (CODIF);

alter table PAYE
   add constraint FK_PAYE_PAYE2_TYPESTAN foreign key (TYPE)
      references TYPESTAND (TYPE);

alter table STAND
   add constraint FK_STAND_EST_TYPESTAN foreign key (TYPE)
      references TYPESTAND (TYPE);

