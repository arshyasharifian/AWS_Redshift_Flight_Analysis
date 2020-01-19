create table a201923.agg_depdelay_carrier as
select engineer.ontime.carrier, sum(engineer.ontime.depdelayminutes)
from engineer.ontime
where engineer.ontime.year = 2015
group by engineer.ontime.carrier;

--create table a201923.ontime_with_coords as
select count (*), eo.carrier
from engineer.ontime eo
where year = 2015
group by eo.carrier;

select aa.coordinates, aa.iata_code, eo.dest, eo.depdelayminutes
from a201923.airport_codes aa 
right join engineer.ontime eo
on aa.iata_code = eo.dest
where eo.depdelayminutes > 0
limit 100;

select eo.flightdate, eo.depdelayminutes, aa.coordinates, aa.iata_code
from engineer.ontime eo
full outer join a201923.airport_codes aa 
on aa.iata_code = eo.dest
where eo.depdelayminutes > 0 and eo.year = 2015
limit 100;

select *
from engineer.ontime eo, a201923.airport_codes aa
where aa.iata_code = eo.dest
limit 100;

select * from engineer.ontime
limit 2;

create table a201923.table_w_rownumbers as 
select 
  row_number() over (partition by 1) as nrum,
  eo.*
from engineer.ontime as eo;



