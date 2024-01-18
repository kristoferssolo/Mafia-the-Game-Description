CREATE TABLE "LomasDarbiba" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "nosaukums" VARCHAR(255) UNIQUE NOT NULL,
  "apraksts" TEXT DEFAULT '' NOT NULL
);

CREATE TABLE "Attels" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "datnes_adrese" VARCHAR(255) UNIQUE NOT NULL,
  "pievienosanas_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE "Sesija" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "markieris" VARCHAR(255) UNIQUE NOT NULL,
  "deriguma_termins" TIMESTAMP NOT NULL
);

CREATE TABLE "ParolesAtjaunosana" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "markieris" VARCHAR(255) UNIQUE NOT NULL,
  "deriguma_termins" TIMESTAMP NOT NULL
);

CREATE TABLE "EpastaApstiprinajums" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "markieris" VARCHAR(255) UNIQUE NOT NULL,
  "deriguma_termins" TIMESTAMP NOT NULL
);

CREATE TABLE "KontaStavoklis" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "birka" VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE "IstabasStavoklis" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "birka" VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE "SpeletajaStavoklis" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "birka" VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE "Lietotajs" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "segvards" VARCHAR(255) UNIQUE NOT NULL,
  "epasts" VARCHAR(255) UNIQUE NOT NULL,
  "parole" VARCHAR(255) NOT NULL,
  "vards" VARCHAR(255) DEFAULT '' NOT NULL,
  "uzvards" VARCHAR(255) DEFAULT '' NOT NULL,
  "dzimsanas_datums" DATE,
  "bio_info" TEXT DEFAULT '' NOT NULL,
  "izveidosanas_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "ir_apstiprinats_epasts" BOOL DEFAULT FALSE NOT NULL,
  "stripe_id" VARCHAR(50) UNIQUE,
  "ir_adminstrators" BOOL DEFAULT FALSE NOT NULL,
  "konta_stavoklis" INT8 NOT NULL,
  "attels" INT8,
  "sesija" INT8 UNIQUE,
  "epasta_apstiprinajums" INT8 UNIQUE,
  "paroles_atjaunosana" INT8 UNIQUE,
  FOREIGN KEY ("konta_stavoklis") REFERENCES "KontaStavoklis" ("id"),
  FOREIGN KEY ("attels") REFERENCES "Attels" ("id"),
  FOREIGN KEY ("sesija") REFERENCES "Sesija" ("id"),
  FOREIGN KEY ("epasta_apstiprinajums") REFERENCES "EpastaApstiprinajums" ("id"),
  FOREIGN KEY ("paroles_atjaunosana") REFERENCES "ParolesAtjaunosana" ("id")
);

CREATE TABLE "SpelesLoma" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "nosaukums" VARCHAR(255) UNIQUE NOT NULL,
  "apraksts" TEXT DEFAULT '' NOT NULL,
  "ir_pamata" BOOL DEFAULT FALSE NOT NULL,
  "ir_mafija" BOOL DEFAULT FALSE NOT NULL,
  "attels" INT8,
  "autors" INT8,
  FOREIGN KEY ("attels") REFERENCES "Attels" ("id"),
  FOREIGN KEY ("autors") REFERENCES "Lietotajs" ("id")
);

CREATE TABLE "SpelesUzstadijums" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "nosaukums" VARCHAR(255) UNIQUE NOT NULL,
  "apraksts" TEXT DEFAULT '' NOT NULL,
  "ir_pamata" BOOL DEFAULT FALSE NOT NULL,
  "izveidosanas_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "autors" INT8 NOT NULL,
  FOREIGN KEY ("autors") REFERENCES "Lietotajs" ("id")
);

CREATE TABLE "Istaba" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "nosaukums" VARCHAR(255) UNIQUE NOT NULL,
  "speles_saksanas_laiks" TIMESTAMP,
  "speles_beigsanas_laiks" TIMESTAMP,
  "piekluves_kods" CHAR(6) UNIQUE NOT NULL,
  "izveidosanas_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "stavoklis" INT8 NOT NULL,
  "speles_uzstadijums" INT8 NOT NULL,
  FOREIGN KEY ("stavoklis") REFERENCES "IstabasStavoklis" ("id"),
  FOREIGN KEY ("speles_uzstadijums") REFERENCES "SpelesUzstadijums" ("id")
);

CREATE TABLE "SpelesNotikums" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "nosaukums" VARCHAR(255) UNIQUE NOT NULL,
  "nakts_pk" INT2 DEFAULT 0 NOT NULL CHECK ("nakts_pk" >= 0),
  "veids" VARCHAR(255),
  "ir_redzams" BOOL DEFAULT FALSE NOT NULL,
  "izveidosanas_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "taimeris" INTERVAL,
  "lomas_darbiba" INT8 NOT NULL,
  FOREIGN KEY ("lomas_darbiba") REFERENCES "LomasDarbiba" ("id")
);

