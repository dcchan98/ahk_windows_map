#Requires AutoHotkey v2.0

Escape::CapsLock
Capslock::RCtrl
Capslock Up::{
    Send "{RCtrl Up}"
    If (A_PriorKey = "Capslock") ; if Capslock was pressed alone
        Send "{Esc}"
}