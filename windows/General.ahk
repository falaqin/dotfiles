^!T::{
    if WinExist("ahk_exe WindowsTerminal.exe") {
        executeList("ahk_exe WindowsTerminal.exe")
    } else {
        Run "wt.exe"
    }
}

^!C::{
    if WinExist("ahk_exe Code.exe") {
        executeList("ahk_exe Code.exe")
    }
    else {
        Run "C:\Users\User\AppData\Local\Programs\Microsoft VS Code\Code.exe"
    }
}

^!O::{
    if WinExist("ahk_exe Obsidian.exe") {
        executeList("ahk_exe Obsidian.exe")
    }
    else {
        Run "C:\Users\User\AppData\Local\Obsidian\Obsidian.exe"
    }
}

^!M::{
    if WinExist("ahk_exe chrome.exe") {
        executeList("ahk_exe chrome.exe")
    }
    else {
        Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
    }
}

^!P::{
    if WinExist("ahk_exe Postman.exe") {
        executeList("ahk_exe Postman.exe")
    }
    else {
        Run "C:\Users\User\AppData\Local\Postman\Postman.exe"
    }
}

executeList(exeStr) {
    list := WinGetList(exeStr)
    for id in list {
        if !WinActive(id) {
            WinActivate id
            break
        }
        WinMinimize id
    }
}