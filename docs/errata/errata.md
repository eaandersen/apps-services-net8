**Errata** (1 items)

If you find any mistakes, then please [raise an issue in this repository](https://github.com/markjprice/apps-services-net8/issues) or email me at markjprice (at) gmail.com.

- [Page 104 - Table-per-concrete-type (TPC) mapping strategy](#page-104---table-per-concrete-type-tpc-mapping-strategy)


# Page 104 - Table-per-concrete-type (TPC) mapping strategy

> Thanks to [Jorge Morales](https://github.com/jmoralesv) for raising this [issue on December 12, 2023](https://github.com/markjprice/apps-services-net7/issues/22).

I show the SQL to define the two tables used in the TPC mapping strategy but it includes a foreign key constraint to a `People` table that does not exist, as shown in the following code:

```sql
CREATE TABLE [Students] (
  [Id] int NOT NULL DEFAULT (NEXT VALUE FOR [PersonIds]),
  [Name] nvarchar(max) NOT NULL,
  [Subject] nvarchar(max) NULL,
  CONSTRAINT [PK_Students] PRIMARY KEY ([Id])
  CONSTRAINT [FK_Students_People] FOREIGN KEY ([Id]) REFERENCES [People] ([Id])
);

CREATE TABLE [Employees] (
  [Id] int NOT NULL DEFAULT (NEXT VALUE FOR [PersonIds]),
  [Name] nvarchar(max) NOT NULL,
  [HireDate] nvarchar(max) NULL,
  CONSTRAINT [PK_Employees] PRIMARY KEY ([Id])
  CONSTRAINT [FK_Employees_People] FOREIGN KEY ([Id]) REFERENCES [People] ([Id])
);
```

I mistakenly copied some of the SQL from another strategy. In the next edition, I will correct the SQL, as shown in the following code:

```sql
CREATE TABLE [Employees] (
  [Id] int NOT NULL DEFAULT (NEXT VALUE FOR [PersonIds]),
  [Name] nvarchar(40) NOT NULL,
  [HireDate] datetime2 NOT NULL,
  CONSTRAINT [PK_Employees] PRIMARY KEY ([Id])
);

CREATE TABLE [Students] (
  [Id] int NOT NULL DEFAULT (NEXT VALUE FOR [PersonIds]),
  [Name] nvarchar(40) NOT NULL,
  [Subject] nvarchar(max) NULL,
  CONSTRAINT [PK_Students] PRIMARY KEY ([Id])
);
```

After the note saying, "Since there is not a single table with an IDENTITY column to assign Id values, we can use the (NEXT VALUE FOR [PersonIds]) command to define a sequence shared between the two tables so they do not assign the same Id values." I will show the SQL to define the sequence, as shown in the following code:

```sql
CREATE SEQUENCE [PersonIds] AS int START WITH 4 INCREMENT BY 1 NO MINVALUE NO MAXVALUE NO CYCLE;
```
