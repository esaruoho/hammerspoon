  hs.hotkey.bindSpec({ { "shift", "cmd"}, "," },
    function()
      hs.application.launchOrFocus("System Settings")
    end
  )  

  hs.hotkey.bindSpec({ { "shift", "cmd", "alt"}, "T" },
    function()
      hs.application.launchOrFocus("Terminal")
    end
  )  

  hs.hotkey.bindSpec({ { "ctrl", "cmd", "alt"}, "," },
    function()
      hs.osascript.applescript([[tell application "System Settings" to reveal pane id "com.apple.Software-Update-Settings.extension"
        tell application "System Settings" to activate]])
    end
  )
  
  hs.hotkey.bindSpec({ { "ctrl", "cmd", "alt" }, "r" }, 
    hs.reload,
    hs.notify.show("Hammerspoon", "Reloaded", "")
  )

live_hotkey = hs.hotkey.bind({"cmd"}, "W", function()
  local win = hs.window.focusedWindow()
  if win:application():name() == "Live" then -- Check if window belongs to Live
    if string.find(win:title(), "/") then -- Plugin windows in Live have "/" in the title. The main window does not.
      win:close();
    end
  else
    live_hotkey:disable(); -- we have to disable the hotkey to send CMD-W through
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, true):post()
    hs.eventtap.event.newKeyEvent("w", true):post()

    hs.eventtap.event.newKeyEvent("w", false):post()
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, false):post()
    live_hotkey:enable(); -- enable the hotkey once again
  end
end)
live_hotkey:enable();
