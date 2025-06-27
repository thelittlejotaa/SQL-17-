select count (*) from film f
inner join language l 
ON f.language_id = l.language_id
where l."name" = 'portuguese';

select count (*) from customer c 
inner join rental r
on c.customer_id = r.customer_id
inner join inventory i 
on i.inventory_id= r.inventory_id
inner join film f
on i.film_id = f.film_id 
where f.film_id = 7

select count (*) from rental r

select replacement_cost from film f 
where f.film_id = 600

select replacement_cost from payment p 
inner join rental r
on p.rental_id = r.rental_id
inner join inventory i 
on i.inventory_id= r.inventory_id
inner join film f
on i.film_id = f.film_id 
where f.film_id = 600


select count (*) from store s2
inner join staff s
on s.staff_id = s2.manager_staff_id group by s.username

select f.title, l."name", p.amount, r.rental_date, c.first_name, s.username, s2.store_id, r.rental_id from film f, "language" l, payment p, rental r , customer c, staff s, store s2; 

select count (*) from actor a
inner join film_actor fa 
on fa.actor_id = a.actor_id 
inner join film f 
on f.film_id = fa.film_id 
where a.first_name like 'j%'

select count (*) from store s2
inner join inventory i 
on i.store_id = s2.store_id

