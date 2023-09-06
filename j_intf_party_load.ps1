$csvFilePath = "E:\Yuvaraj\Wattyl\csv_s\J_INTF_PARTY.csv"
$serverName = "LI-LT635-HPG8\MSSQLSERVER02"
$databaseName = "tempdb"
$tableName = "J_INTF_PARTY"

# Create a connection string
$connectionString = "Data Source=$serverName;Initial Catalog=$databaseName;Integrated Security=SSPI;"

# Create a SQL connection
$connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
$connection.Open()

# Create a SQL command
$sqlCommand = $connection.CreateCommand()

# Set the BULK INSERT query
$bulkInsertQuery = @"
BULK INSERT $tableName
FROM '$csvFilePath'
WITH (FORMAT = 'CSV', FIRSTROW = 2);
"@

# Set the command text
$sqlCommand.CommandText = $bulkInsertQuery

# Execute the SQL command
$sqlCommand.ExecuteNonQuery()

# Close the SQL connection
$connection.Close()
