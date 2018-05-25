# command to create multiple directories at once
echo dir1 dir2 dir3 | foreach $_{mkdir $_}

# or
dir1 dir2 dir3 | foreach $_{ New-Item -ItemType directory -Name $_ }

## For numerical directories, ex. ch1, ch2 ...
0..9 | foreach $_{ New-Item -ItemType directory -Name $("ch" + $_) }
