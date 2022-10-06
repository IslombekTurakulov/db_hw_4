CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE library.Category (
	"categoryId" SERIAL NOT NULL,
	"categoryName" varchar NOT NULL,
	"categoryParentId" varchar NOT NULL,
	CONSTRAINT "Category_pk" PRIMARY KEY ("categoryId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE library.Book (
	"bookId" integer NOT NULL,
	"bookYear" DATE NOT NULL,
	"bookName" varchar NOT NULL,
	"bookAuthor" varchar NOT NULL,
	"bookPages" integer NOT NULL,
	"ISBN" varchar(13) NOT NULL DEFAULT '1',
	CONSTRAINT "Book_pk" PRIMARY KEY ("bookId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE library.Publisher (
	"publisherId" serial NOT NULL,
	"publisherName" varchar NOT NULL,
	"publisherAddress" varchar NOT NULL,
	CONSTRAINT "Publisher_pk" PRIMARY KEY ("publisherId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE library.BookCopy (
	"bookCopyId" serial NOT NULL,
	"shelfPos" varchar NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE library.Rent (
	"rentId" serial NOT NULL,
	"rentReturnDate" DATETIME NOT NULL,
	CONSTRAINT "Rent_pk" PRIMARY KEY ("rentId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE library.Reader (
	"id" serial NOT NULL,
	"firstName" varchar NOT NULL,
	"lastName" varchar,
	"address" varchar NOT NULL,
	"dateOfBirth" DATE,
	CONSTRAINT "Reader_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE library.Category ADD CONSTRAINT "Category_fk0" FOREIGN KEY ("categoryId") REFERENCES library.Book("bookId");
ALTER TABLE library.Category ADD CONSTRAINT "Category_fk1" FOREIGN KEY ("categoryName") REFERENCES library.Book("ISBN");
ALTER TABLE library.Category ADD CONSTRAINT "Category_fk2" FOREIGN KEY ("categoryParentId") REFERENCES library.Category("categoryId");


ALTER TABLE library.Publisher ADD CONSTRAINT "Publisher_fk0" FOREIGN KEY ("publisherId") REFERENCES library.Book("bookId");

ALTER TABLE library.BookCopy ADD CONSTRAINT "BookCopy_fk0" FOREIGN KEY ("bookCopyId") REFERENCES library.Book("bookId");

ALTER TABLE library.Rent ADD CONSTRAINT "Rent_fk0" FOREIGN KEY ("rentId") REFERENCES library.BookCopy("bookCopyId");

ALTER TABLE library.Reader ADD CONSTRAINT "Reader_fk0" FOREIGN KEY ("id") REFERENCES library.Rent("rentId");
