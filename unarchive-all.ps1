############################################
#
#	Unarchiving script originally
#	for zip files, but can be modified
#	for various archive files
#
#
###########################################
param(
	[array] $files
)
foreach($archive in $files) {
	write-output "Unziping $archive"
	start-process winzip64 "-e $zip"
}
 
