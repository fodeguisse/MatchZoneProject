#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: message
#------------------------------------------------------------

CREATE TABLE message(
        id        Int  Auto_increment  NOT NULL ,
        content   Text NOT NULL ,
        createdAt Datetime NOT NULL
	,CONSTRAINT message_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: role
#------------------------------------------------------------

CREATE TABLE role(
        id   Int  Auto_increment  NOT NULL ,
        role Varchar (50) NOT NULL
	,CONSTRAINT role_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        id        Int  Auto_increment  NOT NULL ,
        lastname  Varchar (50) NOT NULL ,
        firstname Varchar (50) NOT NULL ,
        email     Varchar (100) NOT NULL ,
        password  Varchar (255) NOT NULL ,
        phone     Varchar (150) NOT NULL ,
        id_role   Int NOT NULL
	,CONSTRAINT user_PK PRIMARY KEY (id)

	,CONSTRAINT user_role_FK FOREIGN KEY (id_role) REFERENCES role(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tournament
#------------------------------------------------------------

CREATE TABLE tournament(
        id        Int  Auto_increment  NOT NULL ,
        name      Varchar (150) NOT NULL ,
        createdAt Datetime NOT NULL ,
        updatedAt Datetime NOT NULL ,
        eventDate Datetime NOT NULL ,
        adress    Varchar (255) NOT NULL ,
        id_user   Int NOT NULL
	,CONSTRAINT tournament_PK PRIMARY KEY (id)

	,CONSTRAINT tournament_user_FK FOREIGN KEY (id_user) REFERENCES user(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: match
#------------------------------------------------------------

CREATE TABLE match(
        id            Int  Auto_increment  NOT NULL ,
        name          Varchar (150) NOT NULL ,
        adress        Varchar (255) NOT NULL ,
        createdAt     Datetime NOT NULL ,
        updatedAt     Datetime NOT NULL ,
        eventDate     Datetime NOT NULL ,
        image         Varchar (255) NOT NULL ,
        id_user       Int NOT NULL ,
        id_tournament Int
	,CONSTRAINT match_PK PRIMARY KEY (id)

	,CONSTRAINT match_user_FK FOREIGN KEY (id_user) REFERENCES user(id)
	,CONSTRAINT match_tournament0_FK FOREIGN KEY (id_tournament) REFERENCES tournament(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: team
#------------------------------------------------------------

CREATE TABLE team(
        id            Int  Auto_increment  NOT NULL ,
        name          Varchar (100) NOT NULL ,
        numberPlayers Int NOT NULL ,
        id_user       Int NOT NULL
	,CONSTRAINT team_PK PRIMARY KEY (id)

	,CONSTRAINT team_user_FK FOREIGN KEY (id_user) REFERENCES user(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: comment
#------------------------------------------------------------

CREATE TABLE comment(
        id       Int  Auto_increment  NOT NULL ,
        content  Text NOT NULL ,
        id_match Int NOT NULL
	,CONSTRAINT comment_PK PRIMARY KEY (id)

	,CONSTRAINT comment_match_FK FOREIGN KEY (id_match) REFERENCES match(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: concern
#------------------------------------------------------------

CREATE TABLE concern(
        id      Int NOT NULL ,
        id_user Int NOT NULL
	,CONSTRAINT concern_PK PRIMARY KEY (id,id_user)

	,CONSTRAINT concern_message_FK FOREIGN KEY (id) REFERENCES message(id)
	,CONSTRAINT concern_user0_FK FOREIGN KEY (id_user) REFERENCES user(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: have
#------------------------------------------------------------

CREATE TABLE have(
        id       Int NOT NULL ,
        id_match Int NOT NULL
	,CONSTRAINT have_PK PRIMARY KEY (id,id_match)

	,CONSTRAINT have_team_FK FOREIGN KEY (id) REFERENCES team(id)
	,CONSTRAINT have_match0_FK FOREIGN KEY (id_match) REFERENCES match(id)
)ENGINE=InnoDB;

