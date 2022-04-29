'********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

sub Main()
  showChannelSGScreen()
end sub

sub showChannelSGScreen()
  screen = CreateObject("roSGScreen")
  m.port = CreateObject("roMessagePort")
  screen.setMessagePort(m.port)
  scene = screen.CreateScene("PanelSetExample")
  scene.backExitsScene = false
  screen.show()

  while(true)
    msg = wait(0, m.port)
    msgType = type(msg)

    if msgType = "roSGScreenEvent"
      if msg.isScreenClosed() then return
    end if
  end while
end sub

sub showDialogSGScreen()
  screen = CreateObject("roSGScreen")
  m.port = CreateObject("roMessagePort")
  screen.setMessagePort(m.port)
  scene = screen.CreateScene("DialogExample")
  scene.backExitsScene = false
  screen.show()

  while(true)
    msg = wait(0, m.port)
    msgType = type(msg)

    if msgType = "roSGScreenEvent"
      if msg.isScreenClosed() then return
    end if
  end while

end sub


Function onKeyEvent(key as String, press as Boolean)
    handled = false

    if press
        if key = "back"
          showDialogSGScreen()
        end if
    end if

    return handled
end Function
