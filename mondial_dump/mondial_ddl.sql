-- public.citylocalname definition

-- Drop table

-- DROP TABLE public.citylocalname;

CREATE TABLE public.citylocalname (
	city varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	localname varchar(300) NULL,
	CONSTRAINT citylocalnamekey PRIMARY KEY (country, province, city)
);


-- public.cityothername definition

-- Drop table

-- DROP TABLE public.cityothername;

CREATE TABLE public.cityothername (
	city varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	othername varchar(50) NOT NULL,
	CONSTRAINT cityothernamekey PRIMARY KEY (country, province, city, othername)
);


-- public.continent definition

-- Drop table

-- DROP TABLE public.continent;

CREATE TABLE public.continent (
	name varchar(20) NOT NULL,
	area numeric(10) NULL,
	CONSTRAINT continentkey PRIMARY KEY (name)
);


-- public.countrylocalname definition

-- Drop table

-- DROP TABLE public.countrylocalname;

CREATE TABLE public.countrylocalname (
	country varchar(4) NOT NULL,
	localname varchar(300) NULL,
	CONSTRAINT countrylocalnamekey PRIMARY KEY (country)
);


-- public.countryothername definition

-- Drop table

-- DROP TABLE public.countryothername;

CREATE TABLE public.countryothername (
	country varchar(4) NOT NULL,
	othername varchar(50) NOT NULL,
	CONSTRAINT countryothernamekey PRIMARY KEY (country, othername)
);


-- public.desert definition

-- Drop table

-- DROP TABLE public.desert;

CREATE TABLE public.desert (
	name varchar(50) NOT NULL,
	area numeric NULL,
	coordinates geocoord NULL,
	CONSTRAINT descoord CHECK ((((coordinates).latitude >= ('-90'::integer)::numeric) AND ((coordinates).latitude <= (90)::numeric) AND ((coordinates).longitude > ('-180'::integer)::numeric) AND ((coordinates).longitude <= (180)::numeric))),
	CONSTRAINT desertkey PRIMARY KEY (name)
);


-- public.island definition

-- Drop table

-- DROP TABLE public.island;

CREATE TABLE public.island (
	name varchar(50) NOT NULL,
	islands varchar(50) NULL,
	area numeric NULL,
	elevation numeric NULL,
	"type" varchar(12) NULL,
	coordinates geocoord NULL,
	CONSTRAINT islandar CHECK ((area >= (0)::numeric)),
	CONSTRAINT islandcoord CHECK ((((coordinates).latitude >= ('-90'::integer)::numeric) AND ((coordinates).latitude <= (90)::numeric) AND ((coordinates).longitude > ('-180'::integer)::numeric) AND ((coordinates).longitude <= (180)::numeric))),
	CONSTRAINT islandkey PRIMARY KEY (name)
);


-- public.mountain definition

-- Drop table

-- DROP TABLE public.mountain;

CREATE TABLE public.mountain (
	name varchar(50) NOT NULL,
	mountains varchar(50) NULL,
	elevation numeric NULL,
	"type" varchar(10) NULL,
	coordinates geocoord NULL,
	CONSTRAINT mountaincoord CHECK ((((coordinates).latitude >= ('-90'::integer)::numeric) AND ((coordinates).latitude <= (90)::numeric) AND ((coordinates).longitude > ('-180'::integer)::numeric) AND ((coordinates).longitude <= (180)::numeric))),
	CONSTRAINT mountainkey PRIMARY KEY (name)
);


-- public.sea definition

-- Drop table

-- DROP TABLE public.sea;

CREATE TABLE public.sea (
	name varchar(50) NOT NULL,
	area numeric NULL,
	"depth" numeric NULL,
	CONSTRAINT seaar CHECK ((area >= (0)::numeric)),
	CONSTRAINT seadepth CHECK ((depth >= (0)::numeric)),
	CONSTRAINT seakey PRIMARY KEY (name)
);


-- public.islandin definition

-- Drop table

-- DROP TABLE public.islandin;

