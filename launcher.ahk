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

; Used for apps if have multiple instance, ie vscode

<!a:: launchIfNotLaunchedWithoutRun("ChatGPT.exe")  ; Microsoft Store app, no path

; <!a Ai Alternative
aiWindowAhkId := 141506
;<!a::WinExist("ahk_id " aiWindowAhkId) ? (WinActive("ahk_id " aiWindowAhkId) ? WinClose("ahk_id " aiWindowAhkId) : WinActivate("ahk_id " aiWindowAhkId)) : (ToolTip("Not Found [VsCode Ai] > Open Chat in New Window > Use Spy to get ahk_id > replace aiWindowAhkId in launcher.ahk script"), SetTimer(() => ToolTip(), -5000))

<!g:: launchIfNotLaunched('C:\Program Files\Google\Chrome\Application\chrome.exe')
<!s:: launchIfNotLaunched("C:\WINDOWS\system32\cmd.exe", "WindowsTerminal.exe")
<!d:: launchIfNotLaunched("C:\Program Files\JetBrains\CLion 2025.1.4\bin\clion64.exe")
<!v:: launchIfNotLaunched("C:\Users\dccha\AppData\Local\Programs\Microsoft VS Code\Code.exe")

launchIfNotLaunched(exePath, exeName := "") {
    if exeName = ""
        exeName := StrSplit(exePath, "\")[-1]
    target := "ahk_exe " exeName

    if WinActive(target) {
        WinMinimize(target)
    }
    else if WinExist(target) {
        WinActivate(target)
    }
    else {
        Run(exePath)
    }
}

/*
Same apps do not have executable path, eg, for microsoft store apps. Instead of trying to Run if it does not exist, tell the user to open it first
*/
launchIfNotLaunchedWithoutRun(exeName) {
    target := "ahk_exe " exeName
    if WinActive(target) {
        ToolTip(exeName " is already active!")
        SetTimer () => ToolTip(), -1000  ; Hide tooltip after 1 second
    }
    else if WinExist(target) {
        WinActivate(target)
    }
    else {
        ToolTip("Error activating :[ " . exeName . " ] . Open it first")
    }
}

runCommandIfNotLaunched(commandIfNotLaunched, exeName) {
    if exeName = ""
        exeName := StrSplit(commandIfNotLaunched, "\")[-1]
    target := "ahk_exe " exeName
    if WinActive(target) {
        WinMinimize(target)
    }
    else if WinExist(target) {
        WinActivate(target)
    }
    else {
        Run(commandIfNotLaunched)
    }
}
