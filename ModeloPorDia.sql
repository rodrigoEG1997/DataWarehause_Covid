create database modeloDiarioCovidEconomia
use modeloDiarioCovidEconomia


--------------------------------------------------------------------
--Crear dimancion Pais

create table dimPais(
idPais	int IDENTITY(1,1),
Nombre	varchar(50),
Poblacion	float,
DencidadPoblacion	float,
primary key (idPais)
)

insert into dimPais 
select DISTINCT location, max(population), max(population_density)
from AnaliticaCovid.dbo.Covid_International_Data_Info
group by location 

select * from dimPais dp 
where nombre = 'Mexico' or nombre = 'South Korea'

delete from dimPais where nombre = 'Mexico' and Poblacion < 5

select * from dimPais
where nombre = 'Mexico'


UPDATE dimPais 
SET Poblacion = 128932753
WHERE Nombre = 'Mexico'

select * 
--------------------------------------------------------------------
--Economia Mexico

create table FactDiaCovid(
idFactDiaCovid	int IDENTITY(1,1),
Fecha	date,
Pais	varchar(50),
CasosTotales	int,
CasosNuevos		int,
DefuncionesTotales	int,
DefuncionesNuevas	int,
CierreDolar			float,
CierrePetroleo		float,
Empresa1			float,
Empresa2			float,
Empresa3			float,
Empresa4			float,
Empresa5			float,
primary key (idFactDiaCovid),
)

insert into FactDiaCovid															--CierreDolar, CierrePetroleo, AmericaM, AccionCEMEX, AccionFEMSA, Banorte, GrupoMexico
select dateCase, location, total_cases, new_cases, total_deaths, new_deaths, d.cierre as 'Dolar', p.precio as 'Petroleo',ac.americaM, ac.cemex, ac.femsa, ac.banorte, ac.grupoMexico --, ac.cemex, ac.americaM, ac.banorte, ac.femsa, ac.grupoMexico , p.precio as 'Petroleo', d.cierre as 'Dolar'
from AnaliticaCovid.dbo.Covid_International_Data_Info as covid
left join AnaliticaCovid.dbo.AccionesCierre as ac on covid.dateCase = ac.fecha and covid.location = 'Mexico'
left join AnaliticaCovid.dbo.PrecioDolar as d on covid.dateCase = d.fecha and covid.location = 'Mexico'
left join AnaliticaCovid.dbo.PrecioPetroleo as p on covid.dateCase = p.fecha and covid.location = 'Mexico'
order by covid.dateCase 


select count(*) from FactDiaCovid
where pais = 'Mexico'

--------------------------------------------------------------------
--Economia Korea


create table FactDiaCovidKorea(
idFactDiaCovid	int IDENTITY(1,1),
Fecha	date,
Pais	varchar(50),
CasosTotales	int,
CasosNuevos		int,
DefuncionesTotales	int,
DefuncionesNuevas	int,
CierreDolar			float,
CierrePetroleo		float,
Empresa1			int,
Empresa2			int,
Empresa3			int,
Empresa4			int,
Empresa5			int,
primary key (idFactDiaCovid),
)

insert into FactDiaCovidKorea
Select covid.dateCase, covid.location, covid.total_cases, covid.new_cases, covid.total_deaths, covid.new_deaths, 
pdc.Precio as 'Dolar', ppc.Precio as 'Petroleo', ac.DREAMTECH, ac.Duckyang, ac.Pharmicell, ac.Paik_Kwang_Industrial, ac.Sunny_Electronics_Corp 
from AnaliticaCovid.dbo.Covid_International_Data_Info as covid
left join AnaliticaCovid.dbo.AccionesCorea as ac on covid.dateCase = ac.Fecha and covid.location = 'South Korea'
left join AnaliticaCovid.dbo.PrecioDolarCorea as pdc on covid.dateCase = pdc.Fecha and covid.location = 'South Korea'
left join AnaliticaCovid.dbo.PrecioPetroleoCorea as ppc on covid.dateCase = ppc.Fecha and covid.location = 'South Korea'
order by covid.dateCase 

SELECT count(*) FROM FactDiaCovidKorea
WHERE Pais = 'South Korea'

--------------------------------------------------------------------
--Juntar  Petroleo y dolar de Mexico y Korea en mismas tablas


create table unionDolar(
fecha date,
dolar float,
pais varchar(30)
)

insert into unionDolar 
select fecha, cierre, 'Mexico' as 'Pais' from AnaliticaCovid.dbo.PrecioDolar pd 
union
select fecha, precio, 'South Korea' as 'Pais' from AnaliticaCovid.dbo.PrecioDolarCorea pdc 
order by 'Pais'

select * from unionDolar 


create table unionPetroleo(
fecha date,
petroleo float,
pais varchar(30)
)

insert into unionPetroleo 
select fecha, precio, 'Mexico' as 'Pais' from AnaliticaCovid.dbo.PrecioPetroleo pp 
union
select fecha, precio, 'South Korea' as 'Pais' from AnaliticaCovid.dbo.PrecioPetroleoCorea ppc 
order by 'Pais'

--------------------------------------------------------------------
--Juntar Economia Mexico y korea

drop table FactCovidEco 

create table FactCovidEco(
idFactDiaCovid	int IDENTITY(1,1),
Fecha	date,
PaisID	int,
CasosTotales	int,
CasosNuevos		int,
DefuncionesTotales	int,
DefuncionesNuevas	int,
CierreDolar			float,
CierrePetroleo		float,
AccionAmerica_Movil	float,
AccionCEMEX			float,
AccionFEMSA			float,
AccionBanorte			float,
AccionGrupo_Mexico		float,
AccionDREAMTECH float,
AccionDuckyang float,
AccionPharmicell float,
AccionPaik_Kwang_Industrial float,
AccionSunny_Electronics_Corp float,
primary key (idFactDiaCovid),
foreign key (PaisID) references dimPais(idPais)
)


insert into FactCovidEco	
select dateCase, dp.idPais , total_cases, new_cases, total_deaths, new_deaths,
ud.dolar as 'Dolar', up.petroleo as 'Petroleo',
acm.americaM, acm.cemex, acm.femsa, acm.banorte, acm.grupoMexico,
acc.DREAMTECH, acc.Duckyang, acc.Pharmicell, acc.Paik_Kwang_Industrial, acc.Sunny_Electronics_Corp
from AnaliticaCovid.dbo.Covid_International_Data_Info as covid
left join AnaliticaCovid.dbo.AccionesCierre as acm on covid.dateCase = acm.fecha and covid.location = 'Mexico' --Acciones Mexico
left join unionDolar as ud on covid.dateCase = ud.fecha and covid.location = ud.pais --Dolar
left join unionPetroleo  as up on covid.dateCase = up.fecha and covid.location  = up.pais --Petroleo
left join AnaliticaCovid.dbo.AccionesCorea as acc on covid.dateCase = acc.Fecha and covid.location = 'South Korea' --Acciones Korea
join dimPais as dp on dp.Nombre = covid.location 
order by covid.dateCase, dp.idPais 

select * from FactCovidEco 

select * 
from FactCovidEco fce 
join dimPais on dimPais.idPais = fce.PaisID 