CREATE TABLE public.islandin (
	island varchar(50) NULL,
	sea varchar(50) NULL,
	lake varchar(50) NULL,
	river varchar(50) NULL,
	CONSTRAINT fk_insea FOREIGN KEY (sea) REFERENCES public.sea(name) DEFERRABLE INITIALLY DEFERRED,
	CONSTRAINT fk_islandin FOREIGN KEY (island) REFERENCES public.island(name) DEFERRABLE INITIALLY DEFERRED
);


-- public.mergeswith definition

-- Drop table

-- DROP TABLE public.mergeswith;

CREATE TABLE public.mergeswith (
	sea1 varchar(50) NOT NULL,
	sea2 varchar(50) NOT NULL,
	CONSTRAINT mergeswithkey PRIMARY KEY (sea1, sea2),
	CONSTRAINT fk_sea1 FOREIGN KEY (sea1) REFERENCES public.sea(name) DEFERRABLE INITIALLY DEFERRED,
	CONSTRAINT fk_sea2 FOREIGN KEY (sea2) REFERENCES public.sea(name) DEFERRABLE INITIALLY DEFERRED
);


-- public.mountainonisland definition

-- Drop table

-- DROP TABLE public.mountainonisland;

CREATE TABLE public.mountainonisland (
	mountain varchar(50) NOT NULL,
	island varchar(50) NOT NULL,
	CONSTRAINT mountainislkey PRIMARY KEY (mountain, island),
	CONSTRAINT fk_mtimountain FOREIGN KEY (mountain) REFERENCES public.mountain(name) DEFERRABLE INITIALLY DEFERRED
);


-- public.airport definition

-- Drop table

-- DROP TABLE public.airport;

CREATE TABLE public.airport (
	iatacode varchar(3) NOT NULL,
	name varchar(100) NULL,
	country varchar(4) NULL,
	city varchar(50) NULL,
	province varchar(50) NULL,
	island varchar(50) NULL,
	latitude numeric NULL,
	longitude numeric NULL,
	elevation numeric NULL,
	gmtoffset numeric NULL,
	CONSTRAINT airplat CHECK (((latitude >= ('-90'::integer)::numeric) AND (latitude <= (90)::numeric))),
	CONSTRAINT airplon CHECK (((longitude >= ('-180'::integer)::numeric) AND (longitude <= (180)::numeric))),
	CONSTRAINT airport_pkey PRIMARY KEY (iatacode)
);


-- public.borders definition

-- Drop table

-- DROP TABLE public.borders;

CREATE TABLE public.borders (
	country1 varchar(4) NOT NULL,
	country2 varchar(4) NOT NULL,
	length numeric NULL,
	CONSTRAINT borderkey PRIMARY KEY (country1, country2),
	CONSTRAINT borders_length_check CHECK ((length > (0)::numeric))
);


-- public.city definition

-- Drop table

-- DROP TABLE public.city;

CREATE TABLE public.city (
	name varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	population numeric NULL,
	latitude numeric NULL,
	longitude numeric NULL,
	elevation numeric NULL,
	CONSTRAINT citykey PRIMARY KEY (name, country, province),
	CONSTRAINT citylat CHECK (((latitude >= ('-90'::integer)::numeric) AND (latitude <= (90)::numeric))),
	CONSTRAINT citylon CHECK (((longitude >= ('-180'::integer)::numeric) AND (longitude <= (180)::numeric))),
	CONSTRAINT citypop CHECK ((population >= (0)::numeric))
);


-- public.citypops definition

-- Drop table

-- DROP TABLE public.citypops;

CREATE TABLE public.citypops (
	city varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	"year" numeric NOT NULL,
	population numeric NULL,
	CONSTRAINT citypopkey PRIMARY KEY (country, province, city, year),
	CONSTRAINT citypopspop CHECK ((population >= (0)::numeric)),
	CONSTRAINT citypopsyear CHECK ((year >= (0)::numeric))
);


-- public.country definition

-- Drop table

-- DROP TABLE public.country;

CREATE TABLE public.country (
	name varchar(50) NOT NULL,
	code varchar(4) NOT NULL,
	capital varchar(50) NULL,
	province varchar(50) NULL,
	area numeric NULL,
	population numeric NULL,
	CONSTRAINT country_name_key UNIQUE (name),
	CONSTRAINT countryarea CHECK ((area >= (0)::numeric)),
	CONSTRAINT countrykey PRIMARY KEY (code),
	CONSTRAINT countrypop CHECK ((population >= (0)::numeric))
);


