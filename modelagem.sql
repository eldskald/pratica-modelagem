CREATE DATABASE "pratica_modelagem";



CREATE TABLE "addresses" (
	"id" serial PRIMARY KEY,
	"address" TEXT NOT NULL,
	"complement" TEXT,
	"city" TEXT NOT NULL,
	"stateOrProvince" TEXT,
	"country" TEXT NOT NULL,
	"cep" integer NOT NULL
);



CREATE TABLE "users" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"address1" integer NOT NULL REFERENCES "addresses"("id"),
	"address2" integer NOT NULL REFERENCES "addresses"("id"),
	"address3" integer NOT NULL REFERENCES "addresses"("id"),
	"address4" integer NOT NULL REFERENCES "addresses"("id")
);



CREATE TABLE "categories" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL
);



CREATE TABLE "sizes" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL
);



CREATE TABLE "pictures" (
	"id" serial PRIMARY KEY,
	"mainPicture" TEXT NOT NULL,
	"picture1" TEXT NOT NULL,
	"picture2" TEXT NOT NULL,
	"picture3" TEXT NOT NULL,
	"picture4" TEXT NOT NULL,
	"picture5" TEXT NOT NULL,
	"picture6" TEXT NOT NULL,
	"picture7" TEXT NOT NULL
);



CREATE TABLE "products" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"categoryId" integer NOT NULL REFERENCES "categories"("id"),
	"sizeId" integer NOT NULL REFERENCES "sizes"("id"),
	"picturesId" integer NOT NULL REFERENCES "pictures"("id")
);



CREATE TABLE "purchaseStatuses" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL,
	"lastUpdate" TIMESTAMP NOT NULL DEFAULT NOW()
);



CREATE TABLE "purchases" (
	"id" serial PRIMARY KEY,
	"quantity" integer NOT NULL,
	"userId" integer NOT NULL REFERENCES "users"("id"),
	"productId" integer NOT NULL REFERENCES "products"("id"),
	"deliveryAddress" integer NOT NULL REFERENCES "addresses"("id"),
	"statusId" integer NOT NULL REFERENCES "purchaseStatuses"("id")
);
