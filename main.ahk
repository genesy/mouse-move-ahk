#KeyHistory
#MaxHotkeysPerInterval, 10000

DEFAULT_SPEED = 1
DEFAULT_SPEED_MULTIPLIER = 10

BASE_SPEED = 1
BASE_SPEED_MULTIPLIER = 10

isMovingMouse = false
canMoveMouse = false

; speed multiplier
$s::
{
  if (canMoveMouse = "true")
  {
    BASE_SPEED = 0.3
    BASE_SPEED_MULTIPLIER = 40
  }
  else
  {
    Send s
  }
  Return
}

$s Up::
{
  BASE_SPEED = %DEFAULT_SPEED%
  BASE_SPEED_MULTIPLIER = %DEFAULT_SPEED_MULTIPLIER%
  Return
}

$x::
{
  if (canMoveMouse = "true") {

  }
  else
  {
    Send x
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
      else if (GetKeyState("x", "P"))
      {
        Click, WheelDown
        Sleep, 50
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
  if (canMoveMouse = "true") {
    isMovingMouse = true
    While GetKeyState("k", "P") {
      if (GetKeyState("h", "P")) { ; also move cursor left
        MouseMove, -%BASE_SPEED_MULTIPLIER%, -%BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      } else if (GetKeyState("l", "P")) { ; also move cursor right
        MouseMove, %BASE_SPEED_MULTIPLIER%, -%BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      } else if (GetKeyState("x", "P")) { ; mousewheel
        Click, WheelUp
        Sleep, 50
      } else { ; move cursor up
        MouseMove, 0, -%BASE_SPEED_MULTIPLIER%, %BASE_SPEED%, R
      }
    }
  } else {
    Send k
  }
  Return
}

$d::
{
  if (A_PriorKey = "k") and (A_TimeSincePriorHotkey < 80) {
    Send {BackSpace}
    canMoveMouse = true
    KeyWait, d
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