-- public.countrypops definition

-- Drop table

-- DROP TABLE public.countrypops;

CREATE TABLE public.countrypops (
	country varchar(4) NOT NULL,
	"year" numeric NOT NULL,
	population numeric NULL,
	CONSTRAINT countrypopskey PRIMARY KEY (country, year),
	CONSTRAINT countrypopspop CHECK ((population >= (0)::numeric)),
	CONSTRAINT countrypopsyear CHECK ((year >= (0)::numeric))
);


-- public.economy definition

-- Drop table

-- DROP TABLE public.economy;

CREATE TABLE public.economy (
	country varchar(4) NOT NULL,
	gdp numeric NULL,
	agriculture numeric NULL,
	service numeric NULL,
	industry numeric NULL,
	inflation numeric NULL,
	unemployment numeric NULL,
	CONSTRAINT economygdp CHECK ((gdp >= (0)::numeric)),
	CONSTRAINT economykey PRIMARY KEY (country)
);


-- public.encompasses definition

-- Drop table

-- DROP TABLE public.encompasses;

CREATE TABLE public.encompasses (
	country varchar(4) NOT NULL,
	continent varchar(20) NOT NULL,
	percentage numeric NULL,
	CONSTRAINT encompasses_percentage_check CHECK (((percentage > (0)::numeric) AND (percentage <= (100)::numeric))),
	CONSTRAINT encompasseskey PRIMARY KEY (country, continent)
);


-- public.ethnicgroup definition

-- Drop table

-- DROP TABLE public.ethnicgroup;

CREATE TABLE public.ethnicgroup (
	country varchar(4) NOT NULL,
	name varchar(50) NOT NULL,
	percentage numeric NULL,
	CONSTRAINT ethnickey PRIMARY KEY (name, country),
	CONSTRAINT ethnicpercent CHECK (((percentage > (0)::numeric) AND (percentage <= (100)::numeric)))
);


-- public.geo_desert definition

-- Drop table

-- DROP TABLE public.geo_desert;

CREATE TABLE public.geo_desert (
	desert varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	CONSTRAINT gdesertkey PRIMARY KEY (province, country, desert)
);


-- public.geo_estuary definition

-- Drop table

-- DROP TABLE public.geo_estuary;

CREATE TABLE public.geo_estuary (
	river varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	CONSTRAINT gestuarykey PRIMARY KEY (province, country, river)
);


-- public.geo_island definition

-- Drop table

-- DROP TABLE public.geo_island;

CREATE TABLE public.geo_island (
	island varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	CONSTRAINT gislandkey PRIMARY KEY (province, country, island)
);


-- public.geo_lake definition

-- Drop table

-- DROP TABLE public.geo_lake;

CREATE TABLE public.geo_lake (
	lake varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	CONSTRAINT glakekey PRIMARY KEY (province, country, lake)
);


-- public.geo_mountain definition

-- Drop table

-- DROP TABLE public.geo_mountain;

CREATE TABLE public.geo_mountain (
	mountain varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	CONSTRAINT gmountainkey PRIMARY KEY (province, country, mountain)
);


-- public.geo_river definition

-- Drop table

-- DROP TABLE public.geo_river;

CREATE TABLE public.geo_river (
	river varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	CONSTRAINT griverkey PRIMARY KEY (province, country, river)
);


-- public.geo_sea definition

-- Drop table

-- DROP TABLE public.geo_sea;

CREATE TABLE public.geo_sea (
	sea varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	CONSTRAINT gseakey PRIMARY KEY (province, country, sea)
);


-- public.geo_source definition

-- Drop table

-- DROP TABLE public.geo_source;

CREATE TABLE public.geo_source (
	river varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	province varchar(50) NOT NULL,
	CONSTRAINT gsourcekey PRIMARY KEY (province, country, river)
);


-- public.ismember definition

-- Drop table

-- DROP TABLE public.ismember;

