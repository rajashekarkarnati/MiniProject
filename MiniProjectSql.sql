use Rajnikanth
use Training_20Feb_Mumbai
create schema rajkarna_174851
drop schema Raj_174851
drop table Raj_174851.Customer
drop table Raj_174851.InsuranceProducts
drop table Raj_174851.Policy
drop table Raj_174851.Documents
drop table Raj_174851.Endorsement
drop table Customer
select * from Customer

drop table Customer

create table rajkarna_174851.Customer
(
	CustomerId int primary key not null Identity(100, 1),
	UserName varchar(25) not null, 	
	Password varchar(25) not null,
	Name varchar(50) not null,
	Address varchar(250) not null,
	Telephone varchar(10) not null,
	Gender varchar(10) check(Gender in ('Male', 'Female', 'Others')),
	DOB date not null,
	isSmoker varchar(10)check(isSmoker in ('Smoker', 'NonSmoker')),
	Hobbies varchar(50) not null,
	CreatedDate date default getdate()
)

drop table customer
insert into Customer(UserName,Password,Name,Address,Telephone,Gender,DOB,isSmoker,Hobbies) values('Rajni','rajnikanth','Rajnikanth','Chennai','9874563219','Male','2019-09-09','Smoker','Swimming')
select * from rajkarna_174851.Customer
select * from InsuranceProducts

create table rajkarna_174851.InsuranceProducts
(
	Policyno int not null primary key identity,
	ProductLine varchar(10),
	ProductName varchar(50) not null,
	PremiumPaymentFrequency varchar(10) not null check (PremiumPaymentFrequency in('Monthly','Quarterly','HalfYearly','Annually')),
	CoverAmount money not null,
	Term int not null,
	UplaodedDate date default getdate(),
	UpdatedDate date default getdate()
)

drop table Endorsement
drop table Documents
drop table Policy
drop table InsuranceProducts
drop table Customer
use Rajnikanth
select * from rajkarna_174851.InsuranceProducts
delete InsuranceProducts where Policyno = 2
drop table InsuranceProducts
select * from Policy where Policyno=4

create table rajkarna_174851.Policy
(	
	Policyno int not null foreign key references rajkarna_174851.InsuranceProducts(Policyno),
	CustomerId int not null foreign key references rajkarna_174851.Customer(CustomerId),
	ProductId int not null primary key Identity,
	Nominee varchar(50) not null,
	Relation varchar(50) not null,
	NomineeAddress varchar(250) not null,
	NomineeTelephone varchar(10) not null,
	NomineeDOB date not null,
	BoughtDate date default getdate(),
	UpdatedDate date 
)
insert into Policy(Policyno, CustomerId, Nominee, Relation, NomineeAddress, NomineeTelephone, NomineeDOB, BoughtDate) values(4, 100, 'Rajni', 'Freind', 'Chennai', '999999999', '2019-09-09', '2018-02-09')
insert into Policy(Policyno, CustomerId, Nominee, Relation, NomineeAddress, NomineeTelephone, NomineeDOB, BoughtDate) values(5, 100, 'Rajni', 'Freind', 'Chennai', '999999999', '2019-09-09', '2018-02-09')

select * from Policy
create table rajkarna_174851.Documents
(
	SNo int primary key Identity not null,
	Policyno int not null foreign key references rajkarna_174851.InsuranceProducts(Policyno),
	Idcard varchar(10) not null,
	Photo image not null,
	UploadedDate date default getdate()
)
ALTER TABLE Documents
ALTER COLUMN Photo nVarchar(max);
create table rajkarna_174851.Endorsement
(
	EndorsementId int primary key not null,
	CustomerId int not null foreign key references rajkarna_174851.Customer(CustomerId),
	ProductId int not null foreign key references rajkarna_174851.Policy(ProductId),
	Policyno int not null foreign key references rajkarna_174851.InsuranceProducts(Policyno),
	ChangesMade varchar(100) not null,
	Status varchar(15) check(Status in ('Accepted', 'Rejected', 'InProgress')),
	CreatedDate date default getdate(),
	ApprovedDate date,
	RejectedDate date
)
insert into Endorsement(EndorsementId,CustomerId,ProductId,Policyno,ChangesMade,Status,CreatedDate) values(1, 100, 1, 4, '{skjdh}', 'InProgress', '2019-09-09')
update Endorsement set Status='InProgress' where EndorsementId=1
select * from Endorsement


---============================================

create schema Raj_174851
drop table Raj_174851.Customer
drop table Raj_174851.InsuranceProducts
drop table Raj_174851.Customer
select * from Customer
create table Customer
(
	CustomerId int primary key not null Identity(100, 1),
	Password varchar(25) not null,
	Name varchar(50) not null,
	Address varchar(250) not null,
	Telephone varchar(10) not null,
	Gender varchar(10) check(Gender in ('Male', 'Female', 'Others')),
	DOB date not null,
	isSmoker varchar(10)check(isSmoker in ('Smoker', 'NonSmoker')),
	Hobbies varchar(50) not null,
	CreatedDate date default getdate(),
	Role varchar(15) not null,
	Username varchar(15) not null
)

