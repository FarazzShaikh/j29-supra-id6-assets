
--[[
 Camera Positions:
 =================
 history
 present
 future
 streamLine
 streamLineID5pp
 frontLeft
 FrontLeftSafe
 FrontRightSafe
 rearLeft
 rearRight
 RearRightSafe
 IBAFrontLeft
 IBAFrontRight
 IBARearLeft
 IBARearRight
 topView
 PMATopView
 RearView
 PMARearView
 tailGate
 TireCloseup
 TirePressure
 FES
 CCM
 CCMSafe
 CCMCenter
 QuickAccess
 QuickAccessID5pp
 SarahPeople
 SarahAdvancing
 SarahLaneLeaving
 SarahLaneChanging
 SarahOpposingTraffic
 SarahSideCollision
 SarahAllOn
 Charging
 XDrive
 ChargeInduction
 custom
 
 Supported values for eParam_CameraPositionSplit:
 present
 future
 topView
 CCM
 FES
 XDrive
--]]

if CameraAnimation == nil then
  CameraAnimation = {}
end

function CameraAnimation:init()
  if self.initialized then
    return
  end

  local parking             = {delay = 100, duration = 1, vehicle_fadeout_animation=true,  vehicle_fadeout_delay= 50, vehicle_fadeout_duration= 50, vehicle_fadein_animation=true,  vehicle_fadein_delay=400, vehicle_fadein_duration=200}
  local toStreamLine        = {delay = 400, duration = 1, vehicle_fadeout_animation=true,  vehicle_fadeout_delay=200, vehicle_fadeout_duration=200, vehicle_fadein_animation=false, vehicle_fadein_delay=200, vehicle_fadein_duration=100}
  local fromStreamLine      = {delay = 200, duration = 1, vehicle_fadeout_animation=false, vehicle_fadeout_delay=150, vehicle_fadeout_duration= 50, vehicle_fadein_animation=true,  vehicle_fadein_delay=400, vehicle_fadein_duration=400}
  local splitToStreamLine   = {delay = 200, duration = 1, vehicle_fadeout_animation=true,  vehicle_fadeout_delay=  1, vehicle_fadeout_duration=  1, vehicle_fadein_animation=false, vehicle_fadein_delay=400, vehicle_fadein_duration=400}
  local splitFromStreamLine = {delay = 200, duration = 1, vehicle_fadeout_animation=false, vehicle_fadeout_delay=150, vehicle_fadeout_duration= 50, vehicle_fadein_animation=true,  vehicle_fadein_delay=400, vehicle_fadein_duration=400}
  -- streamLine
  self:addEntry({"streamLine", "streamLineID5pp"}, "ANY", toStreamLine)
  self:addEntry("ANY", {"streamLine", "streamLineID5pp"}, fromStreamLine)
  self:addEntry({"streamLine", "streamLineID5pp"}, "SPLIT_ANY", splitToStreamLine)
  self:addEntry("SPLIT_ANY", {"streamLine", "streamLineID5pp"}, splitFromStreamLine)
  -- parking and tire pressure
  self:addEntry({"topView", "PMATopView", "RearView", "PMARearView", "TirePressure"}, {"ANY", "SPLIT_ANY", "streamLine", "streamLineID5pp"}, parking)
  self:addEntry({"ANY", "SPLIT_ANY", "streamLine", "streamLineID5pp"}, {"topView", "PMATopView", "RearView", "PMARearView", "TirePressure"}, parking)
  self:addEntry({"topView", "PMATopView", "RearView", "PMARearView", "ChargeInduction"}, {"topView", "PMATopView", "RearView", "PMARearView", "ChargeInduction"}, {delay = 1, duration = 100})
  -- restore default behaviour for TireCloseup <=> TirePressure
  self:addEntry({"TirePressure", "TireCloseup"}, {"TirePressure", "TireCloseup"}, {})
  -- splitscreen
  self:addEntry("SPLIT_ANY", "ANY",        {delay = 400, duration = 1, vehicle_fadeout_animation=true, vehicle_fadeout_delay=100, vehicle_fadeout_duration=100, vehicle_fadein_animation=true, vehicle_fadein_delay=600, vehicle_fadein_duration=200})
  self:addEntry("ANY", "SPLIT_ANY",        {delay = 200, duration = 1, vehicle_fadeout_animation=true, vehicle_fadeout_delay=100, vehicle_fadeout_duration=  1, vehicle_fadein_animation=true, vehicle_fadein_delay=600, vehicle_fadein_duration=200})
  self:addEntry("SPLIT_ANY", "SPLIT_ANY",  {delay =   1, duration = 1, vehicle_fadeout_animation=true, vehicle_fadeout_delay=  1, vehicle_fadeout_duration=100, vehicle_fadein_animation=true, vehicle_fadein_delay=  1, vehicle_fadein_duration=100})
  
  self.initialized = true
end
