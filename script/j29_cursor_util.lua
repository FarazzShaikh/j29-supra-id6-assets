-- Cursor Type
eCursorType_Invalid = 0
eCursorType_List = 1
eCursorType_Speller = 2
eCursorType_Speller_Extended = 3
eCursorType_MainMenu = 4
eCursorType_Store = 5
eCursorType_Speller_Matrix = 6
eCursorType_Speller_Frequency = 7
eCursorType_Functionlist = 8
eCursorType_Functionlist_Extended = 9
eCursorType_QuickAccess = 10
eCursorType_Reading = 11
eCursorType_Reading_Extended = 12
eCursorType_Pie = 13
eCursorType_InteractiveMap = 14
eCursorType_List_NoGlow = 15
eCursorType_Splitscreen = 16
eCursorType_Speller_Slider = 17
eCursorType_Popup = 18
eCursorType_AZList = 19

-- Controller Type
eControllerType_Invalid = 0
eControllerType_Standard = 1
eControllerType_Player = 2
eControllerType_MainMenu = 3
eControllerType_Speller = 4
eControllerType_Mapscale = 5
eControllerType_Splitscreen = 6
eControllerType_SplitConfig = 7
eControllerType_QuickAccess = 8
eControllerType_PieMenu = 9
eControllerType_PreviewMap = 10
eControllerType_Speller_Frequency = 11
eControllerType_Popup = 12
eControllerType_IBA = 13
eControllerType_Speller_Matrix = 14
eControllerType_Speller_BatteryCharge = 15

eCursorDraw_Default = 0.0
eCursorDraw_List_Curve = 1.0
eCursorDraw_List_Line = 2.0
eCursorDraw_List_Simple = 3.0
eCursorDraw_List_SpellerSelection = 4.0
eCursorDraw_Functionlist = 5.0
eCursorDraw_Functionlist_Extended = 6.0
eCursorDraw_Main = 7.0
eCursorDraw_Speller_Round = 8.0
eCursorDraw_Speller_Frequency = 9.0
eCursorDraw_Reading = 10.0
eCursorDraw_Reading_Extended = 11.0
eCursorDraw_QuickAccess = 12.0

function J29_calculateCursorAssembleAnimation(isBG, sizeX, type)
	local delayTime = 0
	local duration = 500
	if isBG then
		delayTime = 300
		duration = 300
	else
		if type == eCursorType_List then
			duration = 200 + ( sizeX * 300 ) / 653
			delayTime = 0
		elseif type == eCursorType_Functionlist then
			duration = 200
			delayTime = 0
		elseif type == eCursorType_Functionlist_Extended then
			duration = 200
			delayTime = 0
		end
	end
	duration = 500
	return delayTime, duration
end

function J29_calculteCursorType (eParam_CursorType, eParam_ControllerType, eParam_LinkVisibility, J29_Curve_Mode, Cursor_Size_X)
	local CursorTypeEnum = eCursorDraw_Default

	if eParam_CursorType == eCursorType_List or eParam_CursorType == eCursorType_List_NoGlow then
		if eParam_ControllerType == eControllerType_Speller then
			CursorTypeEnum = eCursorDraw_List_SpellerSelection
		elseif eParam_ControllerType == eControllerType_Popup then
			if eParam_LinkVisibility == 1.0 then
				CursorTypeEnum = eCursorDraw_List_Simple
			else
				CursorTypeEnum = eCursorDraw_Default
			end
		elseif eParam_ControllerType == eControllerType_PieMenu then
			CursorTypeEnum = eCursorDraw_List_Simple
		elseif eParam_LinkVisibility == 1.0 then
			if J29_Curve_Mode == 0.0 then
				if Cursor_Size_X > 650.0 or Cursor_Size_X < 20.0 then
					CursorTypeEnum = eCursorDraw_List_Simple
				else
					CursorTypeEnum = eCursorDraw_List_Curve
				end
			elseif J29_Curve_Mode == 1.0 then
				if Cursor_Size_X > 650.0 or Cursor_Size_X < 20.0 then
					CursorTypeEnum = eCursorDraw_List_Simple
				else
					CursorTypeEnum = eCursorDraw_List_Line
				end
			elseif J29_Curve_Mode == 2.0 then
				CursorTypeEnum = eCursorDraw_List_Simple
			end
		else
			CursorTypeEnum = eCursorDraw_Default
		end
	elseif eParam_CursorType == eCursorType_Functionlist then
		CursorTypeEnum = eCursorDraw_Functionlist
	elseif eParam_CursorType == eCursorType_Functionlist_Extended then
		CursorTypeEnum = eCursorDraw_Functionlist_Extended
	elseif eParam_CursorType == eCursorType_MainMenu then
		CursorTypeEnum = eCursorDraw_Main
	elseif eParam_CursorType == eCursorType_Popup then
		if eParam_LinkVisibility == 1.0 then
			CursorTypeEnum = eCursorDraw_List_Simple
		else
			CursorTypeEnum = eCursorDraw_Default
		end
	elseif eParam_CursorType == eCursorType_Speller then
		CursorTypeEnum = eCursorDraw_Speller_Round
	elseif eParam_CursorType == eCursorType_Pie then
		CursorTypeEnum = eCursorDraw_List_Simple
	elseif eParam_CursorType == eCursorType_Reading then
		CursorTypeEnum = eCursorDraw_Reading
	elseif eParam_CursorType == eCursorType_Reading_Extended then
		CursorTypeEnum = eCursorDraw_Reading_Extended
	elseif eParam_CursorType == eCursorType_Speller_Frequency then
		CursorTypeEnum = eCursorDraw_Speller_Frequency
	elseif eParam_CursorType == eCursorType_QuickAccess then
		CursorTypeEnum = eCursorDraw_QuickAccess
	end


	return CursorTypeEnum