insert into Customer(Username,Role,Password,Name,Address,Telephone,Gender,DOB,isSmoker,Hobbies) values('raj','admin','admin','Rajashekar','Hyderabad','9874563219','Male','1996-09-09','Smoker','Swimming')
insert into Customer(Username,Role,Password,Name,Address,Telephone,Gender,DOB,isSmoker,Hobbies) values('rajni','customer','customer','Rajni','Chennai','9874563219','Male','1992-12-12','Smoker','Swimming')
update Customer set Role='customer' where CustomerId=101
alter table customer add Role varchar(15)
drop table customer
delete from Policy
delete from Endorsement
delete from Documents
delete from InsuranceProducts
delete from customer
insert into Customer(Password,Name,Address,Telephone,Gender,DOB,isSmoker,Hobbies) values('dsd','dsad','dsad','32332','Male','2019-09-09','Smoker','wdw')
select * from Customer
select * from InsuranceProducts
select * from Endorsement
select * from Documents
select * from Policy

update Customer set Role='Admin' where CustomerId=101

create table InsuranceProducts
(
	Policyno int not null primary key identity,
	ProductName varchar(50) not null,
	PremiumPaymentFrequency varchar(10) not null check(PremiumPaymentFrequency in ('Monthly', 'Quarterly', 'Halfyearly', 'Annually')),
	SumAssured money not null,
	TotalPremium money not null,
	TotalPayment money not null,
	UplaodedDate date default getdate()
)

insert into InsuranceProducts values('Car(Non-Life)', 'Annually', 500000, 12500, 450000, '2018-12-12')
insert into InsuranceProducts values('Accident(Life)', 'Annually', 500000, 12500, 450000, '2018-12-12')
insert into InsuranceProducts values('Bike(Non-Life)', 'Annually', 500000, 12500, 450000, '2018-12-12')

use Rajnikanth
alter table InsuranceProducts add check(PremiumPaymentFrequency in ('Monthly', 'Quarterly', 'Halfyearly', 'Annually'))
alter table InsuranceProducts drop column BasePremium
select * from InsuranceProducts
delete InsuranceProducts where Policyno = 2
drop table InsuranceProducts
select * from Policy where Policyno=4

create table Policy
(
	Policyno int not null foreign key references InsuranceProducts(Policyno),
	CustomerId int not null foreign key references Customer(CustomerId),
	ProductId int not null primary key Identity,
	Nominee varchar(50) not null,
	Relation varchar(50) not null,
	NomineeAddress varchar(250) not null,
	NomineeTelephone varchar(10) not null,
	NomineeDOB date not null,
	BoughtDate date default getdate(),
	UpdatedDate date 
)

insert into Policy(Policyno, CustomerId, Nominee, Relation, NomineeAddress, NomineeTelephone, NomineeDOB, BoughtDate) values(1, 101, 'Rajni', 'Uncle', 'Chennai', '999999999', '2019-09-09', '2018-02-09')
insert into Policy(Policyno, CustomerId, Nominee, Relation, NomineeAddress, NomineeTelephone, NomineeDOB, BoughtDate) values(2, 101, 'Rajni', 'Uncle', 'Chennai', '999999999', '2019-09-09', '2018-02-09')
insert into Policy(Policyno, CustomerId, Nominee, Relation, NomineeAddress, NomineeTelephone, NomineeDOB, BoughtDate) values(3, 101, 'Rajni', 'Uncle', 'Chennai', '999999999', '2019-09-09', '2018-02-09')

select * from Policy
create table Documents
(
	SNo int primary key Identity not null,
	Policyno int not null foreign key references InsuranceProducts(Policyno),
	Idcard varchar(10) not null,
	Photo nvarchar(500) not null,
	UploadedDate date default getdate()
)
alter table Documents add Photo nvarchar(500)
ALTER TABLE Documents
ALTER COLUMN Photo nVarchar(max);
delete from Endorsement
create table Endorsement
(
	EndorsementId int primary key not null,
	CustomerId int not null foreign key references Customer(CustomerId),
	ProductId int not null foreign key references Policy(ProductId),
	Policyno int not null foreign key references InsuranceProducts(Policyno),
	ChangesMade varchar(100) not null,
	Status varchar(15) check(Status in ('Accepted', 'Rejected', 'InProgress')),
	CreatedDate date default getdate(),
	ApprovedDate date,
	RejectedDate date,
	ChangedPremiumPaymentFrequency varchar(10) ,
	ChangedSumAssured money,
	ChangedTotalPremium money ,
	ChangedTotalPayment money ,
	ChangedNominee varchar(50),
	ChangedRelation varchar(50),
	ChangedNomineeAddress varchar(250) ,
	ChangedNomineeTelephone varchar(10),
	ChangedNomineeDOB date
)
alter table	Endorsement drop column ChangesMade
alter table	Endorsement add ChangedPremiumPaymentFrequency varchar(10) ,
	ChangedSumAssured money,
	ChangedTotalPremium money ,
	ChangedTotalPayment money ,
	ChangedNominee varchar(50),
	ChangedRelation varchar(50),
	ChangedNomineeAddress varchar(250) ,
	ChangedNomineeTelephone varchar(10),
	ChangedNomineeDOB date

insert into Endorsement(EndorsementId,CustomerId,ProductId,Policyno,ChangesMade,Status,CreatedDate) values(1, 100, 1, 4, '{skjdh}', 'InProgress', '2019-09-09')
update Endorsement set Status='InProgress' where EndorsementId=1
select * from Endorsement

create table AdminLogin
(
	AdminId int Identity not null,
	UserName varchar(25) not null unique,
	Password varchar(25) not null,
	age int not null,
)
drop table AdminLogin