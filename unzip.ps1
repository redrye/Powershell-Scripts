
param(
	[array] $files
)
foreach($zip in $files) {
	write-output "Unziping $zip"
	start-process winzip64 "-e $zip"
}
 
