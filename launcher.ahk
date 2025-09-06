#Requires AutoHotkey v2.0
/*
Caps lock to escape and ctrl
*/
/*
Escape::CapsLock
Capslock::RCtrl
Capslock Up::{
    Send "{RCtrl Up}"
    If (A_PriorKey = "Capslock") ; if Capslock was pressed alone
        Send "{Esc}"
}
*/

<!g::launchIfNotLaunched('C:\Program Files\Google\Chrome\Application\chrome.exe')
<!s::launchIfNotLaunched("C:\WINDOWS\system32\cmd.exe","WindowsTerminal.exe")
<!d::launchIfNotLaunched("C:\Program Files\JetBrains\CLion 2025.1.4\bin\clion64.exe")
<!v::launchIfNotLaunchedUsingPosition("C:\Users\dccha\AppData\Local\Programs\Microsoft VS Code\Code.exe","left")
<!a::launchIfNotLaunchedUsingPosition("C:\Users\dccha\AppData\Local\Programs\Microsoft VS Code\Code.exe","right")

launchIfNotLaunched(exePath, exeName := "") {
    if exeName = ""
        exeName := StrSplit(exePath, "\")[-1]
    target := "ahk_exe " exeName
    if WinActive(target) {
        ToolTip(exeName " is already active!")
        SetTimer () => ToolTip(), -1000  ; Hide tooltip after 1 second
    }
    else if WinExist(target) {
        WinActivate(target)
    }
    else {
        Run(exePath)
    }
}

runCommandIfNotLaunched(commandIfNotLaunched, exeName ) {
    if exeName = ""
        exeName := StrSplit(commandIfNotLaunched, "\")[-1]
    target := "ahk_exe " exeName
    if WinActive(target) {
        ToolTip(exeName " is already active!")
        SetTimer () => ToolTip(), -1000  ; Hide tooltip after 1 second
    }
    else if WinExist(target) {
        WinActivate(target)
    }
    else {
        Run(commandIfNotLaunched)
    }
}

; Launcher that uses screen position (left or right) for existing windows, Dont minimize or hide windows else we cant detect position  
launchIfNotLaunchedUsingPosition(exePath, side) {
    exeName := StrSplit(exePath, "\")[-1]   ; Extract exe name
    target := "ahk_exe " exeName
    found := false
    ; Look for existing windows
    for window in WinGetList(target) {
        WinGetPos(&x, &y, &w, &h, window)
        if WinActive(target) {
            ToolTip(exeName " is already active!")
            SetTimer () => ToolTip(), -1000  ; Hide tooltip after 1 second
        }
        if (side = "right" && x > A_ScreenWidth // 2) {
            WinActivate(window)
            found := true
            break
        }
        else if (side = "left" && x < A_ScreenWidth // 2) {
            WinActivate(window)
            found := true
            break
        }
    }
    ; Launch new instance only if no matching window was found
    if !found {
        Run(exePath)
    }
}
