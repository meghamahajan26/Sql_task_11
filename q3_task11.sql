select * from sales

select * from customer

CREATE OR REPLACE FUNCTION check_sales(productId varchar)
RETURNS varchar as $$
DECLARE 
    output varchar;
    SumOfSales float;
BEGIN
    select SUM(sales) INTO SumOfSales FROM sales WHERE product_id = productId;

    IF SumOfSales > 1000 THEN output := 'Sales increases';
    ELSE output := 'Sales decreases';
    END IF;
RETURN output;
END;
$$ LANGUAGE plpgsql

select check_sales('FUR-CH-10004211')

select check_sales('OFF-AR-10002671')
 
select product_id, sum(sales) from sales group by product_id 

select *, check_sales(product_id) from sales