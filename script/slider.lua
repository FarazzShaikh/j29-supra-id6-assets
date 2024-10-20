function calculation(minValue, maxValue, value, numberOfSteps, sliderDirection)
  numberOfSteps = math.max(numberOfSteps, 1)
  value = math.min(math.max(value, minValue), maxValue)
  local leftOffset = 0.0
  local v = 168.0 * (value - minValue)/(maxValue - minValue)
  local blockOffset = 168.0 / numberOfSteps
  local blockSize = { x = math.floor(168.0/numberOfSteps), y=0.0, z=63.0 }

  local activeBlock = 0

  -- local glowVisible = ( v >= 0.0)
  -- if (sliderDirection == 1) then
    -- glowVisible = ( v >= 0.0)
  -- end

  local barInactiveVisible = true
  local boxInactiveLeftVisible = true
  local boxInactiveRightVisible = true
  local barInactiveStartPosX = leftOffset
  local barInactiveEndPosX = leftOffset
  local barInactivePos = { x=leftOffset, y=0.0, z=0.0 }
  local inactiveBarSize = { x=0.0, y=0.0, z=0.0 }
  local inactiveBoxLeftPos = { x=leftOffset, y=0.0, z=0.0 }
  local inactiveBoxRightPos = { x=0.0, y=0.0, z=0.0 }
  local inactiveBoxLeftSize = { x=0.0, y=0.0, z=0.0 }
  local inactiveBoxRightSize = { x=0.0, y=0.0, z=0.0 }
  local cursorPosition = { x=0.0, y=0.0, z=0.0 }
  local inactiveBarGlowPos = { x=0.0, y=0.0, z=0.0 }
  local inactiveBarGlowSize = { x=0.0, y=0.0, z=0.0 }

  activeBlock = math.floor(v/blockOffset) + 1
  if (activeBlock > numberOfSteps) then
    activeBlock = numberOfSteps
  end

  if (numberOfSteps == activeBlock) then
    boxInactiveRightVisible = false
  end

  if (sliderDirection == 0) then
    barInactiveEndPosX = math.floor(leftOffset + activeBlock * blockOffset)
    inactiveBarSize = { x = barInactiveEndPosX-barInactiveStartPosX, y=0.0, z=63.0 }
    cursorPosition = { x = barInactiveEndPosX-19.0, y=0.0, z=0.0 }
    inactiveBarGlowPos = { x = 24.0, y=0.0, z=24.0 }
    inactiveBarGlowSize = { x = barInactiveEndPosX - barInactiveStartPosX - 1.0, y=0.0, z=20.0 }
  else
    local center = math.floor(numberOfSteps / 2);

    if ( value >= (maxValue+minValue)/2.0 ) then
      barInactiveStartPosX = math.floor(leftOffset + center * blockOffset)
      barInactiveEndPosX = math.floor(leftOffset + activeBlock * blockOffset)
      cursorPosition = { x = barInactiveEndPosX-19.0, y=0.0, z=0.0 }
    else -- ( value < (maxValue+minValue)/2.0 )
      barInactiveEndPosX = math.floor(leftOffset + (center+1) * blockOffset)
      if (activeBlock == 0) then
        barInactiveStartPosX = math.floor(leftOffset + (activeBlock) * blockOffset)
      else
        barInactiveStartPosX = math.floor(leftOffset + (activeBlock-1) * blockOffset)
      end
      cursorPosition = { x = barInactiveStartPosX-14.0, y=0.0, z=0.0 }
    end

    if (activeBlock == 1) then
      boxInactiveLeftVisible = false
    end
    if (activeBlock == center + 1) then
      cursorPosition = { x = 91.0, y=0.0, z=0.0 }
    end

    barInactivePos = { x = barInactiveStartPosX, y=0.0, z=0.0 }
    inactiveBarSize = { x = barInactiveEndPosX-barInactiveStartPosX, y=0.0, z=63.0 }
    inactiveBoxLeftSize = { x = barInactiveStartPosX - leftOffset, y=0.0, z=63.0 }
    inactiveBarGlowPos = { x = barInactiveStartPosX, y=0.0, z=24.0 }
    inactiveBarGlowSize = { x = barInactiveEndPosX - barInactiveStartPosX - 1.0, y=0.0, z=20.0 }
  end

  inactiveBoxRightPos = { x = barInactiveEndPosX, y=0.0, z=0.0 }
  inactiveBoxRightSize = { x = leftOffset+168.0-barInactiveEndPosX, y=0.0, z=63.0 }

  if (activeBlock == 0) then
    glowPosition = { x = leftOffset + activeBlock * blockOffset, y=0.0, z=0.0 }
  else
    glowPosition = { x = leftOffset + (activeBlock-1) * blockOffset, y=0.0, z=0.0 }
  end



  return blockSize, barInactivePos, inactiveBarSize, inactiveBoxLeftPos, inactiveBoxRightPos, inactiveBoxLeftSize, inactiveBoxRightSize,
    barInactiveVisible, boxInactiveLeftVisible, boxInactiveRightVisible, cursorPosition, glowPosition, inactiveBarGlowPos, inactiveBarGlowSize--, glowVisible
