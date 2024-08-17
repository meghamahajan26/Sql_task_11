select * from movies

select * from reviews 

----1) rating >= 9 super hit else normal
	
create or replace function checkratings (rating int)
returns varchar as $$
declare
	output varchar;
begin
	if rating >= 9 then output:='super hit';
	else output:='normal';
end if;
return output;
end
$$ language plpgsql

select rating, checkratings(rating) from reviews

---2) release year >=2000 then its a new generation movie else old generation movie

create or replace function check_year (year int)
returns varchar as $$
declare
	output varchar;
begin
	if year >= 2000 then output:='New Generation Movie';
	else output:='Old Generation Movie';
end if;
return output;
end
$$ language plpgsql

	
select *, check_year(release_year) from movies
