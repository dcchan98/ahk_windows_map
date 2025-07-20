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

launcherUsingStart(exeName) {
    ; Open Start Menu
    Send("!{Space}")  ; This sends Win key press
    ; Wait for Start Menu to appear
    ; Small delay to ensure search box is focused
    Sleep(100)
    ; Type the app name slowly
    for char in StrSplit(exeName) {
        Send(char)
        Sleep(50)
    }
    Sleep(100)
    ; Press Enter
    Send("{Enter}")
}
; Change with path wanted
<!g::launcher('C:\Program Files\Google\Chrome\Application\chrome.exe')
<!s::launcher("C:\Program Files\WSL\wsl.exe")
<!a::{
    launcher("C:\Program Files\Google\Chrome\Application\chrome.exe")
    Sleep(100) ; Wait for Chrome to open the tab
    if WinExist("ahk_exe chrome.exe") {
        WinActivate()
        Sleep(100)
        Send("^1") ; Ctrl+1 = First tab
    }
}
<!d::launcherUsingStart('intellij idea')
<!e::launcherUsingStart('outlook')
<!c::launcherUsingStart('microsoft teams')
/*
<!f::launcher('Path to any other stuff')
*/

/*
Powertoys section
1) Ensure powertoys run is alt space for macbook functionality
2) Ensure that fancyzones are set
3) Turn mouse finder off
*/
