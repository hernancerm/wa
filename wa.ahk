; vim:textwidth=80:colorcolumn=80:comments+=\:;

#SingleInstance Force

; See list of keys: https://www.autohotkey.com/docs/KeyList.htm

; Basics
; ------

#IfWinNotActive ahk_exe gvim.exe
  ; Hold Pause to turn off the computer.
  Pause::
    KeyWait Pause, T3
    if (ErrorLevel = 1)
      Shutdown 5
  return

  ; Remap caps lock to basckspace.
  CapsLock::
    Send {Backspace}
    KeyWait CapsLock
  return

  ; Unset some keys.
  AppsKey::return
#IfWinNotActive

; Enter
; -----

#IfWinActive ahk_exe notepad.exe
  ; Disable auto repetation when enter is held down.
  Enter::
    Send {Enter}
    KeyWait Enter
  return

  ; Disable shift+enter in notepad.
  +Enter::return
#IfWinActive

#IfWinActive ahk_exe firefox.exe
  ; Use enter only to go down a new line.
  Enter::
    Send +{Enter}
    KeyWait Enter
  return

  ; Hold shift+enter for 3s to trigger regular enter.
  +Enter::
    KeyWait Enter, T3
    if (ErrorLevel = 1)
      Send {Enter}
  return
#IfWinActive

