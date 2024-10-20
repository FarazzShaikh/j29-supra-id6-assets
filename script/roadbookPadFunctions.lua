--[[
opacity: opacity of the whole widget
opacityGS3: opacity of GS.3 (highguiding) elements
return:
resultGS12: opacity of GS.1 (double maneuver) and GS.2 (current maneuver) elements
--]]
function roadbookPadOpacity(opacity, opacityGS3)
    return (1.0 - opacityGS3) * opacity
end

--[[
opacity: opacity of the whole widget
opacityGS3: opacity of GS.3 and greater elements (highguiding view)
return:
layerEnabled: indicates wether the layer should be enabed or not (depending of the widget and GS is visible)
--]]
function roadbookPadGS3LayerEnabled(opacity, opacityGS3, guidingStep)
    -- also use guidingStep, to ensure the layer is immediately disabled when the GS changes (opacity is animated)
    -- this will probably not look nice, but might be required??
    -- [TODO] clarify this!
    return guidingStep >= 3 and opacity > 0.0 and opacityGS3 > 0.0
end

--[[
numberOfLanes: number of available lanes
currentLaneIndex: the index of the current lane
return:
visibility of the current lane
position of the current lane relative to the right border
position of the current lane separator relative to the right border
position of the current lane sector relative to the right border
--]]
function padLabelLaneProperties(numberOfLanes, currentLaneIndex, positionOffset)
    local pos = -46.0 * ( numberOfLanes - currentLaneIndex )
    local separatorPos = pos - 4.0
    positionOffset.x = positionOffset.x + pos
    local visibility = 0.0

    if numberOfLanes >= currentLaneIndex and numberOfLanes ~= 0 then
        visibility = 1.0
    end

    return visibility, positionOffset, { x=separatorPos, y=0.0, z=0.0 }, { x=pos, y=0.0, z=11.0 }
end

--[[
laneCount: number of visible lanes
offset: x offset
return:
position of the pad lane guiding panel
--]]
function roadbookPadLanePosition(laneCount, offset, basePosition)
    local width = 4.0 + laneCount * ( 42.0 + 4.0 )
    local width = width * 0.5 + offset
    local height = -6.0
    return { x=basePosition.x + width, y=basePosition.y, z=basePosition.z + height }
end

--[[
backgroundSize: size of the high-guiding image
return:
offset to center the image
--]]
function roadbookPadLaneHighGuidingOffset(backgroundSize)
    local offsetX = (378.0 - backgroundSize.x ) * 0.5
    local offsetZ = (369.0 - backgroundSize.z ) * 0.5

    return { x=offsetX, y=0.0, z=offsetZ }
end
