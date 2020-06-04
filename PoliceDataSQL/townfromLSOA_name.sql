/* LSOA_name fields also available in [dbo].[DF_recorded-street-crime]*/
UPDATE [dbo].[DF_reported-outcomes]
SET Town = LEFT(LSOA_name, PATINDEX('%[^ A-z]%', LSOA_name)-1);