CREATE TABLE public.ismember (
	country varchar(4) NOT NULL,
	organization varchar(12) NOT NULL,
	"type" varchar(60) NULL DEFAULT 'member'::character varying,
	CONSTRAINT memberkey PRIMARY KEY (country, organization)
);


-- public.lake definition

-- Drop table

-- DROP TABLE public.lake;

CREATE TABLE public.lake (
	name varchar(50) NOT NULL,
	river varchar(50) NULL,
	area numeric NULL,
	elevation numeric NULL,
	"depth" numeric NULL,
	height numeric NULL,
	"type" varchar(12) NULL,
	coordinates geocoord NULL,
	CONSTRAINT damheight CHECK ((height > (0)::numeric)),
	CONSTRAINT lakear CHECK ((area >= (0)::numeric)),
	CONSTRAINT lakecoord CHECK ((((coordinates).latitude >= ('-90'::integer)::numeric) AND ((coordinates).latitude <= (90)::numeric) AND ((coordinates).longitude > ('-180'::integer)::numeric) AND ((coordinates).longitude <= (180)::numeric))),
	CONSTRAINT lakedpth CHECK ((depth >= (0)::numeric)),
	CONSTRAINT lakekey PRIMARY KEY (name)
);


-- public.lakeonisland definition

-- Drop table

-- DROP TABLE public.lakeonisland;

CREATE TABLE public.lakeonisland (
	lake varchar(50) NOT NULL,
	island varchar(50) NOT NULL,
	CONSTRAINT lakeislkey PRIMARY KEY (lake, island)
);


-- public."language" definition

-- Drop table

-- DROP TABLE public."language";

CREATE TABLE public."language" (
	country varchar(4) NOT NULL,
	name varchar(50) NOT NULL,
	percentage numeric NULL,
	CONSTRAINT languagekey PRIMARY KEY (name, country),
	CONSTRAINT languagepercent CHECK (((percentage > (0)::numeric) AND (percentage <= (100)::numeric)))
);


-- public.located definition

-- Drop table

-- DROP TABLE public.located;

CREATE TABLE public.located (
	city varchar(50) NULL,
	province varchar(50) NULL,
	country varchar(4) NULL,
	river varchar(50) NULL,
	lake varchar(50) NULL,
	sea varchar(50) NULL
);


-- public.locatedon definition

-- Drop table

-- DROP TABLE public.locatedon;

CREATE TABLE public.locatedon (
	city varchar(50) NOT NULL,
	province varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	island varchar(50) NOT NULL,
	CONSTRAINT locatedonkey PRIMARY KEY (city, province, country, island)
);


-- public.organization definition

-- Drop table

-- DROP TABLE public.organization;

CREATE TABLE public.organization (
	abbreviation varchar(12) NOT NULL,
	name varchar(100) NOT NULL,
	city varchar(50) NULL,
	country varchar(4) NULL,
	province varchar(50) NULL,
	established date NULL,
	CONSTRAINT orgkey PRIMARY KEY (abbreviation),
	CONSTRAINT orgnameunique UNIQUE (name)
);


-- public.politics definition

-- Drop table

-- DROP TABLE public.politics;

CREATE TABLE public.politics (
	country varchar(4) NOT NULL,
	independence date NULL,
	wasdependent varchar(50) NULL,
	dependent varchar(4) NULL,
	government varchar(120) NULL,
	CONSTRAINT politicskey PRIMARY KEY (country)
);


-- public.population definition

-- Drop table

-- DROP TABLE public.population;

CREATE TABLE public.population (
	country varchar(4) NOT NULL,
	population_growth numeric NULL,
	infant_mortality numeric NULL,
	CONSTRAINT popkey PRIMARY KEY (country)
);


-- public.province definition

-- Drop table

-- DROP TABLE public.province;

CREATE TABLE public.province (
	name varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	population numeric NULL,
	area numeric NULL,
	capital varchar(50) NULL,
	capprov varchar(50) NULL,
	CONSTRAINT prar CHECK ((area >= (0)::numeric)),
	CONSTRAINT prkey PRIMARY KEY (name, country),
	CONSTRAINT prpop CHECK ((population >= (0)::numeric))
);


-- public.provincelocalname definition

-- Drop table

