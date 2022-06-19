#SingleInstance Force
#InstallKeybdHook

; Name of any window title.
windowTitle := "Asistente de accesibilidad"

; Facilitate shutting down the computer.
Pause::
  MsgBox 4, windowTitle, ¿Desea apagar el sistema?

  IfMsgBox Yes
    Shutdown 4
return

; Unset some keys.
Alt::return
AppsKey::return