end




function calculateBlocksVisibility(editMode, numberOfSteps)
  numberOfSteps = math.max(numberOfSteps, 1)
  local block1Visible = editMode
  local block2Visible = editMode and 2 <= numberOfSteps
  local block3Visible = editMode and 3 <= numberOfSteps
  local block4Visible = editMode and 4 <= numberOfSteps
  local block5Visible = editMode and 5 <= numberOfSteps
  local block6Visible = editMode and 6 <= numberOfSteps
  local block7Visible = editMode and 7 <= numberOfSteps
  local block8Visible = editMode and 8 <= numberOfSteps
  local block9Visible = editMode and 9 <= numberOfSteps
  local block10Visible = editMode and 10 <= numberOfSteps
  local block11Visible = editMode and 11 <= numberOfSteps
  local block12Visible = editMode and 12 <= numberOfSteps
  local block13Visible = editMode and 13 <= numberOfSteps
  local block14Visible = editMode and 14 <= numberOfSteps
  local block15Visible = editMode and 15 <= numberOfSteps
  local block16Visible = editMode and 16 <= numberOfSteps
  local block17Visible = editMode and 17 <= numberOfSteps
  local block18Visible = editMode and 18 <= numberOfSteps
  local block19Visible = editMode and 19 <= numberOfSteps
  local block20Visible = editMode and 20 <= numberOfSteps
  local block21Visible = editMode and 21 <= numberOfSteps

  return block1Visible, block2Visible, block3Visible, block4Visible, block5Visible, block6Visible, block7Visible, block8Visible, block9Visible, block10Visible,
      block11Visible, block12Visible, block13Visible, block14Visible, block15Visible, block16Visible, block17Visible, block18Visible, block19Visible, block20Visible, block21Visible
end

