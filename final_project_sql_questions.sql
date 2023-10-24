# 1a. Выбрать все столбцы из таблицы actor (ограничить по 100 строкам).

SELECT 
    *
FROM
    actor
LIMIT 100;

# 1b. Выбрать только last_name из таблицы actor.

SELECT 
    last_name
FROM
    actor;

# 1c. Выбрать только следующие столбцы из таблицы film:
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# rental_duration       Exists in film table.
# rental_rate           Exists in film table.
# total_rental_cost     rental_duration * rental_rate (нужно перемножить два столбца, чтобы получить необходимый)

# ---------------------------------------------------------#

SELECT 
    title AS Title,
    description AS Description,
    rental_duration AS Rental_duration,
    rental_rate AS Rental_rate,
    (rental_duration * rental_rate) AS Total_rental_cost
FROM
    film;

# 2a. Выбрать различные/уникальные фамилии из таблицы actor.

SELECT DISTINCT
    last_name
FROM
    actor;

# 2b. Выбрать различные/уникальные почтовые коды из таблицы address.

select * from address;

SELECT DISTINCT
    postal_code
FROM
    address;

# 2c. Выбрать различные/уникальные рейтинги из таблицы film.

# ---------------------------------------------------------#
SELECT DISTINCT
    rental_rate
FROM
    film;

# 3a. Выбрать столбцы title, description, rating, length из таблицы film, которые длятся более 3 часа или более.
SELECT 
    title, description, rating, length
FROM
    film
WHERE
    length >= 180;

# 3b. Выбрать столбцы payment_id, amount, payment_date из таблицы payment, где платежи были сделаны 05/27/2005 или позднее.

select * from payment;

SELECT 
    payment_id, amount, payment_date
FROM
    payment
WHERE
    payment_date >= '2005-05-27';

# 3c. Выбрать все столбцы из таблицы customer, где фамилии начинаются на S и имена заканчиваются на N.

select * from customer;

SELECT 
    *
FROM
    customer
WHERE
    first_name LIKE 'N%'
        and last_name LIKE 'S%';

# 3d. Выбрать все столбцы из таблицы customer, где клиент является неактивным или его фамилия начинается на M.

SELECT 
    *
FROM
    customer
WHERE
    last_name LIKE 'M%' OR active = 0;

# 3e. Выбрать все столбцы из таблицы category, где первичный ключ больше 4 и столбец name начинается на C, S или T.
select * from category;

SELECT 
    *
FROM
    category
WHERE
    category_id >= 4 AND name LIKE 'C%'
        OR 'S%'
        OR 'T%';

# 3f. Выбрать все столбцы за исключением столбца password из таблицы staff, где имеется значение password.

# ---------------------------------------------------------#

select staff_id , first_name , last_name , address_id , picture , email , store_id , active , username , last_update from staff;

# 4a. Выбрать столбцы phone, district из таблицы address, которые находятся в California, England, Taipei, или West Java.

select * from address;

select phone , district from address where district in ('California' , 'England' , 'Taipei' ,  'West Java');

# 4b. Выбрать столбцы payment_id, amount, и payment_date из таблицы payment, где платежи были выполнены 05/25/2005, 05/27/2005, 05/29/2005.

select * from payment;

select payment_id , amount , payment_date from payment where DATE_FORMAT(payment_date, '%m/%d/%Y') in ('05/25/2005', '05/27/2005', '05/29/2005');

# 4c. Выбрать все столбцы из таблицы film, где рейтинг фильма является G, PG-13 или NC-17.

# ---------------------------------------------------------#

select * from film where rating in ('G' , 'PG-13' , 'NC-17');

# 5a. Выбрать все столбцы из таблицы payment, где платежи были выполнены между 05/25/2005 и 05/26/2005.

select * from payment where payment_date between '2005-05-25' and '2005-05-26';

# 5b. Выбрать только следующие столбцы из таблицы film, для фильмов у которых длина description между 100 и 120:
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# release_year          Exists in film table.
# total_rental_cost     rental_duration * rental_rate (нужно перемножить два столбца, чтобы получить необходимый)

