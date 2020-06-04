# UK Policing Data

Opensource software and serverless methods to interrogate public data

## Data Manipulation

The RAW data arrives in many thousands of CSV files seperated by data set (stop and search, crimes or outcomes) and regional police authority.  PowerShell is used to manipulate this data into single CSV file per data set ready for upload.

## Azure Data Factory

Azure Data Factory injects the public police data into the Azure SQL tables.  Pipelines exist for CSVs hosted within BLOB storage and API calls to [Policing data](https://data.police.uk/docs/)

## Azure SQL

Due to the size of the public policing data this is stored in a serverless Azure SQL DB.  For reference the reported crimes table is over 9 million rows and the reported outcomes 6 million rows.

Town information is stored in a column 'LSOA_Name' within tables for outcome and reported crime. An SQL query copies 'LSOA_Name' data filtering numerical characters to a new column named 'Town', to allow simple location searching on the outcome and reported crime datasets

The raw data is not edited anywhere else

## Postgres

Postgres DB docker image deployed inside an Azure container service.  Hosting postgres, metabase DBs

## Metabase

[Metabase](https://www.metabase.com/) is opensource business intelligence software.  Perfect for asking questions of publically available data.

## Architecture

Azure Data Factory pipelines import data from BLOB and API sources to tables within an Azure SQL DB

Azure SQL DB hosts three Data Factory populated tables for recorded crime, reported outcomes and stop and search data

Both Postgres and Metabase are hosted as Azure container instances

Metabase configuration data is persisted within Postgres

Metabase hosts public dashboards

[Reported Crime](http://ukpolicingdata.uksouth.azurecontainer.io:3000/public/dashboard/9ad8664f-78de-4838-9d03-0c214a3c6142?date_range=2020-01-01~2020-04-30)

[Reported Outcomes](http://ukpolicingdata.uksouth.azurecontainer.io:3000/public/dashboard/4cf0adf6-0bcf-4ef4-8d99-e5154b792c6e?date_range=2020-01-01~2020-04-30)

[Stop and Search](http://ukpolicingdata.uksouth.azurecontainer.io:3000/public/dashboard/737c8bb9-6464-4836-a8cb-062ef553d690)

Data > Information > Knowledge > Wisdom
