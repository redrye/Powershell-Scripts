$path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects'
$CurrentVersion = @('HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\AnimateMinMax',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ComboBoxAnimation',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ControlAnimations',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DragFullWindows',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMAeroPeekEnabled',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMEnabled',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DWMSaveThumbnailEnabled',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListBoxSmoothScrolling',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewAlphaSelect',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ListviewShadow',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\SelectionFade',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ThumbnailsOrIcon',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TooltipAnimation',
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TransparentGlass')

$DWM = 'HKCU:\Software\Microsoft\Windows\DWM'
$DWM_Bool_Off = @('AlwaysHibernateThumbnails',
                    'ColorizationOpaqueBlend',
                    'EnableAeroPeek',
                    'SuppressDisableCompositionUI')


$s = (Get-ItemProperty -ErrorAction stop -Name visualfxsetting -Path $path).visualfxsetting 
if ($s -ne 3) {
    Set-ItemProperty -Path $path -Name 'VisualFXSetting' -Value 3
    }
    
foreach($effect in $CurrentVersion) {
    $r = (Get-ItemProperty -ErrorAction stop -Name DefaultApplied -Path $effect).defaultapplied 
    if ($r -ne 0) {
        Set-ItemProperty -Path $effect -Name 'DefaultApplied' -Value 0
        }
}

foreach($function in $DWM_Bool_Off) {
    $r = (Get-ItemProperty -ErrorAction stop -Name $function -Path $DWM).$function 
    if ($r -ne 0) {
        Set-ItemProperty -Path $DWM -Name $function -Value 0
        }
}
