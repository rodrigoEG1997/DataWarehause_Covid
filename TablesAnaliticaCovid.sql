create database AnaliticaCovid

use AnaliticaCovid

create table COVID19Worldwide(

dateRep	date,
day	int,
month int,
year int,
cases int,
deaths int,
countriesAndTerritories	 varchar(60),
geoId	varchar(10),
countryterritoryCode varchar (10),	
popData2019	 varchar(20),
continentExp varchar(60)
)

select * from COVID19Worldwide
select count(*) from COVID19Worldwide

drop table Covid_Mexico 

create table Covid_Mexico(

FECHA_ACTUALIZACION date,
ID_REGISTRO	varchar(20),
ORIGEN	int,
SECTOR	int,
ENTIDAD_UM	int,
SEXO	varchar(10),
ENTIDAD_NAC	    int,
ESTADO	    varchar(80),
MUNICIPIO	varchar(80),
TIPO_PACIENTE	int,
FECHA_INGRESO	date,
FECHA_SINTOMAS	date,
FECHA_DEF	varchar(30),
INTUBADO	int,
NEUMONIA	int,
EDAD	int,
NACIONALIDAD	int,
EMBARAZO	int,
HABLA_LENGUA_INDIG	int,
DIABETES	int,
EPOC	int,
ASMA	int,
INMUSUPR	int,
HIPERTENSION	int,
OTRA_COM	int,
CARDIOVASCULAR	int,
OBESIDAD	int,
RENAL_CRONICA	int,
TABAQUISMO	int,
OTRO_CASO	int,
RESULTADO	int,
MIGRANTE	int,
PAIS_NACIONALIDAD	varchar(30),
PAIS_ORIGEN	    varchar(30),
UCI     int,
RANGO_EDAD varchar(30)
)

Alter table AnaliticaCovid.dbo.Covid_Mexico 
add CasoID int identity


select * from Covid_Mexico
select count(*) from Covid_Mexico

drop table Covid_International_Data_Info

create table Covid_International_Data_Info(

iso_code	varchar(50),
continent	varchar(50),
location	varchar(50),
dateCase	date,
total_cases	    int,
new_cases	    int,
total_deaths	int,
new_deaths	    int,
total_cases_per_million	varchar(50),
new_cases_per_million	varchar(50),
total_deaths_per_million	varchar(50),
new_deaths_per_million	varchar(50),
total_tests	    varchar(50),
new_tests	    varchar(50),
total_tests_per_thousand	varchar(50),
new_tests_per_thousand	varchar(50),
new_tests_smoothed	varchar(50),
new_tests_smoothed_per_thousand	varchar(50),
tests_units	varchar(50),
stringency_index	varchar(50),
population	varchar(50),
population_density	varchar(50),
median_age	varchar(50),
aged_65_older	varchar(50),
aged_70_older	varchar(50),
gdp_per_capita	varchar(50),
extreme_poverty varchar(50),
cvd_death_rate	varchar(50),
diabetes_prevalence	 varchar(50),
female_smokers	varchar(50),
male_smokers	varchar(50),
handwashing_facilities	varchar(50),
hospital_beds_per_thousand	varchar(50),
life_expectancy     varchar(50)

)

create table Covid_International_Data_Info(

iso_code	varchar(50),
continent	varchar(50),
location	varchar(50),
dateCase	date,
total_cases	    int,
new_cases	    int,
total_deaths	int,
new_deaths	    int,
total_cases_per_million	float,
new_cases_per_million	float,
total_deaths_per_million	float,
new_deaths_per_million	float,
total_tests	    int,
new_tests	    int,
total_tests_per_thousand	float,
new_tests_per_thousand	float,
new_tests_smoothed	int,
new_tests_smoothed_per_thousand	float,
tests_units	varchar(50),
stringency_index	int,
population	float,
population_density	float,
median_age	float,
aged_65_older	float,
aged_70_older	varchar(50),
gdp_per_capita	float,
extreme_poverty	varchar(50),
cvd_death_rate	varchar(50),
diabetes_prevalence	 varchar(50),
female_smokers	varchar(50),
male_smokers	varchar(50),
handwashing_facilities	varchar(50),
hospital_beds_per_thousand	varchar(50),
life_expectancy     varchar(50)

)

create table Covid_International_Data_Info(

iso_code	varchar(50),
continent	varchar(50),
location	varchar(50),
dateCase	date,
total_cases	    int,
new_cases	    int,
total_deaths	int,
new_deaths	    int,
total_cases_per_million	float,
new_cases_per_million	float,
total_deaths_per_million	float,
new_deaths_per_million	float,
total_tests	    int,
new_tests	    int,
total_tests_per_thousand	float,
new_tests_per_thousand	float,
new_tests_smoothed	int,
new_tests_smoothed_per_thousand	float,
tests_units	varchar(50),
stringency_index	int,
population	float,
population_density	float,
median_age	float,
aged_65_older	float,
aged_70_older	varchar(50),
gdp_per_capita	float,
extreme_poverty	float,
cvd_death_rate	float,
diabetes_prevalence	 float,
female_smokers	float,
male_smokers	float,
handwashing_facilities	float,
hospital_beds_per_thousand	float,
life_expectancy     float

)

select * from Covid_International_Data_Info
select count(*) from Covid_International_Data_Info

create table Covid_International_Data(

dateCase        date,	
location	    varchar(30),
new_cases	    int,
new_deaths	    int,
total_cases	    int,
total_deaths    int

)

select * from Covid_International_Data2
select count(*) from Covid_International_Data

create table PrecioDolar(

fecha       date,
cierre      float,
apertura    float,
maximo      float,
minimo      float,
var     	float

)

drop table PrecioDolar

select * from PrecioDolar pd 
select count(*) from PrecioDolar pd 

create table PrecioPetroleo(
fecha	date,
precio	varchar(20),
)

drop table PrecioPetroleo

select * from PrecioPetroleo pp 
select count(*) from PrecioPetroleo pp 

create table AccionesEmpresas(
fecha	date,
apertura	float,
maximo		float,
minimo		float,
cierre		float,
adjCierre	float,
volumen		int,
company		varchar(30),

)

select * from AccionesEmpresas ae 
select count(*) from AccionesEmpresas ae 

create table AccionesCierre (
fecha	date,
americaM	float,
femsa		float,
banorte		float,
grupoMexico	float,
cemex		float
)

select * from AccionesCierre ac 
select count(*) from AccionesCierre ac 


create table Covid_CoreaSur(
patient_id	varchar(60), 
global_num	varchar(60), 
sex	varchar(60), 
birth_year	varchar(60),
age	varchar(60), 
country	varchar(60), 
province varchar(60), 
city varchar(60), 
disease varchar(60), 
infection_case varchar(60), 
infection_order varchar(60), 
infected_by varchar(60), 
contact_number varchar(60), 
symptom_onset_date varchar(60), 
confirmed_date date, 
released_date varchar(60), 
deceased_date varchar(60), 
state varchar(60), 
)

drop table Covid_CoreaSur

select * from Covid_CoreaSur
select count(*) from Covid_CoreaSur

create table Covid_Alemania(
state	varchar(50),
county	varchar(50),
age_group	varchar(50),
gender	varchar(50),
dateCase	date,
cases	int,
deaths	int,
recovered	int

)

select * from Covid_Alemania

create table sectorMexico(
clave int,
descripcion varchar(40)
)

select fecha, minimo from PrecioDolar pd 
where fecha ='2020-06-30'