CREATE TABLE "Speletajs" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "ir_noslepkavots" BOOL DEFAULT FALSE NOT NULL,
  "ir_izbalsots" BOOL DEFAULT FALSE NOT NULL,
  "ir_istabas_izveidotajs" BOOL DEFAULT FALSE NOT NULL,
  "stavoklis" INT8 NOT NULL,
  "istaba" INT8,
  "speles_loma" INT8,
  "lietotajs" INT8 NOT NULL,
  FOREIGN KEY ("stavoklis") REFERENCES "SpeletajaStavoklis" ("id"),
  FOREIGN KEY ("istaba") REFERENCES "Istaba" ("id"),
  FOREIGN KEY ("speles_loma") REFERENCES "SpelesLoma" ("id"),
  FOREIGN KEY ("lietotajs") REFERENCES "Lietotajs" ("id")
);

CREATE TABLE "Sarakste" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "teksts" TEXT NOT NULL,
  "ir_mafijas_sarakste" BOOL DEFAULT FALSE NOT NULL,
  "ir_izmainita" BOOL DEFAULT FALSE NOT NULL,
  "autors" INT8 NOT NULL,
  FOREIGN KEY ("autors") REFERENCES "Speletajs" ("id")
);

CREATE TABLE "NotikumsAizliedzAtlaujDarbibu" (
  "speletajs" INT8 NOT NULL,
  "lomas_darbiba" INT8 NOT NULL,
  "vai_pilda" BOOL DEFAULT TRUE NOT NULL,
  PRIMARY KEY ("speletajs", "lomas_darbiba"),
  FOREIGN KEY ("speletajs") REFERENCES "Speletajs" ("id"),
  FOREIGN KEY ("lomas_darbiba") REFERENCES "LomasDarbiba" ("id")
);

CREATE TABLE "SpeletajsIzraisaNotikumu" (
  "speletajs" INT8 NOT NULL,
  "speles_notikums" INT8 NOT NULL,
  PRIMARY KEY ("speletajs", "speles_notikums"),
  FOREIGN KEY ("speletajs") REFERENCES "Speletajs" ("id"),
  FOREIGN KEY ("speles_notikums") REFERENCES "SpelesNotikums" ("id")
);

CREATE TABLE "SpeletajsIetekmeNotikumu" (
  "speletajs" INT8 NOT NULL,
  "speles_notikums" INT8 NOT NULL,
  PRIMARY KEY ("speletajs", "speles_notikums"),
  FOREIGN KEY ("speletajs") REFERENCES "Speletajs" ("id"),
  FOREIGN KEY ("speles_notikums") REFERENCES "SpelesNotikums" ("id")
);

CREATE TABLE "SpelesUzstatijumuLomas" (
  "speles_uzstadijums" INT8 NOT NULL,
  "speles_loma" INT8 NOT NULL,
  "skaits" INT2 DEFAULT 1 NOT NULL CHECK ("skaits" >= 1),
  PRIMARY KEY ("speles_uzstadijums", "speles_loma"),
  FOREIGN KEY ("speles_uzstadijums") REFERENCES "SpelesUzstadijums" ("id"),
  FOREIGN KEY ("speles_loma") REFERENCES "SpelesLoma" ("id")
);

CREATE TABLE "SpelesLomasDarbibas" (
  "speles_loma" INT8 NOT NULL,
  "lomas_darbiba" INT8 NOT NULL,
  PRIMARY KEY ("speles_loma", "lomas_darbiba"),
  FOREIGN KEY ("speles_loma") REFERENCES "SpelesLoma" ("id"),
  FOREIGN KEY ("lomas_darbiba") REFERENCES "LomasDarbiba" ("id")
);

CREATE TABLE "NotikumsIetekmeSpeletaju" (
  "speletajs" INT8 NOT NULL,
  "speles_notikums" INT8 NOT NULL,
  "ir_atlauts" BOOL DEFAULT TRUE,
  PRIMARY KEY ("speletajs", "speles_notikums"),
  FOREIGN KEY ("speletajs") REFERENCES "Speletajs" ("id"),
  FOREIGN KEY ("speles_notikums") REFERENCES "SpelesNotikums" ("id")
);

CREATE TABLE "Atbilde" (
  "id" SERIAL8 PRIMARY KEY NOT NULL,
  "raksta" INT8 NOT NULL,
  "atbild" INT8 NOT NULL,
  FOREIGN KEY ("raksta") REFERENCES "Sarakste" ("id"),
  FOREIGN KEY ("atbild") REFERENCES "Sarakste" ("id")
);
