
CalendarEntryPositions = {
  { 0, 500, 500, 500 },
  { 0, 156, 500, 500 },
  { 0, 103, 206, 500 },
  { 0, 77, 154, 231 },
}

function getCalendarEntryValues( Start, Stop, TimeStart, TimeRange, Colspan, Column )

  local length = Stop - Start
  
  if length < 30 then
    length = 30 --min length for now
  end
  
  length = length / 60.0
  
  local SizeZ = length * 75 - 31

  local timeDiff = Start - TimeStart
  timeDiff = timeDiff / 60.0
  
  local PosZ = 145 - (timeDiff * 75.0) -- 160 (2 hours) + 10px as documented for this asset by sgx
  
  --print("+++> PosZ " .. tostring(PosZ))
  
  local PosX = CalendarEntryPositions[Colspan][Column] + 15 -- 15px as documented for this asset by sgx
  local Concurrent = Colspan
  
  return SizeZ, PosZ, PosX, Concurrent
end

function getCalendarMarkerValues( TimeStart, Position )

  local timeDiff = Position - TimeStart
  timeDiff = timeDiff / 60
  local position = timeDiff * 80
      
  return 430.0 - position -- happy magic numbers
  
end