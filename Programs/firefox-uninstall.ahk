if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}
SetControlDelay -1
run, mb3.exe
WinWaitActive, ahk_class #32770
ControlClick, &Next >, ahk_class #32770
WinWaitActive, ahk_class #32770
ControlClick, &Uninstall, ahk_class #32770

return
return
return