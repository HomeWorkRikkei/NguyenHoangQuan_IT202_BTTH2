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

INSERT INTO movies VALUES 
('M01', 'Dune: Part Two', 166, 13), ('M02', 'The Batman II', 175, 13),
('M03', 'Deadpool & Wolverine', 127, 18), ('M04', 'Kung Fu Panda 4', 94, 0);

INSERT INTO rooms VALUES 
('R01', 'Cinema 01', 150, 'active'), ('R02', 'Cinema 02', 120, 'active'),
('R03', 'IMAX Premium', 80, 'maintenance');

INSERT INTO showtimes VALUES 
('S01', 'M01', 'R01', '2026-05-01 18:00', 120000), ('S02', 'M03', 'R02', '2026-05-01 20:30', 150000),
('S03', 'M04', 'R01', '2026-05-02 09:00', 90000), ('S04', 'M02', 'R02', '2026-05-02 14:00', 130000),
('S05', 'M01', 'R01', '2026-05-02 21:00', 120000);

INSERT INTO bookings VALUES 
('B01', 'S01', 'An', '0901234567', NOW()), ('B02', 'S01', 'Bình', '0907654321', NOW()),
('B03', 'S02', 'Chi', '0912345678', NOW()), ('B04', 'S02', 'Duy', '0922334455', NOW()),
('B05', 'S03', 'Hoa', '0933445566', NOW()), ('B06', 'S03', 'Khải', '0944556677', NOW()),
('B07', 'S04', 'Linh', '0955667788', NOW()), ('B08', 'S04', 'Minh', '0966778899', NOW()),
('B09', 'S05', 'Nam', '0977889900', NOW()), ('B10', 'S05', 'Oanh', '0988990011', NOW());