#InstallKeybdHook
#KeyHistory
#MaxHotkeysPerInterval, 10000

BASE_SPEED = 1
BASE_SPEED_MULTIPLIER = 10
isMovingMouse = false
canMoveMouse = false


$s::
{
  if (canMoveMouse = "true")
  {
    BASE_SPEED = 0.5
    BASE_SPEED_MULTIPLIER = 20
  }
  else
  {
    Send s
  }
  Return
}

$g::
{
  if (canMoveMouse = "true")
  {
    Click, down, middle
  }
  else
  {
    Send g
  }
  Return
}
$g Up::
{
  if (canMoveMouse = "true")
  {
    Click, up, middle
  }
  Return
}

$f::
{
  if (canMoveMouse = "true")
  {
    Click down
  }
  else
  {
    Send f
  }
  Return
}
$f Up::
{
  if (GetKeyState("d", "P"))
  {
    Click up
  }
  Return
}

$v::
{
  if (GetKeyState("d", "P"))
  {
    Click, down, right
  }
  else
  {
    Send v
  }
  Return
}
$v Up::
{
  if (GetKeyState("d", "P"))
  {
    Click, up, right
  }
  Return
}

$s Up::
{
  BASE_SPEED = 1
  BASE_SPEED_MULTIPLIER = 10
  Return
}

$h::
{
  if (canMoveMouse = "true")
  {
    isMovingMouse = true
    While GetKeyState("h", "P")
    {
      if (GetKeyState("j", "P"))
      {
        MouseMove, -%BASE_SPEED_MULTIPLIER%, %BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      }
      else if (GetKeyState("k", "P"))
      {
        MouseMove, -%BASE_SPEED_MULTIPLIER%, -%BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      }
      else
      {
        MouseMove, -%BASE_SPEED_MULTIPLIER%, 0, %BASE_SPEED%, R
      }
    }
  }
  else {
    Send h
  }
  Return
}

$l::
{

  if (canMoveMouse = "true")
  {
    isMovingMouse = true
    While GetKeyState("l", "P")
    {
      if (GetKeyState("j", "P"))
      {
        MouseMove, %BASE_SPEED_MULTIPLIER%, %BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      }
      else if (GetKeyState("k", "P"))
      {
        MouseMove, %BASE_SPEED_MULTIPLIER%, -%BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      }
      else
      {
        MouseMove, %BASE_SPEED_MULTIPLIER%, 0, %BASE_SPEED%, R
      }
    }
  }
  else {
    Send l
  }
  Return
}

; DOWN
$j::
{

  ; if (GetKeyState("d", "P"))
  if (canMoveMouse = "true")
  {
    isMovingMouse = true
    While GetKeyState("j", "P")
    {
      if (GetKeyState("h", "P"))
      {
        MouseMove, -%BASE_SPEED_MULTIPLIER%, %BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      }
      else if (GetKeyState("l", "P"))
      {
        MouseMove, %BASE_SPEED_MULTIPLIER%, %BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      }
      else
      {
        MouseMove, 0, %BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      }
    }
  }
  else
  {
    Send j
  }
  Return
}

; UP
$k::
{
  if (canMoveMouse = "true")
  {
    isMovingMouse = true
    While GetKeyState("k", "P")
    {
      if (GetKeyState("h", "P"))
      {
        MouseMove, -%BASE_SPEED_MULTIPLIER%, -%BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      }
      else if (GetKeyState("l", "P"))
      {
        MouseMove, %BASE_SPEED_MULTIPLIER%, -%BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      }
      else
      {
        MouseMove, 0, -%BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      }
    }
  }
  else
  {
    Send k
  }
  Return
}

$d::
{
  if (A_PriorKey = "f") and (A_TimeSincePriorHotkey < 200) {
    Send {BackSpace}
    canMoveMouse = true
    KeyWait, d, T0.5
    if (ErrorLevel) ; if held for 500ms then start spamming  btn
    {
      if (isMovingMouse = "false")
      {
        canMoveMouse = false
        While GetKeyState("d", "P")
        {
          Send d
          Sleep, 20
        }
      }
    }
  } else {
    Send d
  }
  Return
}



$d Up::
{
  isMovingMouse = false
  canMoveMouse = false
}
