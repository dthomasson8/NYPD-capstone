select *
from arrests;


/* Number of arrests on each day, in descending order. September 29 had the most arrests. */ 
select arrestdate, count(arrestdate)
from arrests
group by 1
order by 2 desc;


/* count of arrests by sex: male (115,970), female (24,594)*/
Select sex, count(sex)
from arrests
group by 1
order by 2 desc;


/* count of the types of calls for service */
select typedesc, count(typedesc)
from calls
group by 1
order by 2 desc


/*  */
select arrestkey, eventid, arrestdate, race, sex, offensedesc, a.latitude, a.longitude
from arrests as a
full join calls as c
on a.arrestkey = c.eventid
group by 1,2,3,4,5,6,7,8
