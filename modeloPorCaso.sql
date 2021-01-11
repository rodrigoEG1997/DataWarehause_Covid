create database modeloCasoCovid

use modeloCasoCovid


create table dimPaciente(
idPaciente 		int IDENTITY(1,1),
Sexo			varchar(10)
primary key (idPaciente)
)

select * from AnaliticaCovid.dbo.Covid_Mexico

insert into dimPaciente 
select Sexo 
from AnaliticaCovid.dbo.Covid_Mexico

insert into dimPaciente
select
case
		when SEX='male' then 'F'
		when SEX='female' then 'M'
		else NULL
	end as Sexo
from AnaliticaCovid.dbo.Covid_CoreaSur 

select count(*) from dimPaciente dp 

drop table dimUbicacion 

create table dimUbicacion(
idUbicacion	int IDENTITY(1,1),
Pais		varchar(80),
Estado		varchar(80),
Ciudad		varchar(80),
primary key (idUbicacion)
)


insert into dimPais 
select DISTINCT location, max(population), max(population_density)
from AnaliticaCovid.dbo.Covid_International_Data_Info
group by location

insert into dimUbicacion
select DISTINCT 
'South Korea' as Pais, province, city
from AnaliticaCovid.dbo.Covid_CoreaSur 

select * from dimUbicacion du 
Where pais = 'South Korea'

create table dimEdad(
idEdad		int,
Descripcion	varchar(20),
Grupo		varchar(15)
primary key (idEdad)
)

select * from dimEdad