-- DROP TABLE public.provincelocalname;

CREATE TABLE public.provincelocalname (
	province varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	localname varchar(300) NULL,
	CONSTRAINT provlocalnamekey PRIMARY KEY (country, province)
);


-- public.provinceothername definition

-- Drop table

-- DROP TABLE public.provinceothername;

CREATE TABLE public.provinceothername (
	province varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	othername varchar(50) NOT NULL,
	CONSTRAINT provothernamekey PRIMARY KEY (country, province, othername)
);


-- public.provpops definition

-- Drop table

-- DROP TABLE public.provpops;

CREATE TABLE public.provpops (
	province varchar(50) NOT NULL,
	country varchar(4) NOT NULL,
	"year" numeric NOT NULL,
	population numeric NULL,
	CONSTRAINT provpopkey PRIMARY KEY (country, province, year),
	CONSTRAINT provpopspop CHECK ((population >= (0)::numeric)),
	CONSTRAINT provpopsyear CHECK ((year >= (0)::numeric))
);


-- public.religion definition

-- Drop table

-- DROP TABLE public.religion;

CREATE TABLE public.religion (
	country varchar(4) NOT NULL,
	name varchar(50) NOT NULL,
	percentage numeric NULL,
	CONSTRAINT religionkey PRIMARY KEY (name, country),
	CONSTRAINT religionpercent CHECK (((percentage > (0)::numeric) AND (percentage <= (100)::numeric)))
);


-- public.river definition

-- Drop table

-- DROP TABLE public.river;

CREATE TABLE public.river (
	name varchar(50) NOT NULL,
	river varchar(50) NULL,
	lake varchar(50) NULL,
	sea varchar(50) NULL,
	length numeric NULL,
	area numeric NULL,
	"source" geocoord NULL,
	mountains varchar(50) NULL,
	sourceelevation numeric NULL,
	estuary geocoord NULL,
	estuaryelevation numeric NULL,
	CONSTRAINT estcoord CHECK ((((estuary).latitude >= ('-90'::integer)::numeric) AND ((estuary).latitude <= (90)::numeric) AND ((estuary).longitude > ('-180'::integer)::numeric) AND ((estuary).longitude <= (180)::numeric))),
	CONSTRAINT riverarea CHECK ((area >= (0)::numeric)),
	CONSTRAINT riverkey PRIMARY KEY (name),
	CONSTRAINT riverlength CHECK ((length >= (0)::numeric)),
	CONSTRAINT rivflowsinto CHECK ((((river IS NULL) AND (lake IS NULL)) OR ((river IS NULL) AND (sea IS NULL)) OR ((lake IS NULL) AND (sea IS NULL)))),
	CONSTRAINT sourcecoord CHECK ((((source).latitude >= ('-90'::integer)::numeric) AND ((source).latitude <= (90)::numeric) AND ((source).longitude > ('-180'::integer)::numeric) AND ((source).longitude <= (180)::numeric)))
);


-- public.riveronisland definition

-- Drop table

-- DROP TABLE public.riveronisland;

CREATE TABLE public.riveronisland (
	river varchar(50) NOT NULL,
	island varchar(50) NOT NULL,
	CONSTRAINT riverislkey PRIMARY KEY (river, island)
);


-- public.riverthrough definition

-- Drop table

-- DROP TABLE public.riverthrough;

CREATE TABLE public.riverthrough (
	river varchar(50) NOT NULL,
	lake varchar(50) NOT NULL,
	CONSTRAINT rthroughkey PRIMARY KEY (river, lake)
);


-- public.airport foreign keys

ALTER TABLE public.airport ADD CONSTRAINT fk_airportcity FOREIGN KEY (city,country,province) REFERENCES public.city(name,country,province);
ALTER TABLE public.airport ADD CONSTRAINT fk_airportisland FOREIGN KEY (island) REFERENCES public.island(name);


-- public.borders foreign keys

ALTER TABLE public.borders ADD CONSTRAINT fk_border1 FOREIGN KEY (country1) REFERENCES public.country(code);
ALTER TABLE public.borders ADD CONSTRAINT fk_border2 FOREIGN KEY (country2) REFERENCES public.country(code);


