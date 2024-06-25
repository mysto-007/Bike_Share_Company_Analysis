-- selecting the columns of table

Select * from bike_share_yr_0

-- Since i have to change the datatype of dteday column so i created a new column first and then used 
-- try_convert function to convert the dteday column into date datatype
alter table bike_share_yr_0 add new_dteday Date

update bike_share_yr_0 
SET new_dteday = Try_Convert(date, dteday, 103)

-- Checking the datatype of columns

Select COLUMN_NAME, DATA_TYPE
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'bike_share_yr_1'

-- Checking if some column misses or not

select dteday from bike_share_yr_0 where new_dteday is NULL and dteday is not null;


-- Dropping the originl column dteday from bike_share_yr_0 table

alter table bike_Share_yr_0 drop column dteday

-- Rename the column

EXEC sp_rename 'bike_share_yr_0.new_dteday', 'dteday', 'COLUMN';

-- Now repeating the process for table bike_share_yr_1
Select * from bike_share_yr_1

alter table bike_share_yr_1 add new_dteday Date

update bike_share_yr_1 
SET new_dteday = Try_Convert(date, dteday, 103)

select dteday from bike_share_yr_1 where new_dteday is NULL and dteday is not null;

alter table bike_Share_yr_1 drop column dteday

EXEC sp_rename 'bike_share_yr_1.new_dteday', 'dteday', 'COLUMN';













