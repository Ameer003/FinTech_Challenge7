CREATE TABLE "transaction" (
    "id" int   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" float   NOT NULL,
    "card" VARCHAR(20)   NOT NULL,
    "id_merchant" int   NOT NULL,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "merchant_category" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "merchant" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "id_merchant_category" int   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "credit_card" (
    "card" VARCHAR(20)   NOT NULL,
    "cardholder_id" int   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card"
     )
);

CREATE TABLE "card_holder" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "id"
     )
);