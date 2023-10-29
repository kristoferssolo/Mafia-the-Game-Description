CREATE TABLE
  "LomasDarbiba" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "nosaukums" VARCHAR(255) UNIQUE NOT NULL,
    "ir_nekavejoties" BOOL DEFAULT FALSE NOT NULL
  );

CREATE TABLE
  "LomasTrukums" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "nosaukums" VARCHAR(255) UNIQUE NOT NULL,
    "apraksts" TEXT DEFAULT '' NOT NULL
  );

CREATE TABLE
  "Attels" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "datnes_adrese" VARCHAR(255) UNIQUE,
    "pievienosanas_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
  );

CREATE TABLE
  "AbonementaCena" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "cena" DECIMAL(16, 2) DEFAULT 0 NOT NULL CHECK (cena >= 0),
    "pievienosanas_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "aktivizesanas_laiks" TIMESTAMP NOT NULL CHECK (aktivizesanas_laiks >= pievienosanas_laiks)
  );

CREATE TABLE
  "ParolesAtjaunosana" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "markieris" VARCHAR(255) NOT NULL, -- TODO:
    "deriguma_termins" TIMESTAMP NOT NULL
  );

CREATE TABLE
  "EpastaApstiprinajums" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "markieris" VARCHAR(255) NOT NULL, -- TODO:
    "deriguma_termins" TIMESTAMP NOT NULL
  );

CREATE TABLE
  "SpelesLoma" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "nosaukums" VARCHAR(255) UNIQUE NOT NULL,
    "apraksts" TEXT DEFAULT '' NOT NULL,
    "max_speletaju_skaits" INT DEFAULT 1 CHECK ("max_speletaju_skaits" > 0) NOT NULL,
    "attels" INT8,
    FOREIGN KEY ("attels") REFERENCES "Attels" ("id")
  );

CREATE TABLE
  "Statuss" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "teksts" VARCHAR(255) UNIQUE NOT NULL
  );

CREATE TABLE
  "Lietotajs" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "segvards" VARCHAR(255) UNIQUE NOT NULL,
    "epasts" VARCHAR(255) UNIQUE NOT NULL,
    "parole" VARCHAR(255) NOT NULL,
    "vards" VARCHAR(255),
    "uzvards" VARCHAR(255),
    "dzimsanas_datums" DATE,
    "bio_info" TEXT DEFAULT '',
    "izveidosanas_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "konta_stavoklis" INT8 NOT NULL,
    "attels" INT8,
    "epasta_apstiprinajums" INT8 UNIQUE,
    "paroles_atjaunosana" INT8 UNIQUE,
    FOREIGN KEY ("konta_stavoklis") REFERENCES "Statuss" ("id"),
    FOREIGN KEY ("attels") REFERENCES "Attels" ("id"),
    FOREIGN KEY ("epasta_apstiprinajums") REFERENCES "EpastaApstiprinajums" ("id"),
    FOREIGN KEY ("paroles_atjaunosana") REFERENCES "ParolesAtjaunosana" ("id")
  );

CREATE TABLE
  "SpelesUzstadijums" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "nosaukums" VARCHAR(255) UNIQUE NOT NULL,
    "apraksts" TEXT DEFAULT '' NOT NULL,
    "ir_pamata" BOOL DEFAULT FALSE NOT NULL,
    "ir_aktivs" BOOL DEFAULT TRUE NOT NULL,
    "izveidosanas_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "autors" INT8 NOT NULL,
    FOREIGN KEY ("autors") REFERENCES "Lietotajs" ("id")
  );

CREATE TABLE
  "SpelesIstaba" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "speles_saksanas_laiks" TIMESTAMP,
    "stavoklis" INT8 NOT NULL,
    "piekluves_kods" CHAR(6) UNIQUE,
    "pedejas_stadijas_izmaina" INT8,
    "vai_rada_miruso_lomu" BOOL DEFAULT FALSE NOT NULL,
    "izveidosanas_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "speles_uzstadijums" INT8 NOT NULL,
    FOREIGN KEY ("stavoklis") REFERENCES "Statuss" ("id"),
    FOREIGN KEY ("pedejas_stadijas_izmaina") REFERENCES "Statuss" ("id"),
    FOREIGN KEY ("speles_uzstadijums") REFERENCES "SpelesUzstadijums" ("id")
  );

CREATE TABLE
  "SpelesNotikums" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "nakts_pk" INT2 DEFAULT 0 NOT NULL,
    "veids" VARCHAR(255),
    "ir_redzams" BOOL DEFAULT FALSE NOT NULL,
    "izveidosanas_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
  );

CREATE TABLE
  "Speletajs" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "ir_noslepkavots" BOOL DEFAULT FALSE NOT NULL,
    "ir_izbalsots" BOOL DEFAULT FALSE NOT NULL,
    "ir_izslegts" BOOL DEFAULT FALSE NOT NULL,
    "redz_mafijas_sakarus" BOOL DEFAULT FALSE NOT NULL,
    "ir_aktivs" BOOL DEFAULT TRUE NOT NULL,
    "redz_sakarus" BOOL DEFAULT TRUE NOT NULL,
    "speles_istaba" INT8,
    "speles_loma" INT8 NOT NULL,
    FOREIGN KEY ("speles_istaba") REFERENCES "SpelesIstaba" ("id"),
    FOREIGN KEY ("speles_loma") REFERENCES "SpelesLoma" ("id")
  );

