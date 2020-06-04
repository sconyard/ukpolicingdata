/*Adds a Town column ready for population from LSOA_Name values can be created in both reported-outcomes and recorded-street-crime tables*/
ALTER TABLE [dbo].[DF_reported-outcomes]
ADD Town NVARCHAR(MAX);