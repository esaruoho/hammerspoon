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
