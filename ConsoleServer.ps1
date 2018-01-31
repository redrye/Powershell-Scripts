param([int]$port=8080, [string]$message="OK")
$interface = New-Object System.Net.HttpListener
$interface.Prefixes.Add("http://localhost:$port/")
$interface.Start()
while ($listener.IsListening)  {
    $context = $interface.GetContext()  #Blocks
    $buffer = [System.Text.Encoding]::UTF8.GetBytes($message )
    $context.response.OutputStream.Write($buffer, 0, $buffer.Length)   
    $context.response.Close();
}
