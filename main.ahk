#Requires AutoHotkey v2.0
/*
Caps lock to escape and ctrl
*/
Escape::CapsLock
Capslock::RCtrl

Capslock Up::{
    Send "{RCtrl Up}"
    If (A_PriorKey = "Capslock") ; if Capslock was pressed alone
        Send "{Esc}"
}

/*
Hyper keys: Vim arrows
*/
<!h::Send("{Left}")    ; Left Alt + H → Left Arrow
<!j::Send("{Down}")    ; Left Alt + J → Down Arrow
<!k::Send("{Up}")      ; Left Alt + K → Up Arrow
<!l::Send("{Right}")   ; Left Alt + L → Right Arrow


/*
Hyper keys: Tab change
*/
<!i::Send('^+{Tab}')  ; prev tab
<!o::Send("^{Tab}")  ; next tab

/*
Hyper keys: Single word delete instead of line
*/
<!Backspace::Send("^{Backspace}")

; Launcher function: activate if open, else run program. Do not modify program
launcher(exeName) {
    if WinExist("ahk_exe " exeName) {
        WinActivate()  ; activate the found window
    } else {
        Run(exeName)
    }
}
; Change with path wanted
<!g::launcher('C:\Program Files\Google\Chrome\Application\chrome.exe')
<!d::launcher('C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2025.1.3\bin\idea64.exe')
<!s::launcher("C:\Program Files\WSL\wsl.exe")
<!a::launcher("https://chat.openai.com/")
/*
<!e::launcher('Path to email (outlook)')
<!c::launcher('Path to chat (teams)')
<!f::launcher('Path to any other stuff')
*/

/*
Powertoys section
1) Ensure powertoys run is alt space for macbook functionality
2) Ensure that fancyzones are set
3) Turn mouse finder off
*/
