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
order by 2 desc;


/* Concat for geo location */
select *,concat('POINT','(',latitude, ' ', longitude,')') as location
from arrests;

with squirrel_info as(
    select age, primarycolor, activities, groundlocation, running, climbing, threatened, location
    from squirrels
    where threatened is true
    group by 1,2,3,4,5,6,7,8
    order by 1;
)
    
with arrest_info as(
    select arrestdate, offensedesc as crime, agegroup, sex, race, concat('POINT','(',latitude, ' ', longitude,')') as location
    from arrests
    where 
    group by
    order by ;
)


select *
from calls;