-- public.city foreign keys

ALTER TABLE public.city ADD CONSTRAINT fk_cityprovince FOREIGN KEY (country,province) REFERENCES <?>();


-- public.citypops foreign keys

ALTER TABLE public.citypops ADD CONSTRAINT fk_citypops FOREIGN KEY (city,country,province) REFERENCES public.city(name,country,province);


-- public.country foreign keys

ALTER TABLE public.country ADD CONSTRAINT fk_capital FOREIGN KEY (capital,code,province) REFERENCES public.city(name,country,province);


-- public.countrypops foreign keys

ALTER TABLE public.countrypops ADD CONSTRAINT fk_popscountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.economy foreign keys

ALTER TABLE public.economy ADD CONSTRAINT fk_ecoscountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.encompasses foreign keys

ALTER TABLE public.encompasses ADD CONSTRAINT fk_enccontinent FOREIGN KEY (continent) REFERENCES public.continent(name);
ALTER TABLE public.encompasses ADD CONSTRAINT fk_enccountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.ethnicgroup foreign keys

ALTER TABLE public.ethnicgroup ADD CONSTRAINT fk_popcountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.geo_desert foreign keys

ALTER TABLE public.geo_desert ADD CONSTRAINT fk_desert FOREIGN KEY (desert) REFERENCES public.desert(name);
ALTER TABLE public.geo_desert ADD CONSTRAINT fk_desertprovince FOREIGN KEY (country,province) REFERENCES <?>();


-- public.geo_estuary foreign keys

ALTER TABLE public.geo_estuary ADD CONSTRAINT fk_gestprovince FOREIGN KEY (country,province) REFERENCES <?>();
ALTER TABLE public.geo_estuary ADD CONSTRAINT fk_gestriver FOREIGN KEY (river) REFERENCES public.river(name);


-- public.geo_island foreign keys

ALTER TABLE public.geo_island ADD CONSTRAINT fk_geoisland FOREIGN KEY (island) REFERENCES public.island(name);
ALTER TABLE public.geo_island ADD CONSTRAINT fk_islandprovince FOREIGN KEY (country,province) REFERENCES <?>();


-- public.geo_lake foreign keys

ALTER TABLE public.geo_lake ADD CONSTRAINT fk_geolake FOREIGN KEY (lake) REFERENCES public.lake(name);
ALTER TABLE public.geo_lake ADD CONSTRAINT fk_lakeprovince FOREIGN KEY (country,province) REFERENCES <?>();


-- public.geo_mountain foreign keys

ALTER TABLE public.geo_mountain ADD CONSTRAINT fk_geomountain FOREIGN KEY (mountain) REFERENCES public.mountain(name);
ALTER TABLE public.geo_mountain ADD CONSTRAINT fk_mountainprovince FOREIGN KEY (country,province) REFERENCES <?>();


-- public.geo_river foreign keys

ALTER TABLE public.geo_river ADD CONSTRAINT fk_georiver FOREIGN KEY (river) REFERENCES public.river(name);
ALTER TABLE public.geo_river ADD CONSTRAINT fk_griverprovince FOREIGN KEY (country,province) REFERENCES <?>();


-- public.geo_sea foreign keys

ALTER TABLE public.geo_sea ADD CONSTRAINT fk_geosea FOREIGN KEY (sea) REFERENCES public.sea(name);
ALTER TABLE public.geo_sea ADD CONSTRAINT fk_seaprovince FOREIGN KEY (country,province) REFERENCES <?>();


-- public.geo_source foreign keys

ALTER TABLE public.geo_source ADD CONSTRAINT fk_gsrcprovince FOREIGN KEY (country,province) REFERENCES <?>();
ALTER TABLE public.geo_source ADD CONSTRAINT fk_gsrcriver FOREIGN KEY (river) REFERENCES public.river(name);


-- public.ismember foreign keys

ALTER TABLE public.ismember ADD CONSTRAINT fk_country FOREIGN KEY (country) REFERENCES public.country(code);
ALTER TABLE public.ismember ADD CONSTRAINT fk_ismember FOREIGN KEY (organization) REFERENCES public.organization(abbreviation);


-- public.lake foreign keys