# ---------------------------------------------------------#
select * from film;

select title , description , release_year , (rental_duration * rental_rate) as total_rental_cost from film where length(description) between 100 and 200 ;

# 6a. Выбрать только следующие столбцы из таблицы film, где description начинается на "A Thoughtful":
# Title, Description, Release Year

select title as Title , description as Description , release_year as Release_Year from film where Description like 'A Thoughtful%'; 

# 6b. Выбрать только следующие столбцы из таблицы film, где description заканчивается на слово "Boat".
# Title, Description, Rental Duration

select title as Title , description as Description , rental_duration as Rental_Duration from film where Description like '%Boat';

# 6c. Выбрать только следующие столбцы из таблицы film, где description содержит слово "Database" и длина фильма больше 3-х часов.
# Title, Length, Description, Rental Rate

# ---------------------------------------------------------#

select title as Title , description as Description , rental_rate as Rental_Rate from film where Description like '%Database%' and length >= 180;

# 7a. Выбрать все столбцы из таблицы film и упорядочить строки относительно столбца length по возрастанию.

select * from film order by length;

# 7b. Выбрать различные (уникальные) рейтинги из таблицы film, отсортированный по столбцу rating по убыванию.

select distinct rating from film order by rating desc;

# 7c. Выбрать столбцы payment_date, amount из таблицы payment (первые 20 строк) отсортированные по столбцу amount по убыванию.

# ---------------------------------------------------------#

select payment_date , amount from payment order by amount desc limit 20;

# 8a. Выбрать столбцы customer first_name/last_name и actor first_name/last_name используя /left join/ 
# между таблицами customer и actor (ON имена и фамилии соответсвенных таблиц) 
# Переименуйте столбцы customer first_name/last_name как customer_first_name/customer_last_name
# Переименуйте столбцы actor first_name/last_name в том же стиле как сверху
# Должно быть 599 строк
select * from customer;
select * from actor;

SELECT 
    a.first_name AS customer_first_name,
    a.last_name AS customer_last_name,
    b.first_name AS actor_first_name,
    b.last_name AS actor_last_name
FROM
    customer a
        LEFT JOIN
    actor b ON a.first_name = b.first_name
        AND a.last_name = b.last_name;

# 8b. Выполните тоже самое что и в 8а, только используйте /right join/ и посмотрите на разницу
# Должно быть 200 строк

SELECT 
    a.first_name AS customer_first_name,
    a.last_name AS customer_last_name,
    b.first_name AS actor_first_name,
    b.last_name AS actor_last_name
FROM
    customer a
        RIGHT JOIN
    actor b ON a.first_name = b.first_name
        AND a.last_name = b.last_name;


# 8c. Выбрать те же столбцы что и в 8а, только используйте /inner join/ через фамилию (без имени)
# Должно быть 43 строки
SELECT 
    a.last_name AS customer_last_name,
    b.last_name AS actor_last_name
FROM
    customer a
        INNER JOIN
    actor b ON a.last_name = b.last_name;


# 8d. Выбрать столбцы city, country из таблицы city, используя left join с таблицей country.
# Должно быть 600 строк
select * from city;
select * from country;

SELECT 
    a.city, b.country
FROM
    city a
        LEFT JOIN
    country b ON a.country_id = b.country_id;

# 8e. Выбрать столбцы title, description, release_year, и language_name из таблицы film, используя left join с таблицей language.
# Должно быть 1000 строк
select * from film;
select * from language;

select a.title , a.description , a.release_year , b.name from film a left join language b on a.language_id = b.language_id;

# 8f. Выбрать столбцы first_name, last_name, address, address2, city name, district, и postal code из таблицы staff, используя 2 left join с таблицей address, а потом также с таблицей city.
# Должно быть 2 строки
select * from staff;
select * from address;
select * from city;

SELECT 
    a.first_name,
    a.last_name,
    b.address,
    b.address2,
    c.city,
    b.district,
    b.postal_code
FROM
    staff a
        LEFT JOIN
    address b ON a.address_id = b.address_id
        LEFT JOIN
    city c ON b.city_id = c.city_id;