CREATE TABLE
  "MaksasAbonements" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "stripe_id" VARCHAR(255) UNIQUE NOT NULL,
    "stavoklis" INT8 NOT NULL,
    "sakuma_laiks" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "termins" INTERVAL NOT NULL,
    "atteikuma_laiks" TIMESTAMP,
    "lietotajs" INT8 NOT NULL,
    "abonementa_cena" INT8 NOT NULL,
    FOREIGN KEY ("stavoklis") REFERENCES "Statuss" ("id"),
    FOREIGN KEY ("lietotajs") REFERENCES "Lietotajs" ("id"),
    FOREIGN KEY ("abonementa_cena") REFERENCES "AbonementaCena" ("id")
  );

CREATE TABLE
  "Iszina" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "teksts" TEXT NOT NULL,
    "ir_mafijas_iszina" BOOL DEFAULT FALSE NOT NULL,
    "ir_izmainita" BOOL DEFAULT FALSE NOT NULL,
    "autors" INT8 NOT NULL,
    FOREIGN KEY ("autors") REFERENCES "Speletajs" ("id")
  );

CREATE TABLE
  "SpeletajaDarbiba" (
    "speletajs" INT8 NOT NULL,
    "lomas_darbiba" INT8 NOT NULL,
    PRIMARY KEY ("speletajs", "lomas_darbiba"),
    FOREIGN KEY ("speletajs") REFERENCES "Speletajs" ("id"),
    FOREIGN KEY ("lomas_darbiba") REFERENCES "LomasDarbiba" ("id")
  );

CREATE TABLE
  "SpeletajsIzraisaNotikumu" (
    "speletajs" INT8 NOT NULL,
    "speles_notikums" INT8 NOT NULL,
    PRIMARY KEY ("speletajs", "speles_notikums"),
    FOREIGN KEY ("speletajs") REFERENCES "Speletajs" ("id"),
    FOREIGN KEY ("speles_notikums") REFERENCES "SpelesNotikums" ("id")
  );

CREATE TABLE
  "SpelesUzstatijumuLomas" (
    "speles_uzstadijums" INT8 NOT NULL,
    "speles_loma" INT8 NOT NULL,
    PRIMARY KEY ("speles_uzstadijums", "speles_loma"),
    FOREIGN KEY ("speles_uzstadijums") REFERENCES "SpelesUzstadijums" ("id"),
    FOREIGN KEY ("speles_loma") REFERENCES "SpelesLoma" ("id")
  );

CREATE TABLE
  "LomasAtlautieNotikumi" (
    "speles_loma" INT8 NOT NULL,
    "speles_notikums" INT8 NOT NULL,
    PRIMARY KEY ("speles_loma", "speles_notikums"),
    FOREIGN KEY ("speles_loma") REFERENCES "SpelesLoma" ("id"),
    FOREIGN KEY ("speles_notikums") REFERENCES "SpelesNotikums" ("id")
  );

CREATE TABLE
  "SpelesLomasTrukums" (
    "speles_loma" INT8 NOT NULL,
    "lomas_trukums" INT8 NOT NULL,
    PRIMARY KEY ("speles_loma", "lomas_trukums"),
    FOREIGN KEY ("speles_loma") REFERENCES "SpelesLoma" ("id"),
    FOREIGN KEY ("lomas_trukums") REFERENCES "LomasTrukums" ("id")
  );

CREATE TABLE
  "SpelesLomasDarbibas" (
    "speles_loma" INT8 NOT NULL,
    "lomas_darbiba" INT8 NOT NULL,
    PRIMARY KEY ("speles_loma", "lomas_darbiba"),
    FOREIGN KEY ("speles_loma") REFERENCES "SpelesLoma" ("id"),
    FOREIGN KEY ("lomas_darbiba") REFERENCES "LomasDarbiba" ("id")
  );

CREATE TABLE
  "Atbilde" (
    "id" SERIAL8 PRIMARY KEY NOT NULL,
    "raksta" INT8 NOT NULL,
    "atbild" INT8 NOT NULL,
    FOREIGN KEY ("raksta") REFERENCES "Iszina" ("id"),
    FOREIGN KEY ("atbild") REFERENCES "Iszina" ("id")
  );

CREATE TABLE
  "NotikumsIetekmeSpeletaju" (
    "speletajs" INT8 NOT NULL,
    "speles_notikums" INT8 NOT NULL,
    PRIMARY KEY ("speletajs", "speles_notikums"),
    FOREIGN KEY ("speletajs") REFERENCES "Speletajs" ("id"),
    FOREIGN KEY ("speles_notikums") REFERENCES "SpelesNotikums" ("id")
  );
