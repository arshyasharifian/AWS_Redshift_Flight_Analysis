select eo.*, aa.coordinates, aa.iata_code --eo.dest, eo.depdelayminutes
from a201923.airport_codes aa 
right join engineer.ontime eo
on aa.iata_code = eo.dest
where eo.depdelayminutes > 0 and eo.year = 2015
limit 100;

--using this one
create table a201923.coord_delays as
select eo.carrier, eo.dest, eo.arrdelayminutes, aa.coordinates
from engineer.ontime eo
join a201923.airport_codes aa
on eo.dest = aa.iata_code
where eo.year = 2015 and eo.arrdelayminutes > 0;

create table a201923.agg_coord_delays as
select sum(cd.arrdelayminutes), cd.coordinates
from a201923.coord_delays cd
group by cd.coordinates;

select count(*)
from a201923.agg_coord_delays;

select count(*)
from a201923.coord_delays;

select eo.dest
from engineer.ontime eo
where eo.dest is not null
limit 5;

select aa.iata_code
from a201923.airport_codes aa
limit 5;

