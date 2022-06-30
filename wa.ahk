; vim:textwidth=80:colorcolumn=80:comments+=\:;

#SingleInstance Force

; See list of keys: https://www.autohotkey.com/docs/KeyList.htm

#IfWinNotActive ahk_exe gvim.exe
  ; Hold Pause to turn off the computer.
  Pause::
    KeyWait Pause, T3
    if (ErrorLevel = 1)
      Shutdown 5
  return

  ; Remap caps lock to basckspace, and disable auto repetition when held down.
  CapsLock::
    Send {Backspace}
    KeyWait CapsLock
  return

  ; Disable auto repetation when enter is held down.
  Enter::
    Send {Enter}
    KeyWait Enter
  return

  ; Unset some keys.
  AppsKey::return
#IfWinNotActive

