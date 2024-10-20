function calculateBalanceFadingPointPosition(XMinValue, YMinValue, XMaxValue, YMaxValue, XValue, YValue)
  local vX = 308.0 * (XValue - XMinValue)/(XMaxValue - XMinValue)
  local vY = 298.0 * (YValue - YMinValue)/(YMaxValue - YMinValue)
  local pointPosition = { x=vX+76.0+20.0, y=0.0, z=vY+54.0+12.0 }
  
  return pointPosition
end

function sliderBalanceFadingTouchInputSetValueFunction( posX, posY, minValueX, maxValueX, minValueY, maxValueY)
  local xBoundaryLeft   = -0.6044
  local xBoundaryRight  =  0.4963
  local yBoundaryBottom = -0.6046
  local yBoundaryTop    =  0.5933

  -- map [xBoundaryLeft, xBoundaryRight] to [-1,1]
  local xValue = (2.0 * (posX - 20.0 * 2.0 / 308.0 - xBoundaryLeft)) / (xBoundaryRight - xBoundaryLeft) - 1.0;
  
  -- map [yBoundaryBottom, yBoundaryTop] to [-1,1]
  local yValue = (2.0 * (posY - 12.0 * 2.0 / 298.0 - yBoundaryBottom)) / (yBoundaryTop - yBoundaryBottom) - 1.0;
    
  -- touch position range is in [-1,1]; map to [minValue,maxValue]
  local vX = (minValueX + (xValue + 1.0) / 2.0 * (maxValueX - minValueX)) + 0.5
  local vY = (minValueY + (yValue + 1.0) / 2.0 * (maxValueY - minValueY)) + 0.5
  
    if vX < minValueX then
        vX = minValueX
    elseif vX > maxValueX then
        vX = maxValueX
    end
    
    if vY < minValueY then
        vY = minValueY
    elseif vY > maxValueY then
        vY = maxValueY
    end
    
    return vX, vY
end