function calculateBlocksPositions(numberOfSteps)
  numberOfSteps = math.max(numberOfSteps, 1)
  local blockOffset = 168.0 / numberOfSteps
  local blockPosition1 = { x=0.0, y=0.0, z=0.0 }
  local blockPosition2 = { x=0.0 + 1.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition3 = { x=0.0 + 2.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition4 = { x=0.0 + 3.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition5 = { x=0.0 + 4.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition6 = { x=0.0 + 5.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition7 = { x=0.0 + 6.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition8 = { x=0.0 + 7.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition9 = { x=0.0 + 8.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition10 = { x=0.0 + 9.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition11 = { x=0.0 + 10.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition12 = { x=0.0 + 11.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition13 = { x=0.0 + 12.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition14 = { x=0.0 + 13.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition15 = { x=0.0 + 14.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition16 = { x=0.0 + 15.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition17 = { x=0.0 + 16.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition18 = { x=0.0 + 17.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition19 = { x=0.0 + 18.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition20 = { x=0.0 + 19.0 * blockOffset, y=0.0, z=0.0 }
  local blockPosition21 = { x=0.0 + 20.0 * blockOffset, y=0.0, z=0.0 }

  return blockPosition1, blockPosition2, blockPosition3, blockPosition4, blockPosition5, blockPosition6, blockPosition7, blockPosition8, blockPosition9, blockPosition10,
      blockPosition11, blockPosition12, blockPosition13, blockPosition14, blockPosition15, blockPosition16, blockPosition17, blockPosition18, blockPosition19, blockPosition20, blockPosition21
end


function calculateBlocks(minValue, maxValue, value, numberOfSteps, sliderDirection)
  numberOfSteps = math.max(numberOfSteps, 1)
  local v = 168.0 * (value - minValue)/(maxValue - minValue)
  local blockOffset = 168.0 / numberOfSteps

  local block1Active = false
  local block2Active = false
  local block3Active = false
  local block4Active = false
  local block5Active = false
  local block6Active = false
  local block7Active = false
  local block8Active = false
  local block9Active = false
  local block10Active = false
  local block11Active = false
  local block12Active = false
  local block13Active = false
  local block14Active = false
  local block15Active = false
  local block16Active = false
  local block17Active = false
  local block18Active = false
  local block19Active = false
  local block20Active = false
  local block21Active = false

  if (sliderDirection == 0) then
    block1Active = ( v >= 0.0 )
    block2Active = ( v > 1.0 * blockOffset )
    block3Active = ( v > 2.0 * blockOffset )
    block4Active = ( v > 3.0 * blockOffset )
    block5Active = ( v > 4.0 * blockOffset )
    block6Active = ( v > 5.0 * blockOffset )
    block7Active = ( v > 6.0 * blockOffset )
    block8Active = ( v > 7.0 * blockOffset )
    block9Active = ( v > 8.0 * blockOffset )
    block10Active = ( v > 9.0 * blockOffset )
    block11Active = ( v > 10.0 * blockOffset )
    block12Active = ( v > 11.0 * blockOffset )
    block13Active = ( v > 12.0 * blockOffset )
    block14Active = ( v > 13.0 * blockOffset )
    block15Active = ( v > 14.0 * blockOffset )
    block16Active = ( v > 15.0 * blockOffset )
    block17Active = ( v > 16.0 * blockOffset )
    block18Active = ( v > 17.0 * blockOffset )
    block19Active = ( v > 18.0 * blockOffset )
    block20Active = ( v > 19.0 * blockOffset )
    block21Active = ( v > 20.0 * blockOffset )
  else
    local activeBlock = math.floor(v/blockOffset) + 1
    local centerBlock = math.floor(numberOfSteps/2 + 1)
    block1Active = (1 >= activeBlock)
    block2Active = (2 == centerBlock) or ((2 < centerBlock) and (2 >= activeBlock) or (2 > centerBlock) and (2 <= activeBlock))
    block3Active = (3 == centerBlock) or ((3 < centerBlock) and (3 >= activeBlock) or (3 > centerBlock) and (3 <= activeBlock))
    block4Active = (4 == centerBlock) or ((4 < centerBlock) and (4 >= activeBlock) or (4 > centerBlock) and (4 <= activeBlock))
    block5Active = (5 == centerBlock) or ((5 < centerBlock) and (5 >= activeBlock) or (5 > centerBlock) and (5 <= activeBlock))
    block6Active = (6 == centerBlock) or ((6 < centerBlock) and (6 >= activeBlock) or (6 > centerBlock) and (6 <= activeBlock))
    block7Active = (7 == centerBlock) or ((7 < centerBlock) and (7 >= activeBlock) or (7 > centerBlock) and (7 <= activeBlock))
    block8Active = (8 == centerBlock) or ((8 < centerBlock) and (8 >= activeBlock) or (8 > centerBlock) and (8 <= activeBlock))
    block9Active = (9 == centerBlock) or ((9 < centerBlock) and (9 >= activeBlock) or (9 > centerBlock) and (9 <= activeBlock))
    block10Active = (10 == centerBlock) or ((10 < centerBlock) and (10 >= activeBlock) or (10 > centerBlock) and (10 <= activeBlock))
    block11Active = (11 == centerBlock) or ((11 < centerBlock) and (11 >= activeBlock) or (11 > centerBlock) and (11 <= activeBlock))
    block12Active = (12 == centerBlock) or ((12 < centerBlock) and (12 >= activeBlock) or (12 > centerBlock) and (12 <= activeBlock))
    block13Active = (13 == centerBlock) or ((13 < centerBlock) and (13 >= activeBlock) or (13 > centerBlock) and (13 <= activeBlock))
    block14Active = (14 == centerBlock) or ((14 < centerBlock) and (14 >= activeBlock) or (14 > centerBlock) and (14 <= activeBlock))
    block15Active = (15 == centerBlock) or ((15 < centerBlock) and (15 >= activeBlock) or (15 > centerBlock) and (15 <= activeBlock))
    block16Active = (16 == centerBlock) or ((16 < centerBlock) and (16 >= activeBlock) or (16 > centerBlock) and (16 <= activeBlock))
    block17Active = (17 == centerBlock) or ((17 < centerBlock) and (17 >= activeBlock) or (17 > centerBlock) and (17 <= activeBlock))
    block18Active = (18 == centerBlock) or ((18 < centerBlock) and (18 >= activeBlock) or (18 > centerBlock) and (18 <= activeBlock))
    block19Active = (19 == centerBlock) or ((19 < centerBlock) and (19 >= activeBlock) or (19 > centerBlock) and (19 <= activeBlock))
    block20Active = (20 == centerBlock) or ((20 < centerBlock) and (20 >= activeBlock) or (20 > centerBlock) and (20 <= activeBlock))
    block21Active = (21 == centerBlock) or ((21 < centerBlock) and (21 >= activeBlock) or (21 > centerBlock) and (21 <= activeBlock))
  end

  return block1Active, block2Active, block3Active, block4Active, block5Active, block6Active, block7Active, block8Active, block9Active, block10Active,
  block11Active, block12Active, block13Active, block14Active, block15Active, block16Active, block17Active, block18Active, block19Active, block20Active, block21Active
end





-- returns true, if slider edit mode (selected state) should be toggled (on controller release)
function sliderControllerInputFunction( keyCode, pressed, pressedPrev, param )
    local result = (keyCode == KeyCodes.KEY_PRESS and pressedPrev and not pressed)

    return result
end

-- returns true, if slider should change its value (controller rotate, and active edit mode)
function sliderControllerInputChangeValueFunction( keyCode, pressed, pressedPrev, param, editMode )

    if not editMode then
        return false, false
    end

    local increase = (keyCode == KeyCodes.KEY_RIGHT)
    local decrease = (keyCode == KeyCodes.KEY_LEFT)

    return increase, decrease

end

-- return new slider value by absolute touch coordinates
function sliderTouchInputSetValueFunction( posX, minValue, maxValue )
    -- map [minValue,maxValue] to [newMin,newMax] with some slack at the interval boundaries
    local delta = 28.0 * (maxValue - minValue) / 144.0
    local newMin = minValue - delta
    local newMax = maxValue + delta
    -- touch position range is in [-1,1]; map to [newMin,newMax] with some slack at the interval boundaries
    local v = newMin + ((posX + 1.0)/2.0) * (newMax - newMin)
    if v < minValue then
        return minValue
    elseif v > maxValue then
        return maxValue
    end

    return v

end

-- return min or max slider value depending on x offset direction
function sliderTouchInputSetMinMaxValueFunction( offsetX, minValue, maxValue )

    if offsetX < 0 then
        return minValue
    else
        return maxValue
    end

end
-- return slider value change by relative touch coordinate change
function sliderTouchInputChangeValueFunction( dragOffsetX, minValue, maxValue )

    -- map [minValue,maxValue] to [newMin,newMax] with some slack at the interval boundaries
    local delta = 28.0 * (maxValue - minValue) / 144.0
    local newMin = minValue - delta
    local newMax = maxValue + delta

    -- touch position offset range is in [-2,2]; map the maximum offset (2) to newMax - newMin to get a value range offset
    -- the sensitivity of the value change can be adjusted by the dragOffsetX factor
    local v = (2.0 * dragOffsetX) / 2.0 * (newMax - newMin)

    return v

end

-- returns startEdit, endEdit flags; this is more robust than a "toggle" flag
-- (accidentally starting edit mode twice shouldn't turn it off)
function sliderTouchInputToggleEditFunction( down, event )

    local startEdit = (event == ETouchEvent.Start) and down
    local endEdit = (event == ETouchEvent.End) and not down

    return startEdit, endEdit
end

function j29_calculateDivPositions( numberOfSteps )
  numberOfSteps = math.max(numberOfSteps, 2)
  numberOfSteps = math.min(numberOfSteps, 21)
  local divOffset = 196.0 / numberOfSteps
  local DivPosition1 = { x= -2.0 + 1.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition2 = { x= -2.0 + 2.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition3 = { x= -2.0 + 3.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition4 = { x= -2.0 + 4.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition5 = { x= -2.0 + 5.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition6 = { x= -2.0 + 6.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition7 = { x= -2.0 + 7.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition8 = { x= -2.0 + 8.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition9 = { x= -2.0 + 9.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition10 = { x= -2.0 + 10.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition11 = { x= -2.0 + 11.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition12 = { x= -2.0 + 12.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition13 = { x= -2.0 + 13.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition14 = { x= -2.0 + 14.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition15 = { x= -2.0 + 15.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition16 = { x= -2.0 + 16.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition17 = { x= -2.0 + 17.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition18 = { x= -2.0 + 18.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition19 = { x= -2.0 + 19.0 * divOffset, y=0.0, z=0.0 }
  local DivPosition20 = { x= -2.0 + 20.0 * divOffset, y=0.0, z=0.0 }

  return DivPosition1, DivPosition2, DivPosition3, DivPosition4, DivPosition5, DivPosition6, DivPosition7, DivPosition8, DivPosition9, DivPosition10,
      DivPosition11, DivPosition12, DivPosition13, DivPosition14, DivPosition15, DivPosition16, DivPosition17, DivPosition18, DivPosition19, DivPosition20
end

function j29_calculateDivVisible( numberOfSteps, editMode )
  numberOfSteps = math.max(numberOfSteps, 1)
  numberOfSteps = math.min(numberOfSteps, 21)
  local DivVisible1 = (numberOfSteps >= 2) and editMode
  local DivVisible2 = (numberOfSteps >= 3) and editMode
  local DivVisible3 = (numberOfSteps >= 4) and editMode
  local DivVisible4 = (numberOfSteps >= 5) and editMode
  local DivVisible5 = (numberOfSteps >= 6) and editMode
  local DivVisible6 = (numberOfSteps >= 7) and editMode
  local DivVisible7 = (numberOfSteps >= 8) and editMode
  local DivVisible8 = (numberOfSteps >= 9) and editMode
  local DivVisible9 = (numberOfSteps >= 10) and editMode
  local DivVisible10 = (numberOfSteps >= 11) and editMode
  local DivVisible11 = (numberOfSteps >= 12) and editMode
  local DivVisible12 = (numberOfSteps >= 13) and editMode
  local DivVisible13 = (numberOfSteps >= 14) and editMode
  local DivVisible14 = (numberOfSteps >= 15) and editMode
  local DivVisible15 = (numberOfSteps >= 16) and editMode
  local DivVisible16 = (numberOfSteps >= 17) and editMode
  local DivVisible17 = (numberOfSteps >= 18) and editMode
  local DivVisible18 = (numberOfSteps >= 19) and editMode
  local DivVisible19 = (numberOfSteps >= 20) and editMode
  local DivVisible20 = (numberOfSteps >= 21) and editMode

  return DivVisible1, DivVisible2, DivVisible3, DivVisible4,
      DivVisible5, DivVisible6, DivVisible7, DivVisible8,
      DivVisible9, DivVisible10, DivVisible11, DivVisible12,
      DivVisible13, DivVisible14, DivVisible15, DivVisible16,
      DivVisible17, DivVisible18, DivVisible19, DivVisible20
end

function j29_calculateStackPosition( numberOfSteps, minValue, maxValue, value, isCenter )
  if minValue >= maxValue then
    return
  end
  value = math.max(minValue, value)
  value = math.min(maxValue, value)

  numberOfSteps = math.max(numberOfSteps, 1)
  numberOfSteps = math.min(numberOfSteps, 21)


  maxValue = maxValue - minValue
  value = value - minValue
  minValue = minValue - minValue

  local rate = numberOfSteps / maxValue
  maxValue = maxValue * rate
  value = value * rate
  middleValue = (minValue + maxValue) / 2.0
  local beginValue = math.min(value, middleValue)
  local endValue = math.max(value, middleValue)

  local beginBlock = 1
  local endBlock = 21
  local isBeginNotSet = true

  if isCenter == 1 then
    for idx=1,21,1
    do
      if (idx - 0.5) >= beginValue and isBeginNotSet then
        beginBlock = idx
        isBeginNotSet = false
      end
      if (idx - 0.5) > endValue then
        endBlock = idx - 1
        break
      end
    end
  else
    endBlock = getIntPart(value + 1)
  end

  local StackPosition = { x= (beginBlock - 1.0) * (196.0 / numberOfSteps ), y=0.0, z=-20.0 }
  local StackSize = { x= math.max((endBlock - beginBlock + 1.0) * (200.0 / numberOfSteps ) + 2.0, 12.0), y=0.0, z=27.0 }
  if (StackSize.x + StackPosition.x) > 200 then
    StackSize.x = 200 - StackPosition.x
  end
  print("position", StackPosition.x)
  print("size", StackSize.x)
  return StackPosition, StackSize
end

function j29_calculatePowerValue( power, maxPowerText )
  local currentPower = tonumber(maxPowerText) * power
  return tostring(getIntPart(currentPower))
end

function getIntPart(x)
  if x <= 0 then
    return math.ceil(x)
  end

  if math.ceil(x) == x then
    x = math.ceil(x)
  else
    x = math.ceil(x) - 1
  end

  return x
end