ALTER TABLE public.lake ADD CONSTRAINT fk_lakeriver FOREIGN KEY (river) REFERENCES public.river(name);


-- public.lakeonisland foreign keys

ALTER TABLE public.lakeonisland ADD CONSTRAINT fk_islandlake FOREIGN KEY (lake) REFERENCES public.lake(name);
ALTER TABLE public.lakeonisland ADD CONSTRAINT fk_lakeoisland FOREIGN KEY (island) REFERENCES public.island(name);


-- public."language" foreign keys

ALTER TABLE public."language" ADD CONSTRAINT fk_langcountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.located foreign keys

ALTER TABLE public.located ADD CONSTRAINT fk_locatedcity FOREIGN KEY (city,country,province) REFERENCES public.city(name,country,province);
ALTER TABLE public.located ADD CONSTRAINT fk_loclake FOREIGN KEY (lake) REFERENCES public.lake(name);
ALTER TABLE public.located ADD CONSTRAINT fk_locriver FOREIGN KEY (river) REFERENCES public.river(name);
ALTER TABLE public.located ADD CONSTRAINT fk_locsea FOREIGN KEY (sea) REFERENCES public.sea(name);


-- public.locatedon foreign keys

ALTER TABLE public.locatedon ADD CONSTRAINT fk_locatedcityon FOREIGN KEY (city,country,province) REFERENCES public.city(name,country,province);
ALTER TABLE public.locatedon ADD CONSTRAINT fk_onisland FOREIGN KEY (island) REFERENCES public.island(name);


-- public.organization foreign keys

ALTER TABLE public.organization ADD CONSTRAINT fk_capital FOREIGN KEY (city,country,province) REFERENCES public.city(name,country,province);


-- public.politics foreign keys

ALTER TABLE public.politics ADD CONSTRAINT fk_polscountry1 FOREIGN KEY (country) REFERENCES public.country(code);
ALTER TABLE public.politics ADD CONSTRAINT fk_polscountry2 FOREIGN KEY (dependent) REFERENCES public.country(code);


-- public.population foreign keys

ALTER TABLE public.population ADD CONSTRAINT fk_popcountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.province foreign keys

ALTER TABLE public.province ADD CONSTRAINT fk_citycapital FOREIGN KEY (capital,country,capprov) REFERENCES public.city(name,country,province);
ALTER TABLE public.province ADD CONSTRAINT fk_provcountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.provincelocalname foreign keys

ALTER TABLE public.provincelocalname ADD CONSTRAINT fk_provincelocal FOREIGN KEY (province,country) REFERENCES public.province(name,country);


-- public.provinceothername foreign keys

ALTER TABLE public.provinceothername ADD CONSTRAINT fk_provinceother FOREIGN KEY (province,country) REFERENCES public.province(name,country);


-- public.provpops foreign keys

ALTER TABLE public.provpops ADD CONSTRAINT fk_ppopsprovince FOREIGN KEY (country,province) REFERENCES <?>();


-- public.religion foreign keys

ALTER TABLE public.religion ADD CONSTRAINT fk_popcountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.river foreign keys

ALTER TABLE public.river ADD CONSTRAINT fk_riverlake FOREIGN KEY (lake) REFERENCES public.lake(name);
ALTER TABLE public.river ADD CONSTRAINT fk_riverriver FOREIGN KEY (river) REFERENCES public.river(name);
ALTER TABLE public.river ADD CONSTRAINT fk_riversea FOREIGN KEY (sea) REFERENCES public.sea(name);


-- public.riveronisland foreign keys

ALTER TABLE public.riveronisland ADD CONSTRAINT fk_islandriver FOREIGN KEY (river) REFERENCES public.river(name);
ALTER TABLE public.riveronisland ADD CONSTRAINT fk_riveroisland FOREIGN KEY (island) REFERENCES public.island(name);


-- public.riverthrough foreign keys

ALTER TABLE public.riverthrough ADD CONSTRAINT fk_thlake FOREIGN KEY (lake) REFERENCES public.lake(name);
ALTER TABLE public.riverthrough ADD CONSTRAINT fk_thriver FOREIGN KEY (river) REFERENCES public.river(name);
