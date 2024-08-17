select * from sales

select * from customer

--1)  quantity<3 low quantity else high quantity

create or replace function checkquantity (quantity int)
returns varchar as $$
declare
	output varchar;
begin
	if quantity<3 then output:='low quan';
	else output:='high quan';
end if;
return output;
end
$$ language plpgsql

select *, checkquantity(quantity) from sales


--2) discount<0 negative else positive

create or replace function discount_status (discount double precision)
returns varchar as $$
declare
	output varchar;
begin
	if discount<=0 then output:='negative';
	else output:='positive';
end if;
return output;
end
$$ language plpgsql

select *, discount_status (discount) from sales


-- 3)  sales<500 low sale else high sale
	
create or replace function checksales (sales double precision)
returns varchar as $$
declare
	output varchar;
begin
	if sales <500 then output:='low sale';
	else output:='high sale' cost;
end if;
return output;
end
$$ language plpgsql

select *, checksales(sales) from sales

	
--4) profit>0 good profit else no profit

create or replace function checkprofit(profit double precision)
returns varchar as $$
declare
	output varchar;
begin
	if profit>0 then output:='good profit';
	else output:='no profit';
end if;
return output;
end
$$ language plpgsql 

select profit, checkprofit(profit) from sales


--5) age<40 adult, age<60 senior else super senior

create or replace function age_criteria(age int)
returns varchar as $$
declare
	age_status varchar;
begin
	case
		when age<40 then age_status:='adult';
		when age<60 then age_status:='senior';
		else age_status:='super senior';
	end case;
	return age_status;
end
$$ language plpgsql;

select *, age_criteria(age) from customer