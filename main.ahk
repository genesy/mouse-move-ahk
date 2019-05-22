#MaxHotkeysPerInterval, 10000

BASE_SPEED = 1
BASE_SPEED_MULTIPLIER = 10
isMovingMouse = false

$h::
{
  if (GetKeyState("d", "P"))
  {
    isMovingMouse = true
    While GetKeyState("h", "P")
    {
      MouseMove, -%BASE_SPEED_MULTIPLIER%, 0, %BASE_SPEED%, R
    }
  }
  else {
    Send h
  }
  Return
}

$l::
{

  if (GetKeyState("d", "P"))
  {
    isMovingMouse = true
    While GetKeyState("l", "P")
    {
      MouseMove, %BASE_SPEED_MULTIPLIER%, 0, %BASE_SPEED%, R
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

  if (GetKeyState("d", "P"))
  {
    isMovingMouse = true
    While GetKeyState("j", "P")
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
    Send j
  }
  Return
}

; UP
$k::
{
  if (GetKeyState("d", "P"))
  {
    isMovingMouse = trued
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
  KeyWait, d, T0.2
  if (ErrorLevel)
  {
    if (isMovingMouse = "false")
    {
      While GetKeyState("d", "P")
      {
        Send d
        Sleep, 10
      }
    }
    else
    {
      isMovingMouse = false
    }
  }
  else {
    Send d
  }
  Return
}
