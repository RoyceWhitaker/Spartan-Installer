if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}
SetControlDelay -1
run, Firefox-Installer.exe
WinWaitActive, ahk_class MozillaDialogClass
Send %A_Tab%
Send {Enter}

return
return
return