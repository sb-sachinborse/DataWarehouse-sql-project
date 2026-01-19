/*********************************************************************** 
  Create Database and Schemas
***********************************************************************/

/**********************************************************************
Script Purpose:
  This script create a new database named "DataWarehouse" after cheacking
if it already exists. If the data base exists , it is dropped and reacreated.
Additionlly , the script sets up three schemas within the database: 
"bronze", "silver", and "gold"
-------------------------------------------------------------------
Warning:
  Running this script will drop the etire "DataWarehouse" datasbase if it exists.
All the data in the databs will permanently deleted.Poceed with caution and
ensure you have proper backups before running this script
**********************************************************************/


USE master;
GO --batch terminator

--Drop and recreate the 'DataWarehouse'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO
--create 'DataWareHouse' database
CREATE DATABASE DataWarehouse;

--set 
USE DataWarehouse;
GO

-- Create the DataWarehouse database
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
