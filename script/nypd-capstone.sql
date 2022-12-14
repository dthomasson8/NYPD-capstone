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


/* CTEs for finding the arrests in common*/
with squirrel_info as(
    select age, primarycolor, activities, groundlocation, running, climbing, threatened, location
    from squirrels
    where threatened is true
    group by 1,2,3,4,5,6,7,8
    order by 1
),
    
arrest_info as(
    select arrestdate, offensedesc as crime, concat('POINT','(',latitude, ' ', longitude,')') as location,
        case 
            when arrestdate is notnull then 'arrest'
            end as arrest
    from arrests
    group by 1,2,3
    order by 1 desc
),


call_info as(
    select cast(incidentdate as date), typedesc as call_type, concat('POINT','(',latitude, ' ', longitude,')') as location
    from calls
    where incidentdate <= '09/30/2022'
    group by 1,2,3
    order by 1 desc
)

select *
from arrest_info
union 
select *
from call_info;