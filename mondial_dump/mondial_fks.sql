BEGIN;

-- public.airport foreign keys

ALTER TABLE public.airport ADD CONSTRAINT fk_airportcity FOREIGN KEY (city,country,province) REFERENCES public.city("name",country,province);
ALTER TABLE public.airport ADD CONSTRAINT fk_airportisland FOREIGN KEY (island) REFERENCES public.island("name");


-- public.borders foreign keys

ALTER TABLE public.borders ADD CONSTRAINT fk_border1 FOREIGN KEY (country1) REFERENCES public.country(code);
ALTER TABLE public.borders ADD CONSTRAINT fk_border2 FOREIGN KEY (country2) REFERENCES public.country(code);


-- public.city foreign keys

ALTER TABLE public.city ADD CONSTRAINT fk_cityprovince FOREIGN KEY (country,province) REFERENCES public.province(country,name);


-- public.citypops foreign keys

ALTER TABLE public.citypops ADD CONSTRAINT fk_citypops FOREIGN KEY (city,country,province) REFERENCES public.city("name",country,province);


-- public.country foreign keys

ALTER TABLE public.country ADD CONSTRAINT fk_capital FOREIGN KEY (capital,code,province) REFERENCES public.city("name",country,province);


-- public.countrypops foreign keys

ALTER TABLE public.countrypops ADD CONSTRAINT fk_popscountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.economy foreign keys

ALTER TABLE public.economy ADD CONSTRAINT fk_ecoscountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.encompasses foreign keys

ALTER TABLE public.encompasses ADD CONSTRAINT fk_enccontinent FOREIGN KEY (continent) REFERENCES public.continent("name");
ALTER TABLE public.encompasses ADD CONSTRAINT fk_enccountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.ethnicgroup foreign keys

ALTER TABLE public.ethnicgroup ADD CONSTRAINT fk_popcountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.geo_desert foreign keys

ALTER TABLE public.geo_desert ADD CONSTRAINT fk_desert FOREIGN KEY (desert) REFERENCES public.desert("name");
ALTER TABLE public.geo_desert ADD CONSTRAINT fk_desertprovince FOREIGN KEY (country,province) REFERENCES public.province(country,name);


-- public.geo_estuary foreign keys

ALTER TABLE public.geo_estuary ADD CONSTRAINT fk_gestprovince FOREIGN KEY (country,province) REFERENCES public.province(country,name);
ALTER TABLE public.geo_estuary ADD CONSTRAINT fk_gestriver FOREIGN KEY (river) REFERENCES public.river("name");


-- public.geo_island foreign keys

ALTER TABLE public.geo_island ADD CONSTRAINT fk_geoisland FOREIGN KEY (island) REFERENCES public.island("name");
ALTER TABLE public.geo_island ADD CONSTRAINT fk_islandprovince FOREIGN KEY (country,province) REFERENCES public.province(country,name);


-- public.geo_lake foreign keys

ALTER TABLE public.geo_lake ADD CONSTRAINT fk_geolake FOREIGN KEY (lake) REFERENCES public.lake("name");
ALTER TABLE public.geo_lake ADD CONSTRAINT fk_lakeprovince FOREIGN KEY (country,province) REFERENCES public.province(country,name);


-- public.geo_mountain foreign keys

ALTER TABLE public.geo_mountain ADD CONSTRAINT fk_geomountain FOREIGN KEY (mountain) REFERENCES public.mountain("name");
ALTER TABLE public.geo_mountain ADD CONSTRAINT fk_mountainprovince FOREIGN KEY (country,province) REFERENCES public.province(country,name);


-- public.geo_river foreign keys

ALTER TABLE public.geo_river ADD CONSTRAINT fk_georiver FOREIGN KEY (river) REFERENCES public.river("name");
ALTER TABLE public.geo_river ADD CONSTRAINT fk_griverprovince FOREIGN KEY (country,province) REFERENCES public.province(country,name);


-- public.geo_sea foreign keys

ALTER TABLE public.geo_sea ADD CONSTRAINT fk_geosea FOREIGN KEY (sea) REFERENCES public.sea("name");
ALTER TABLE public.geo_sea ADD CONSTRAINT fk_seaprovince FOREIGN KEY (country,province) REFERENCES public.province(country,name);


-- public.geo_source foreign keys

ALTER TABLE public.geo_source ADD CONSTRAINT fk_gsrcprovince FOREIGN KEY (country,province) REFERENCES public.province(country,name);
ALTER TABLE public.geo_source ADD CONSTRAINT fk_gsrcriver FOREIGN KEY (river) REFERENCES public.river("name");


