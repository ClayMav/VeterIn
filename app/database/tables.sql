create table veterans(
	username varchar(80) not null,
	name varchar(80) not null,
	skills varchar(200),
	years_served int not null,
	rank varchar(200) not null,
	branch varchar(200) not null,
	bio varchar(120),
	image varchar(80) DEFAULT "default.png",
	contact varchar(80),
	primary key(username)
);

insert into veterans (username, name, skills, years_served, rank, branch, bio, image, contact) values("25cent9", "Innocent Niyibizi", "Hacking, Computer Programming, Wire Tapping, Photography", 3, "Private","Army", "Hello, my name is Innocent and I was in the Army for three years. I was given tasks that are really under NDA", "inni.gif", "25cent9@gmail.com");
insert into veterans (username, name, skills, years_served, rank, branch, bio, image, contact) values("claymav", "Clay McGinnis", "Walking, Screaming, Recursion, The fine arts", 2, "Private","Air Force", "A long a time lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi pretium purus at tempus euismod. Phasellus ac lacus sit amet ante blandit posuere. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam ac sagittis tellus. In interdum eros a dolor egestas, non feugiat erat sodales. Praesent quam enim, scelerisque facilisis diam at, efficitur blandit eros. Mauris sodales varius ultricies. ", "default.png", "mcginnis@claymav.com");

CREATE TABLE organization (
	id int not null,
	name varchar ( 80 ) not null,
	location varchar ( 80 ) not null,
	image varchar ( 80 ) default "orgdefault.png",
	url varchar ( 80 ) not null,
	industry varchar ( 80 ) not null,
	profit int check (profit <=1 and profit >=0),
	bio	varchar ( 240 ),
	contact	varchar ( 240 ) not null,
	PRIMARY KEY(id)
);

INSERT INTO organization (id, name, location, image, url, industry, profit, bio, contact) VALUES (1, "Innocent's Vet Store", "37.948544,-91.7715303", "orgdefault.png", "iniyibzi.com", "Public Sector", 1, "Hello, Innocent's Vet Store is mostly aimed towards helping veterans buy from other veterans. Our motto is 'From Veterans, By Veterans' ", "(123)-buy-vets");
INSERT INTO organization (id, name, location, image, url, industry, profit, bio, contact) VALUES (2, "Clay's Vet Store", "37.948244,-91.7715503", "orgdefault.png", "claymav.com", "Tech", 0, "Going to the mall? Well, it turns out you don't need to. Come to Clay's Vet Store and you can see it all.", "(321)-buy-tech");

create table post(
	postdate datetime not null,
	image varchar(80) DEFAULT " ",
	posttext varchar(120) not null,
	posterid int not null,
	primary key(postdate, posterid),
	foreign key(posterid) references organization(id)
);

INSERT INTO post (postdate, image, posttext, posterid) VALUES ('2015-05-01', "postone.jpg", "Hey this is a test post!", 1);

INSERT INTO post (postdate, image, posttext, posterid) VALUES ('2015-05-05', " ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus scelerisque mauris in nisl imperdiet, sed pharetra turpis feugiat. Suspendisse ut risus varius, rutrum urna ut, placerat enim. Etiam et ultrices ligula. Cras interdum lacus vel ligula tempor euismod. Donec erat erat, mattis eget eros eu, luctus euismod tortor. Donec vulputate diam quis lectus fringilla, placerat lobortis nibh laoreet. Nulla nec diam erat. In vel facilisis dui. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam congue consequat efficitur. Fusce vel quam pharetra, fermentum ipsum in, vestibulum tellus. Praesent eu commodo quam. Etiam tristique libero in nisi venenatis volutpat. Cras posuere imperdiet venenatis. Quisque facilisis et orci sed mollis. Nunc aliquet nisi auctor, dignissim ante porta, vestibulum odio. Morbi at metus non nisl semper vulputate. Maecenas et dolor sit amet sem faucibus vehicula sed nec ipsum. Nulla sagittis purus sed sem faucibus, ut eleifend sem iaculis. Vivamus vulputate egestas orci imperdiet cursus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc ullamcorper orci at nisl placerat iaculis. Proin posuere mi dolor, nec mattis libero porttitor non. Pellentesque porta libero sed sagittis molestie. Morbi vehicula feugiat turpis. Nullam pretium odio at sagittis bibendum. Praesent quis tempor mi. Vivamus interdum eget tellus sed imperdiet. Fusce vel diam vel ipsum malesuada mattis. Sed eleifend magna non condimentum suscipit. Vivamus feugiat vitae tellus nec vulputate. Suspendisse non nulla et nibh hendrerit rhoncus eu blandit velit. Phasellus consequat, urna at congue ultricies, justo orci laoreet diam, at feugiat est felis in massa. Mauris ac rhoncus ipsum.", 1);

create table partof(
	username varchar(80) not null,
	orgid int not null,
	position varchar(80) not null,
	primary key(username,orgID, position),
	foreign key(username) references veterans(username),
	foreign key(orgid) references organization(id)
);

INSERT INTO partof (username, orgid, position) VALUES ("25cent9", 1, "owner");

create table passhash(
	username varchar(80) not null,
	hash varchar(240) not null,
	primary key(username, hash),
	foreign key(username) references veterans(username)
);

insert into passhash(username, hash) values('25cent9', 'b1e55ce011276391b3884ed0a83b2333f57fb970d984b67cf5399fe07b24f988')
