CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE library.Category (
	"categoryId" SERIAL PRIMARY KEY,
	"categoryName" varchar NOT NULL,
	"categoryParentId" integer NOT NULL
);

CREATE TABLE library.Book (
	"bookYear" TIMESTAMP NOT NULL,
	"bookName" varchar NOT NULL,
	"bookAuthor" integer NOT NULL,
	"bookPages" integer NOT NULL,
	"ISBN" varchar(13) NOT NULL DEFAULT '1',
	 PRIMARY KEY ("ISBN")
);


CREATE TABLE library.Publisher (
	"publisherId" SERIAL PRIMARY KEY,
	"publisherName" varchar NOT NULL,
	"publisherAddress" varchar NOT NULL
);


CREATE TABLE library.BookCopy (
	"bookCopyId" integer PRIMARY KEY,
	"shelfPos" varchar NOT NULL
);


CREATE TABLE library.Rent (
	"rentId" SERIAL PRIMARY KEY,
	"rentReturnDate" TIMESTAMP NOT NULL,
	"readerId" integer
);


CREATE TABLE library.Reader (
	"id" SERIAL PRIMARY KEY,
	"firstName" varchar NOT NULL,
	"lastName" varchar,
	"address" varchar NOT NULL,
	"dateOfBirth" DATE
);


ALTER TABLE library.Category ADD FOREIGN KEY ("categoryId") REFERENCES library.Book("bookId");

ALTER TABLE library.Category ADD FOREIGN KEY ("categoryName") REFERENCES library.Book("ISBN");

ALTER TABLE library.Category ADD FOREIGN KEY ("categoryParentId") REFERENCES library.Category("categoryId");

ALTER TABLE library.Publisher ADD FOREIGN KEY ("publisherId") REFERENCES library.Book("ISBN");

ALTER TABLE library.BookCopy ADD FOREIGN KEY ("bookCopyId") REFERENCES library.Book("ISBN");

ALTER TABLE library.Rent ADD FOREIGN KEY ("rentId") REFERENCES library.BookCopy("bookCopyId");

ALTER TABLE library.Reader ADD FOREIGN KEY ("id") REFERENCES library.Rent("rentId");