-- public.ismember foreign keys

ALTER TABLE public.ismember ADD CONSTRAINT fk_country FOREIGN KEY (country) REFERENCES public.country(code);
ALTER TABLE public.ismember ADD CONSTRAINT fk_ismember FOREIGN KEY (organization) REFERENCES public.organization(abbreviation);


-- public.lake foreign keys

ALTER TABLE public.lake ADD CONSTRAINT fk_lakeriver FOREIGN KEY (river) REFERENCES public.river("name");


-- public.lakeonisland foreign keys

ALTER TABLE public.lakeonisland ADD CONSTRAINT fk_islandlake FOREIGN KEY (lake) REFERENCES public.lake("name");
ALTER TABLE public.lakeonisland ADD CONSTRAINT fk_lakeoisland FOREIGN KEY (island) REFERENCES public.island("name");


-- public."language" foreign keys

ALTER TABLE public."language" ADD CONSTRAINT fk_langcountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.located foreign keys

ALTER TABLE public.located ADD CONSTRAINT fk_locatedcity FOREIGN KEY (city,country,province) REFERENCES public.city("name",country,province);
ALTER TABLE public.located ADD CONSTRAINT fk_loclake FOREIGN KEY (lake) REFERENCES public.lake("name");
ALTER TABLE public.located ADD CONSTRAINT fk_locriver FOREIGN KEY (river) REFERENCES public.river("name");
ALTER TABLE public.located ADD CONSTRAINT fk_locsea FOREIGN KEY (sea) REFERENCES public.sea("name");


-- public.locatedon foreign keys

ALTER TABLE public.locatedon ADD CONSTRAINT fk_locatedcityon FOREIGN KEY (city,country,province) REFERENCES public.city("name",country,province);
ALTER TABLE public.locatedon ADD CONSTRAINT fk_onisland FOREIGN KEY (island) REFERENCES public.island("name");


-- public.organization foreign keys

ALTER TABLE public.organization ADD CONSTRAINT fk_capital FOREIGN KEY (city,country,province) REFERENCES public.city("name",country,province);


-- public.politics foreign keys

ALTER TABLE public.politics ADD CONSTRAINT fk_polscountry1 FOREIGN KEY (country) REFERENCES public.country(code);
ALTER TABLE public.politics ADD CONSTRAINT fk_polscountry2 FOREIGN KEY (dependent) REFERENCES public.country(code);


-- public.population foreign keys

ALTER TABLE public.population ADD CONSTRAINT fk_popcountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.province foreign keys

ALTER TABLE public.province ADD CONSTRAINT fk_citycapital FOREIGN KEY (capital,country,capprov) REFERENCES public.city("name",country,province);
ALTER TABLE public.province ADD CONSTRAINT fk_provcountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.provincelocalname foreign keys

ALTER TABLE public.provincelocalname ADD CONSTRAINT fk_provincelocal FOREIGN KEY (province,country) REFERENCES public.province("name",country);


-- public.provinceothername foreign keys

ALTER TABLE public.provinceothername ADD CONSTRAINT fk_provinceother FOREIGN KEY (province,country) REFERENCES public.province("name",country);


-- public.provpops foreign keys

ALTER TABLE public.provpops ADD CONSTRAINT fk_ppopsprovince FOREIGN KEY (country,province) REFERENCES public.province(country,name);


-- public.religion foreign keys

ALTER TABLE public.religion ADD CONSTRAINT fk_popcountry FOREIGN KEY (country) REFERENCES public.country(code);


-- public.river foreign keys

ALTER TABLE public.river ADD CONSTRAINT fk_riverlake FOREIGN KEY (lake) REFERENCES public.lake("name");
ALTER TABLE public.river ADD CONSTRAINT fk_riverriver FOREIGN KEY (river) REFERENCES public.river("name");
ALTER TABLE public.river ADD CONSTRAINT fk_riversea FOREIGN KEY (sea) REFERENCES public.sea("name");


-- public.riveronisland foreign keys

ALTER TABLE public.riveronisland ADD CONSTRAINT fk_islandriver FOREIGN KEY (river) REFERENCES public.river("name");
ALTER TABLE public.riveronisland ADD CONSTRAINT fk_riveroisland FOREIGN KEY (island) REFERENCES public.island("name");


-- public.riverthrough foreign keys

ALTER TABLE public.riverthrough ADD CONSTRAINT fk_thlake FOREIGN KEY (lake) REFERENCES public.lake("name");
ALTER TABLE public.riverthrough ADD CONSTRAINT fk_thriver FOREIGN KEY (river) REFERENCES public.river("name");

COMMIT;
