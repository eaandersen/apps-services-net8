$sqlConn = New-Object System.Data.SqlClient.SqlConnection
$sqlConn.ConnectionString = "Server=localhost;Database=gohub;User Id=sa;Encrypt=True;TrustServerCertificate=True;Password=cfJ2tM933g0Y#1;"
$sqlConn.Open()

$sqlCmd = $sqlConn.CreateCommand();
$sqlCmd.CommandText = "SELECT * FROM dbo.Inventory WHERE quantity < 80;"

$sqlDA = New-Object System.Data.SqlClient.SqlDataAdapter $sqlCmd
$sqlDataset = New-Object System.Data.DataSet
$sqlDA.Fill($sqlDataset)

$data = $sqlDataset.Tables[0]
$data | Select-Object id, name | Sort-Object name -Descending

$sqlConn.Close()