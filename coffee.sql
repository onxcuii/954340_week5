use coffee;

start transaction;

insert into menu values (1,"Americano","50","55","An Americano is an espresso diluted with water");
insert into menu values (2,"Capucino","45","50","a single or double or triple espresso shot and hot milk, with the surface topped with foamed milk");
insert into menu values (3,"Latte","60","65"," made with espresso and steamed milk.");

insert into members values (1,"John","0987654321",1);
insert into members values (2,"Jenny","0654321987",2);

insert into orders_details values (1,2,"hot",50,1,1);
insert into orders_details values (2,1,"cold",100,1,3);
insert into orders_details values (3,2,"hot",25,1,2);

insert into ` orders` values (1,"2023-07-23 08:15:04",100,1);
insert into ` orders` values (2,"2023-07-24 09:21:28",50,1);
insert into ` orders` values (3,"2023-07-25 08:56:16",90,1);

commit;

select member_name, sweet_level, count(sweet_level) as count 
from members 
join ` orders` using (member_id)
join orders_details using (orders_id)
join menu using (menu_id)
group by member_name, sweet_level;