INSERT INTO DimEdad VALUES(0,'Bebe','Alto Riesgo')
INSERT INTO DimEdad VALUES(1,'Bebe','Alto Riesgo')
INSERT INTO DimEdad VALUES(2,'Infante','Medio Riesgo')
INSERT INTO DimEdad VALUES(3,'Infante','Medio Riesgo')
INSERT INTO DimEdad VALUES(4,'Infante','Medio Riesgo')
INSERT INTO DimEdad VALUES(5,'Infante','Medio Riesgo')
INSERT INTO DimEdad VALUES(6,'Niño/a','Medio Riesgo')
INSERT INTO DimEdad VALUES(7,'Niño/a','Medio Riesgo')
INSERT INTO DimEdad VALUES(8,'Niño/a','Medio Riesgo')
INSERT INTO DimEdad VALUES(9,'Niño/a','Medio Riesgo')
INSERT INTO DimEdad VALUES(10,'Niño/a','Medio Riesgo')
INSERT INTO DimEdad VALUES(11,'Niño/a','Medio Riesgo')
INSERT INTO DimEdad VALUES(12,'Adolescente','Medio Riesgo')
INSERT INTO DimEdad VALUES(13,'Adolescente','Medio Riesgo')
INSERT INTO DimEdad VALUES(14,'Adolescente','Medio Riesgo')
INSERT INTO DimEdad VALUES(15,'Adolescente','Medio Riesgo')
INSERT INTO DimEdad VALUES(16,'Adolescente','Medio Riesgo')
INSERT INTO DimEdad VALUES(17,'Adolescente','Medio Riesgo')
INSERT INTO DimEdad VALUES(18,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(19,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(20,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(21,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(22,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(23,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(24,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(25,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(26,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(27,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(28,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(29,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(30,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(31,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(32,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(33,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(34,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(35,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(36,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(37,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(38,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(39,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(40,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(41,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(42,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(43,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(44,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(45,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(46,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(47,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(48,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(49,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(50,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(51,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(52,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(53,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(54,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(55,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(56,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(57,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(58,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(59,'Adult','Medio Riesgo')
INSERT INTO DimEdad VALUES(60,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(61,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(62,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(63,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(64,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(65,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(66,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(67,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(68,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(69,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(70,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(71,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(72,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(73,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(74,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(75,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(76,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(77,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(78,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(79,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(80,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(81,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(82,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(83,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(84,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(85,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(86,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(87,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(88,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(89,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(90,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(91,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(92,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(93,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(94,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(95,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(96,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(97,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(98,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(99,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(100,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(101,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(102,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(103,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(104,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(105,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(106,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(107,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(108,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(109,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(110,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(111,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(112,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(113,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(114,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(115,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(116,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(117,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(118,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(119,'Adulto Mayor','Alto Riesgo')
INSERT INTO DimEdad VALUES(120,'Adulto Mayor','Alto Riesgo')


create table DimUnidadMedica(
	SectorId int,
	Sector varchar(max),
	primary key (SectorId)
)

insert into DimUnidadMedica
select 
	CLAVE,
	DESCRIPCION
	from AnaliticaCovid.dbo.sectorMexico 
	where Clave IS NOT NULL

select * from DimUnidadMedica 

drop table DimCondicionSalud

create table DimCondicionSalud(
	CondicionId int IDENTITY(1,1),
	TipoPaciente varchar(max),
	Diabetes int,
	EPOC int,
	Asma int,
	Hipertension int,
	Inmunodeficiente int,
	Obesidad int,
	Tabaquismo int,
	RenalCronica int,
	Emabarazo int,
	Cardiovascular int,
	primary key (CondicionId)
)

select count(*) from DimCondicionSalud dcs 

drop table DimCondicionSalud

Insert into DimCondicionSalud
select
	case
		when TIPO_PACIENTE=1 then 'Ambulatorio'
		when TIPO_PACIENTE=2 then 'Hospitalizado'
		when TIPO_PACIENTE=99 then 'No Especificado'
		else NULL
	end as 'Tipo Paciente',
	case
		when DIABETES=1 then 1
		when DIABETES=2 then 0
		else NULL
	end as 'Diabetes',
	case
		when EPOC=1 then 1
		when EPOC=2 then 0
		else NULL
	end as 'EPOC',
	case 
		when ASMA=1 then 1
		when ASMA=2 then 0
		else NULL
	end as 'ASMA',
	case 
		when HIPERTENSION=1 then 1
		when HIPERTENSION=2 then 0
		else NULL
	end as 'HIPERTENSION',
	--NO SEGURO INMUNODEFICIENTE
	case
		when INMUSUPR=1 then 1
		when INMUSUPR=2 then 0
		else NULL
	end as 'INMUNODEFICIENTE',
	case
		when OBESIDAD=1 then 1
		when OBESIDAD=2 then 0
		else NULL
	end as 'OBESIDAD',
	case
		when TABAQUISMO=1 then 1
		when TABAQUISMO=2 then 0
		else NULL
	end as 'TABAQUISMO',
	case
		when RENAL_CRONICA=1 then 1
		when RENAL_CRONICA=2 then 0
		else NULL
	end as 'RENAL CRONICA',
	case
		when EMBARAZO=1 then 1
		when EMBARAZO=2 then 0
		else NULL
	end as 'EMBARAZO',
	case
		when CARDIOVASCULAR=1 then 1
		when CARDIOVASCULAR=2 then 0
		else NULL
	end as 'CARDIOVASCULAR'

	
	from AnaliticaCovid.dbo.Covid_Mexico cm 


select * from DimCondicionSalud 
select count(*) from DimCondicionSalud dcs 

drop table factCovidMexico 

create table factCovidMexico (
idFactCovid int identity(1,1),
Fecha	date,
idPaciente 	int, /* Comparte llave con condicion Salud */
idEdad int,
idUbicacion int,
idUnidadMedica int,
numCaso int,
casoPositivo int,
casoNegativo int,
defuncion int,
primary key (idFactCovid),
foreign key (idPaciente ) references dimPaciente(idPaciente),
foreign key (idEdad) references dimEdad(idEdad),
foreign key (idUbicacion) references dimUbicacion(idUbicacion),
foreign key (idUnidadMedica) references DimUnidadMedica(sectorid)
)

insert into factCovidMexico
select DISTINCT cm.FECHA_INGRESO, cm.casoid, cm.EDAD, du.idUbicacion , cm.SECTOR, 1, 
case 
		when RESULTADO=1 then 1
		else 0
	end as 'Positivo',
	case
		when RESULTADO=2 then 1
		else 0
	end as 'Negativo',
case
		When FECHA_DEF != '9999-99-99' and RESULTADO=1 then 1
		else 0
end
from AnaliticaCovid.dbo.Covid_Mexico as cm 
inner join dimUbicacion as du on cm.MUNICIPIO = du.Ciudad and cm.ESTADO = du.Estado 
order by cm.casoid

select count(*) from factCovidMexico
where casoPositivo = 1

select * from factCovidMexico
select count(*) from factCovidMexico


select * from AnaliticaCovid.dbo.Covid_CoreaSur ccs 

drop table factCovidKorea 

create table factCovidKorea (
idFactCovid int identity(1,1),
Fecha	date,
idPaciente 	int, /* Comparte llave con condicion Salud */
idEdad int,
idUbicacion int,
idUnidadMedica int,
numCaso int,
casoPositivo int,
casoNegativo int,
defuncion int,
primary key (idFactCovid),
foreign key (idPaciente ) references dimPaciente(idPaciente),
foreign key (idEdad) references dimEdad(idEdad),
foreign key (idUbicacion) references dimUbicacion(idUbicacion),
foreign key (idUnidadMedica) references DimUnidadMedica(sectorid)
)

insert into factCovidKorea 
select ccs.confirmed_date as 'Fecha' , ccs.CasoID + 603422 as 'idPaciente',
case
	When ccs.birth_year = 0 or ccs.birth_year = 11997 then NULL
	else 2020 - ccs.birth_year
end as 'Edad', 
du.idUbicacion as 'Ubicacion', NULL as 'UnidadMedica', 1 as 'Num', 1 as 'Positivo,', 0 as 'Negativo',
case 
	When ccs.deceased_date = '' then 0
	else 1
end as 'Defuncion'
from AnaliticaCovid.dbo.Covid_CoreaSur ccs 
inner join dimUbicacion as du on ccs.province = du.Estado  and ccs.city = du.Ciudad

select count(*) from factCovidMexico fcm 

select count(*) from factCovidKorea 

select * from factCovidKorea
select count(*) from factCovidKorea 
where defuncion = 1

drop table factCovid 

create table factCovid(
idFactCovid int identity(1,1),
Fecha	date,
idPaciente 	int, /* Comparte llave con condicion Salud */
idEdad int,
idUbicacion int,
idUnidadMedica int,
numCaso int,
casoPositivo int,
casoNegativo int,
defuncion int,
primary key (idFactCovid),
foreign key (idPaciente ) references dimPaciente(idPaciente),
foreign key (idEdad) references dimEdad(idEdad),
foreign key (idUbicacion) references dimUbicacion(idUbicacion),
foreign key (idUnidadMedica) references DimUnidadMedica(sectorid)
)

insert into factCovid
select fecha, idPaciente, idEdad, idUbicacion, idUnidadMedica, numCaso, casoPositivo, casoNegativo, defuncion from factCovidMexico 
union
select fecha, idPaciente, idEdad, idUbicacion, idUnidadMedica, numCaso, casoPositivo, casoNegativo, defuncion from factCovidKorea 
order by idPaciente



select count(*) from factCovid 
select * from factCovid 

drop table dimPais 


select * from dimPais
Where nombre = 'Mexico' or nombre = 'South Korea'
select * from factCovidEconomia

select * into dimPais from modeloDiarioCovidEconomia.dbo.dimPais 

select * into factCovidEconomia from modeloDiarioCovidEconomia.dbo.FactCovidEco fce 

select count(*) from (
select * from dimUbicacion du ) as prueba


select * from factCovid fc 
join dimPaciente on dimPaciente.idPaciente = fc.idPaciente 
join dimUbicacion on dimUbicacion.idUbicacion  = fc.idUbicacion 
join dimEdad on dimEdad.idEdad = fc.idEdad 
left join DimCondicionSalud on DimCondicionSalud.CondicionId = fc.idPaciente 
left join DimUnidadMedica on DimUnidadMedica.SectorId = fc.idUnidadMedica


select count(*) from factCovid fc 
join dimPaciente on dimPaciente.idPaciente = fc.idPaciente 
join dimUbicacion on dimUbicacion.idUbicacion  = fc.idUbicacion 
left join dimEdad on dimEdad.idEdad = fc.idEdad 
left join DimCondicionSalud on DimCondicionSalud.CondicionId = fc.idPaciente 
left join DimUnidadMedica on DimUnidadMedica.SectorId = fc.idUnidadMedica

select * from factCovid fc 

select count(*) from dimUbicacion du 
