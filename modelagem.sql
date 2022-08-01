CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"cartId" integer NOT NULL,
	"address1" integer NOT NULL,
	"address2" integer NOT NULL,
	"address3" integer NOT NULL,
	"address4" integer NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"categoryId" integer NOT NULL,
	"sizeId" integer NOT NULL,
	"picturesId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pictures" (
	"id" serial NOT NULL,
	"mainPicture" TEXT NOT NULL,
	"aPicture" TEXT NOT NULL,
	"bPicture" TEXT NOT NULL,
	"cPicture" TEXT NOT NULL,
	"dPicture" TEXT NOT NULL,
	"ePicture" TEXT NOT NULL,
	"fPicture" TEXT NOT NULL,
	"gPicture" TEXT NOT NULL,
	CONSTRAINT "pictures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"quantity" integer NOT NULL,
	"userId" integer NOT NULL,
	"productId" integer NOT NULL,
	"deliveryAddress" integer NOT NULL,
	"statusId" integer NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchaseStatuses" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"lastUpdate" TIMESTAMP NOT NULL,
	CONSTRAINT "purchaseStatuses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.addresses" (
	"id" serial NOT NULL,
	"address" TEXT NOT NULL,
	"complement" TEXT,
	"city" TEXT NOT NULL,
	"stateOrProvince" TEXT,
	"country" TEXT NOT NULL,
	"cep" integer NOT NULL,
	CONSTRAINT "addresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("cartId") REFERENCES "shoppingCarts"("id");
ALTER TABLE "users" ADD CONSTRAINT "users_fk1" FOREIGN KEY ("address1") REFERENCES "addresses"("id");
ALTER TABLE "users" ADD CONSTRAINT "users_fk2" FOREIGN KEY ("address2") REFERENCES "addresses"("id");
ALTER TABLE "users" ADD CONSTRAINT "users_fk3" FOREIGN KEY ("address3") REFERENCES "addresses"("id");
ALTER TABLE "users" ADD CONSTRAINT "users_fk4" FOREIGN KEY ("address4") REFERENCES "addresses"("id");

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("picturesId") REFERENCES "pictures"("id");




ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("deliveryAddress") REFERENCES "addresses"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk3" FOREIGN KEY ("statusId") REFERENCES "purchaseStatuses"("id");











