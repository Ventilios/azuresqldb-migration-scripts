##############################################
#
# SAMPLE SCRIPT. TESTING PURPOSES ONLY. 
#
##############################################

#
# Use sqlcmd to execute the file containing the object deployment. 
# Scripts can be generated with DMA or SSMS. 
# * DMA: https://docs.microsoft.com/en-us/sql/dma/dma-migrateonpremsqltosqldb
# * SSMS: https://docs.microsoft.com/en-us/sql/ssms/tutorials/scripting-ssms?view=sql-server-ver15#script-a-database-by-using-the-generate-scripts-option
#
####

$sqlcred = Get-Credential # sql authenticated login user name and prompt for password
$sqlpwd = $sqlcred.GetNetworkCredential().Password
$sqluser = $sqlcred.UserName

$targetsql = "<xxx>.database.windows.net" # change server name
$targetsqldb = "<databasename>" # replace with database name on the target

#
# DMA Export
# Test 1 - Use the complete DMA output file 
& sqlcmd -S "$targetsql" -d $targetsqldb -U $sqluser -P $sqlpwd -i "C:\Workingdirectory\DMA_Stackoverflow.sql"

#
# DMA Export
# Test 2 - Break up the DMA output file to multiple files
& sqlcmd -S "$targetsql" -d $targetsqldb -U $sqluser -P $sqlpwd -i "C:\Workingdirectory\DMA_Stackoverflow1.sql"

& sqlcmd -S "$targetsql" -d $targetsqldb -U $sqluser -P $sqlpwd -i "C:\Workingdirectory\DMA_Stackoverflow2.sql"

& sqlcmd -S "$targetsql" -d $targetsqldb -U $sqluser -P $sqlpwd -i "C:\Workingdirectory\DMA_Stackoverflow3.sql"

#
# SSMS Export
# Generate a script through SSMS - Be sure to check the ADVANCED options! Set the right Target, Statistis, Schema only
# Remove any ALTER DATABASE statements when moving to Azure SQL database.
& sqlcmd -S "$targetsql" -d $targetsqldb -U $sqluser -P $sqlpwd -i "C:\Workingdirectory\SSMS_Stackoverflow.sql"