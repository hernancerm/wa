; vim:fenc=utf-8:tw=80:com+=\:;

#SingleInstance Force

; See list of keys: https://www.autohotkey.com/docs/KeyList.htm

; Basics
; ------

; Use left-handed mouse.
LButton::RButton
RButton::LButton

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

; Enter-related
; -------------

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

  ; Keep pressed f12 for 3s to trigger regular enter.
  F12::
    KeyWait F12, T3
    if (ErrorLevel = 1)
      Send {Enter}
  return

  ; Disable numbad enter.
  NumpadEnter::return
#IfWinActive

