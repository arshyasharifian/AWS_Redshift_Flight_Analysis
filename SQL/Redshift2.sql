drop table agg_depdelay_date;

create table agg_depdelay_date as
select eo.carrier, eo.dest, eo.flightdate, sum(eo.depdelayminutes)
from engineer.ontime eo
where eo.year > 2011 and eo.year < 2016 and eo.depdelayminutes > 0
group by eo.flightdate, eo.carrier, eo.dest;

select eo.carrier, eo.dest, sum(eo.depdelayminutes)
from engineer.ontime eo
where eo.year > 2011 and eo.year < 2016

drop table coord_delays;

create table coord_delays as
select eo.carrier, eo.origin, eo.flightdate, sum(eo.depdelayminutes), aa.coordinates
from engineer.ontime eo
join a201923.airport_codes aa
on eo.dest = aa.iata_code
where eo.year > 2011 and eo.year < 2016
group by aa.coordinates, eo.carrier, eo.origin, eo.flightdate;

select count(*)
from coord_delays;