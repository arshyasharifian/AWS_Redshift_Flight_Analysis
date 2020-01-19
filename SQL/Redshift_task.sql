select count(eo.*), eo.carrier, eo.year
from engineer.ontime eo
group by eo.carrier, eo.year;

