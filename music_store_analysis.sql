-- question 1:
select * from employee
order by levels desc
limit 1 ;
 -- question 2:
select count(*) , billing_country from invoice
group by billing_country
order by count(*) desc;

-- Question 3:
select total from invoice
order by total desc
limit 3 ;

-- Question 4 :
select sum(total) as invoice_total ,billing_city from invoice
group by billing_city
order by invoice_total desc

--question 5:

select customer.customer_id,customer.first_name,customer.last_name,sum(invoice.total)as total
from customer
join invoice on customer.customer_id =invoice.customer_id
group by customer.customer_id
order by total desc
limit 1

--question 1 set 2:
select email,first_name,last_name from customer 
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (
 select track_id from track 
 join genre on track.genre_id = genre.genre_id 
 where genre.name like 'rock'
)
order by email asc;

--question 2 set 2:
select artist.name, artist.artist_id,count(artist.artist_id), count(artist.artist_id) as no_of_songs from track -- track table as later on sare table ko join kr diya jayea ..koi dikkat nhi hoi and central table bn gya hai hmara track table .
join album 
on album.album_id = track.album_id 
join artist 
on artist.artist_id = album.artist_id 
join genre 
on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by
artist.artist_id 
order by no_of_songs desc
limit 10 ;

 -- question 3 set 2:
select name, milliseconds from track
where milliseconds>
(
select avg(milliseconds) as avg_track_length from track)
order by milliseconds desc;
