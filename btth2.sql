create database cine_magic;
use cine_magic;

create table movies(
	id varchar(10) primary key,
    title varchar(255) not null,
    minutes int check(minutes>0),
    age_restiction int check(age_restiction in (0,13,16,18))
);

create table rooms(
	id varchar(10) primary key,
    name varchar(100) not null unique,
    max_seats int not null check(max_seats>0),
    status varchar(20) check(status in ('active','maintenance'))
);

create table showtimes(
	id varchar(10) primary key,
    movie_id varchar(10), foreign key (movie_id) references movies(id),
    room_id varchar(10), foreign key (room_id) references rooms(id),
    show_time datetime,
    ticket_price decimal(18,2)
);

create table bookings(
	id varchar(10) primary key,
    showtime_id varchar(10), foreign key (showtime_id) references showtimes(id),
    customer_name varchar(255) not null,
    phone varchar(11) not null,
    booking_date datetime
);