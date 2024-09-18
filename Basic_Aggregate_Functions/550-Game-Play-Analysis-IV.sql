# Write your MySQL query statement below
select round(count(distinct a1.player_id)/(select count(distinct player_id) from activity),2) as fraction from activity a1
join activity a2 on date_add(a1.event_date,interval 1 day)=a2.event_date
and a1.player_id=a2.player_id

and (a1.player_id,a1.event_date) in (select player_id,min(event_date) from activity group by player_id)