end

function J29_calculateCursor1Rect (CursorTypeEnum, Cursor_Position_X, Cursor_Position_Z, Cursor_Size_X, Cursor_Size_Z, CursorLinkPosition)
	local CursorPosX = Cursor_Position_X
	local CursorPosZ = Cursor_Position_Z
	local CursorSizeX = Cursor_Size_X
	local CursorSizeZ = Cursor_Size_Z

	if CursorTypeEnum == eCursorDraw_Default then
		CursorPosX = Cursor_Position_X
		CursorPosZ = Cursor_Position_Z - 7.0
		CursorSizeX = Cursor_Size_X + 62.0
		CursorSizeZ = Cursor_Size_Z - 3.0
	elseif CursorTypeEnum == eCursorDraw_List_Curve then
		CursorPosX = Cursor_Position_X - 45.0
		CursorPosZ = Cursor_Position_Z - 7.0
		CursorSizeX = Cursor_Size_X + 78.0
		CursorSizeZ = Cursor_Size_Z
	elseif CursorTypeEnum == eCursorDraw_List_Line then
		CursorPosX = Cursor_Position_X
		CursorPosZ = Cursor_Position_Z -7.0
		CursorSizeX = Cursor_Size_X + 78.0
		CursorSizeZ = Cursor_Size_Z
	elseif CursorTypeEnum == eCursorDraw_List_Simple then
		CursorPosX = Cursor_Position_X
		CursorPosZ = Cursor_Position_Z - 7.0
		CursorSizeX = Cursor_Size_X + 33.0
		CursorSizeZ = Cursor_Size_Z
	elseif CursorTypeEnum == eCursorDraw_List_SpellerSelection then
		CursorPosX = Cursor_Position_X + 3.0
		CursorPosZ = Cursor_Position_Z + 224.0
		CursorSizeX = Cursor_Size_X
		CursorSizeZ = Cursor_Size_Z
	elseif CursorTypeEnum == eCursorDraw_Functionlist then
		CursorPosX = Cursor_Position_X + 17.0
		CursorPosZ = Cursor_Position_Z - 7.0
		CursorSizeX = Cursor_Size_X + 20.0
		CursorSizeZ = Cursor_Size_Z
	elseif CursorTypeEnum == eCursorDraw_Functionlist_Extended then
		CursorPosX = Cursor_Position_X + 17.0
		CursorPosZ = Cursor_Position_Z - 7.0
		CursorSizeX = Cursor_Size_X - 62.0
		CursorSizeZ = Cursor_Size_Z
	elseif CursorTypeEnum == eCursorDraw_Main then
		CursorPosX = Cursor_Position_X + 189.0
		CursorPosZ = Cursor_Position_Z - 153.0
		CursorSizeX = Cursor_Size_X
		CursorSizeZ = Cursor_Size_Z
	elseif CursorTypeEnum == eCursorDraw_Speller_Round then
		CursorPosX = 0.0
		CursorPosZ = 0.0
		CursorSizeX = Cursor_Size_X
		CursorSizeZ = Cursor_Size_Z
	elseif CursorTypeEnum == eCursorDraw_Speller_Frequency then
		CursorPosX = 0.0
		CursorPosZ = 0.0
		CursorSizeX = Cursor_Size_X
		CursorSizeZ = Cursor_Size_Z
	elseif CursorTypeEnum == eCursorDraw_Reading then
		CursorPosX = Cursor_Position_X - 13.0
		CursorPosZ = Cursor_Position_Z + 24.0
		CursorSizeX = Cursor_Size_X
		CursorSizeZ = Cursor_Size_Z + 6.0
	elseif CursorTypeEnum == eCursorDraw_Reading_Extended then
		CursorPosX = Cursor_Position_X + 12.0
		CursorPosZ = Cursor_Position_Z
		CursorSizeX = Cursor_Size_X + 41.0
		CursorSizeZ = Cursor_Size_Z + 55.0
	elseif CursorTypeEnum == eCursorDraw_QuickAccess then
		CursorPosX = Cursor_Position_X
		CursorPosZ = Cursor_Position_Z - 15.0
		CursorSizeX = Cursor_Size_X + 62.0
		CursorSizeZ = Cursor_Size_Z + 8.0
	end

	return CursorPosX, CursorPosZ, CursorSizeX, CursorSizeZ
end
