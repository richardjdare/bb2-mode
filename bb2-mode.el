;;; bb2-mode.el
;;; Emacs major mode for ascii Blitz Basic II source code
;;; Richard Dare
;;; www.richardjdare.com

(require 'cl-lib)

(defvar bb2-keywords nil "Blitz Basic II language keywords")
(setq bb2-keywords
      '("ACos" "ADDValue" "AGABlue" "AGAFillPalette" "AGAGreen" 
	"AGAPalBlue" "AGAPalGreen" "AGAPalRGB" "AGAPalRed" "AGARGB" 
	"AGARed" "ALibJsr" "AMIGA" "ASLFileRequest" "ASLFileRequest$" 
	"ASLFontRequest" "ASLPathRequest$" "ASLScreenRequest" "ASLScreenRequest$" "ASin" 
	"ASyncFade" "ATan" "AbleICR_a" "AbleICR_b" "Abs" 
	"AbsMouse" "Activate" "ActivateSelectedBox" "ActivateString" "ActiveScreen" 
	"ActiveWindow" "AddAppIcon" "AddAppMenu" "AddAppWindow" "AddBox" 
	"AddFirst" "AddICRVector_a" "AddICRVector_b" "AddIDCMP" "AddItem" 
	"AddLast" "Addr" "AdjustChunky" "AllFire" "AllocFill" 
	"AllocMem" "AnalyzeDisk" "AnimLoop" "AppEvent" "AppEventID" 
	"AppEventType" "AppFile" "AppIconEvent" "AppIconFile" "AppIconHit" 
	"AppLock" "AppMenuEvent" "AppMenuFile" "AppMenuHit" "AppMessage" 
	"AppNumFiles" "AppWindowEvent" "AppWindowFile" "Asc" "AsmExit" 
	"Assign" "Assign$" "AttachGTList" "AutoCookie" "Avg" 
	"Avg.l" "Avg.q" "BBlit" "BBlitMode" "BLITZ" 
	"BLibJsr" "BLoad" "BSave" "Bank" "BankLoc" 
	"BankSize" "BeepScreen" "Bin#" "Bin$" "BitMap" 
	"BitMapInput" "BitMapOrigin" "BitMapOutput" "BitMapPoly" "BitMapToWindow" 
	"BitMapWindow" "BitMaptoWindow" "BitPlanesBitMap" "Blit" "BlitColl" 
	"BlitMode" "BlitterDone" "BlitterNasty" "BlitzEvent" "BlitzFont" 
	"BlitzKey" "BlitzKeys" "BlitzQualifier" "BlitzRepeat" "Block" 
	"BlockScroll" "Blue" "BootProg" "BorderPens" "Borders" 
	"Box" "BoxPrint" "BoxPropX" "BoxPropY" "BoxSelected" 
	"BoxShow" "BoxString" "BoxValue" "Boxf" "Buffer" 
	"ButtonGroup" "ButtonId" "CDDoor" "CDFastForward" "CDFirstTrack" 
	"CDFlush" "CDLastTrack" "CDNormalSpeed" "CDNumTracks" "CDPause" 
	"CDPlayTrack" "CDReadTOC" "CDRewind" "CDSpeed" "CDStatus" 
	"CDStop" "CDTrackLength" "CDTrackMins" "CDTrackPlaying" "CDTrackSecs" 
	"CDUpdateInfo" "CDVolume" "CELSE" "CEND" "CERR" 
	"CHDir" "CMPMEM" "CNIF" "CPUCls" "CPlot" 
	"CPoint" "CSIF" "CacheOff" "CachePCF" "CachesOff" 
	"CachesOn" "Call" "Case" "CaseSense" "CatchDosErrs" 
	"Centre$" "ChDir" "ChangeBox" "ChangeDir" "ChangeTrackerMask" 
	"ChangeTrackerVBlank" "CharCount" "CheckAGA" "CheckPrt" "CheckTrackerEvent" 
	"CheckTrackerID" "Checksum" "ChipFree" "Chr$" "ChunkHeader" 
	"ChunkyCLS" "ChunkyConvert" "ChunkyLoc" "ChunkyPlot" "ChunkyPoly" 
	"ChunkyToBitMap" "ChunkyToPlanar" "ChunkyVlin" "Cipher$" "Circle" 
	"Circlef" "ClearBitmap" "ClearList" "ClearRexxMsg" "ClearString" 
	"ClearToolTypes" "ClickButton" "ClickMouse" "ClipBlit" "ClipBlitMode" 
	"CloseCD" "CloseConsole" "CloseDisk" "CloseEd" "CloseFile" 
	"CloseScreen" "CloseSerial" "CloseWindow" "ClrErr" "ClrInt" 
	"Cls" "CludgeBitMap" "CludgeShapes" "CludgeSound" "Col8" 
	"ColSplit" "ColorChunky" "Colour" "ColourRequest" "CommoditiesBase" 
	"CommodityEvent" "ComparePaths" "Con_Base" "CookieMode" "CopLen" 
	"CopLoc" "CopperAGACol" "CopperCommand" "CopperEnd" "CopperInfoBlock" 
	"CopperMove" "CopperReset" "CopperSkip" "CopperWait" "CopyBitMap" 
	"CopyByte" "CopyChunky" "CopyColour" "CopyFile" "CopyLong" 
	"CopyShape" "CopyWord" "Cos" "CrMDecrunch" "CreateArgString" 
	"CreateDisplay" "CreateMsgPort" "CreateRexxMsg" "CurrentDir$" "CursX" 
	"CursY" "Cursor" "CustomChunky" "CustomChunkySize" "CustomColors" 
	"CustomCop" "CustomSprites" "CustomString" "Cvi" "Cvl" 
	"Cvq" "CxAppear" "CxChangeList" "CxDisAppear" "CxDisable" 
	"CxEnable" "CxKill" "CxListChange" "CxUnique" "Cycle" 
	"CyclePalette" "DBCasesense" "DBInit" "DBLoad" "DBSave" 
	"DBactive" "DBadd" "DBaddFirst" "DBaddLast" "DBcurrent" 
	"DBdelete" "DBfind" "DBfindnext" "DBfirst" "DBget" 
	"DBisnext" "DBisprev" "DBkill" "DBlast" "DBlistaddr" 
	"DBmemtype" "DBmodified" "DBnext" "DBpop" "DBprev" 
	"DBpush" "DBrecs" "DBsetkey" "DBsetpos" "DBupdate" 
	"DCB" "DEFTYPE" "D_CheckNMove" "D_CheckNMoveA" "D_CheckNMoveWord" 
	"D_FindStringPtr" "D_FindVolume" "D_GetSR" "D_HexWord" "Data" 
	"Data$" "Date$" "DateFormat" "Days" "Dc" 
	"Dcb" "DeIce" "DeSelectBox" "DecodeILBM" "DecodeMedModule" 
	"DecodeModule" "DecodePalette" "DecodeShapes" "DecodeSound" "Decrypt" 
	"Default" "DefaultIDCMP" "DefaultInput" "DefaultOutput" "DelAppIcon" 
	"DelAppMenu" "DelAppWindow" "DeleteArgString" "DeleteMsgPort" "DeleteRexxMsg" 
	"Deplode" "Depth" "Derez" "DetachGTList" "DeviceName$" 
	"Dim" "Disable" "DisableBox" "DiskBlocks" "DiskBuffer" 
	"DiskCapacity" "DiskErrors" "DiskErrs" "DiskFontBase" "DiskFree" 
	"DiskIO" "DiskMotor" "DiskPlay" "DiskState" "DiskStatus" 
	"DiskType$" "DiskUnit" "DiskUsed" "DiskfontBase" "DispHeight" 
	"Display" "DisplayAdjust" "DisplayBitMap" "DisplayControls" "DisplayDblScan" 
	"DisplayGenlock" "DisplayOff" "DisplayOn" "DisplayPalette" "DisplayRGB" 
	"DisplayRainbow" "DisplayScroll" "DisplaySprite" "DisplayUser" "DoColSplit" 
	"DoColl" "DoFade" "DosBase" "DosBuffLen" "DosError$" 
	"Dos_Base" "DuplicatePalette" "EMouseX" "EMouseY" "EVEN" 
	"EasyRequest" "Edit" "Edit$" "EditExit" "EditFrom" 
	"Editat" "Else" "Enable" "EnableBox" "Encrypt" 
	"End" "EndIf" "EntryBits$" "EntryComment$" "EntryDate" 
	"EntryDir" "EntryHour" "EntryMins" "EntryName$" "EntrySecs" 
	"EntrySize" "Eof" "Erase" "EraseAll" "EraseMode" 
	"ErrFail" "Even" "Event" "EventCode" "EventQualifier" 
	"EventWindow" "Examine" "Exchange" "ExchangeAppear" "ExchangeChangeList" 
	"ExchangeDisAble" "ExchangeDisAppear" "ExchangeDisable" "ExchangeEnable" "ExchangeKill" 
	"ExchangeListChange" "ExchangeMessage" "ExchangeUnique" "Exec" "ExecVersion" 
	"Exists" "Exp" "ExtractLabel" "FFPBase" "FInverse" 
	"FLocate" "FNPrint" "FNSClip" "FNSClipOutput" "FNSHeight" 
	"FNSInk" "FNSLength" "FNSLoad" "FNSOrigin" "FNSOutput" 
	"FNSPrefs" "FNSPrint" "FNSSetTab" "FNSSlot" "FNSUnLoad" 
	"FNSUnderline" "FNSUnload" "FNSVersion" "FNSWidth" "FPrint" 
	"FPrintDetoke" "FXLibReserved1" "FXLibReserved2" "FYOffset" "FadeIn" 
	"FadeInBitmap" "FadeOut" "FadePalette" "FadeStatus" "False" 
	"FastFree" "Fields" "FileFilter" "FileInput" "FileOutput" 
	"FilePart$" "FileReqSize" "FileRequest$" "FileSeek" "FileSize" 
	"FileStructure" "FillMem" "FillPalette" "FillRexxMsg" "Filter" 
	"FindScreen" "FindToolNumber" "FindToolType" "FindToolValue" "FindVolume" 
	"FirstItem" "FloatMode" "FloodFill" "FlsToStr$" "FlushBuffer" 
	"FlushEvents" "FlushQueue" "For" "ForceNTSC" "ForcePAL" 
	"Forever" "Format" "FormatTrack" "Frac" "Frames" 
	"Free" "FreeBank" "FreeCatalog" "FreeChunky" "FreeFill" 
	"FreeIconObject" "FreeIncData" "FreeMacroKey" "FreeMem" "FreePCFCache" 
	"FreePage" "FreeSlices" "FreeTrackerModule" "FreeZoneTable" "Freq" 
	"FromCLI" "FullPath$" "FuncLibVersion" "Function" "GPlot" 
	"GPoint" "GTArrowSize" "GTBevelBox" "GTButton" "GTChangeList" 
	"GTCheckBox" "GTCycle" "GTDisable" "GTEnable" "GTFreeGadget" 
	"GTGadPtr" "GTGetAttrs" "GTGetInteger" "GTGetString" "GTGimmeCludge" 
	"GTInteger" "GTListView" "GTMX" "GTNumber" "GTPalette" 
	"GTScroller" "GTSetAttrs" "GTSetHighlight" "GTSetInteger" "GTSetString" 
	"GTShape" "GTSlider" "GTStatus" "GTString" "GTTagValue" 
	"GTTags" "GTText" "GTToggle" "GadgetBorder" "GadgetHit" 
	"GadgetJam" "GadgetPens" "GadgetStatus" "Gameb" "Get" 
	"GetAssigns" "GetCCOffset" "GetCopIns$" "GetCustomReg" "GetCustomRegAdr" 
	"GetEnv$" "GetHex$" "GetHexAdr$" "GetIconInfo" "GetIconObject" 
	"GetLocal$" "GetLocaleStr" "GetMedInstr" "GetMedNote" "GetMedVolume" 
	"GetModuleName$" "GetModulePosition" "GetProgMode" "GetReg" "GetResultString" 
	"GetRexxCommand" "GetRexxResult" "GetString$" "GetSuperBitMap" "GetTrackerEvent" 
	"GetTrackerLocation" "GetTrackerSize" "GetWheel" "GetZoneX1" "GetZoneX2" 
	"GetZoneY1" "GetZoneY2" "GetaShape" "GetaSprite" "Gfx_Base" 
	"Gosub" "Goto" "GraphicsBase" "Green" "GreyChunky" 
	"HCos" "HPropBody" "HPropPot" "HSin" "HTan" 
	"Handle" "HandleRawKey" "HardCopy" "Hardcopy" "Hex#" 
	"Hex$" "HideScreen" "HotKeyHit" "Hours" "ILBMDepth" 
	"ILBMGrab" "ILBMHeight" "ILBMInfo" "ILBMPalette" "ILBMViewMode" 
	"ILBMWidth" "ILLEGAL" "INCDIR" "INCLUDE" "IconBase" 
	"IconDefTool" "IconDefTool$" "IconDefaultTool" "IconRender" "IconStack" 
	"IconSubTool$" "IconTool$" "IconType" "If" "Implode" 
	"InFront" "InFrontB" "InFrontF" "IncBin" "IncBitmap" 
	"IncData" "IncDataAbs" "IncMed" "IncMod" "IncNextShape" 
	"IncShape" "IncSize" "IncSound" "IncText$" "Index" 
	"InitAnim" "InitBank" "InitChunky" "InitCopList" "InitPage" 
	"InitPalette" "InitShape" "InitSound" "InitZoomXY" "Inkey$" 
	"InnerCls" "InnerHeight" "InnerWidth" "InstallFNS" "Instr" 
	"Int" "Int_Base" "IntuitionBase" "InvMode" "IsEven" 
	"IsLocale" "IsReqToolsActive" "IsReqtoolsActive" "IsRexxMsg" "ItemHit" 
	"ItemStackSize" "JAdaptorStatus" "JFire" "JHoriz" "JVert" 
	"JoYY" "JoyC" "Joyb" "Joyr" "Joyx" 
	"Joyy" "JumpMed" "KeyCode" "KillFile" "KillGreyChunky" 
	"KillItem" "LCase$" "LECludgeShapes" "LECompressShapes" "LEInitShape" 
	"LELoadShapes" "LEMaxShapeDepth" "LEMaxShapeHeight" "LEMaxShapeWidth" "LESaveShapes" 
	"LEScanShapes" "LSet$" "Largest" "Largest.l" "Largest.q" 
	"LargestFree" "LastItem" "Left$" "Len" "Length" 
	"Let" "Line" "Lisa" "List" "ListBase" 
	"LoadAnim" "LoadBank" "LoadBitMap" "LoadBlitzFont" "LoadChunky" 
	"LoadFont" "LoadIFF" "LoadMedModule" "LoadModule" "LoadPCF" 
	"LoadPalette" "LoadScreen" "LoadShape" "LoadShapes" "LoadSound" 
	"LoadSprites" "LoadTape" "LoadTrackerModule" "Loc" "Locate" 
	"Lof" "Log" "Log10" "LoopSound" "MButtons" 
	"MOD" "Macro" "MacroKey" "MakeCommodity" "MakeCookie" 
	"MakeDir" "MatchToolValue" "MatchWild" "Max" "MaxLen" 
	"MaxSelect$" "Maximum" "MemFree" "MenuChecked" "MenuColour" 
	"MenuGap" "MenuHit" "MenuItem" "MenuState" "MenuTitle" 
	"Menus" "MenusOff" "MenusOn" "Mid$" "MidHandle" 
	"Min" "Mins" "MixPalette" "Mki$" "Mkl$" 
	"Mkq$" "Module" "ModulePatterns" "ModulePositionJump" "ModuleSampleName" 
	"ModuleToChip" "Months" "MoreEntries" "MotorOff" "MotorOn" 
	"Mouse" "MouseArea" "MouseButton" "MouseEnabled" "MouseWait" 
	"MouseX" "MouseXSpeed" "MouseY" "MouseYSpeed" "MoveFile" 
	"MoveScreen" "NEWTYPE" "NPrint" "NPrintCon" "NTSC" 
	"NameFile" "NewPaletteMode" "NewToolType" "NewZoneTable" "Next" 
	"NextAppFile" "NextBank" "NextFile$" "NextFrame" "NextItem" 
	"NoCli" "NoMoreEntries" "Null" "NumDays" "NumPars" 
	"On" "OpenCD" "OpenConsole" "OpenDisk" "OpenFile" 
	"OpenSerial" "OutText" "OutTextPen" "PCFDepth" "PCFHeight" 
	"PCFInfo" "PCFVersion" "PCFWidth" "PColl" "PICreateRequest" 
	"PIEndRequest" "PIUpdateRequest" "PLoad" "PPDecrunch" "PackPBM" 
	"PalAdjust" "PalBlue" "PalGreen" "PalRGB" "PalRed" 
	"Palette" "PaletteInfo" "PaletteRange" "Par$" "ParPath$" 
	"PathLock" "PathPart$" "PauseModule" "Peek" "PeekMax$" 
	"PeekSound" "PeekTo$" "Peeks$" "Peekto$" "PhoneticSpeak" 
	"Pi" "PlanarToChunky" "PlayBack" "PlayMed" "PlayModule" 
	"PlayTracker" "PlayWait" "Plot" "Point" "Pointer" 
	"Poke" "Poly" "Polyf" "Pop" "PopInput" 
	"PopItem" "PopOutput" "PositionMouse" "PositionSuperBitMap" "PositionSuperBitmap" 
	"PrevItem" "Print" "PrintCon" "ProcessChunky" "Processor" 
	"PropGadget" "PrtCommand" "PrtText" "PushItem" "Put" 
	"PutIconObject" "PutReg" "PutSuperBitMap" "QAMIGA" "QAbs" 
	"QAngle" "QBlit" "QBlitMode" "QFrac" "QLimit" 
	"QWrap" "Qualifier" "Queue" "QuickPlay" "Quiet" 
	"QuietTrap" "RGB" "RIAnimFrameCount" "RIAnimInit" "RINextAnimFrame" 
	"RRandomize" "RRnd" "RSet$" "RTASyncPaletteRequest" "RTASyncRequest" 
	"RTCheckASyncPaletteRequest" "RTCheckASyncRequest" "RTEZFlagsRequest" "RTEZFontRequest" "RTEZFreePattern" 
	"RTEZGetLong" "RTEZGetLongRange" "RTEZGetString" "RTEZLoadFile" "RTEZMultiLoadFile" 
	"RTEZPaletteRequest" "RTEZPathRequest" "RTEZRNextPathEntry" "RTEZRequest" "RTEZSaveFile" 
	"RTEZScreenModeRequest" "RTEZSetDefaultDirectory" "RTEZSetPattern" "RTEndASyncPaletteRequest" "RTEndASyncRequest" 
	"RTFileRequest" "RTLockWindow" "RTNextPathEntry" "RTRequest" "RTRevision" 
	"RTUnlockWindow" "RTVersion" "RastPort" "RawKey" "RawStatus" 
	"ReMap" "Read" "ReadChunky" "ReadFile" "ReadMem" 
	"ReadSector" "ReadSerial" "ReadSerialMem" "ReadSerialString" "Reboot" 
	"Record" "RectsHit" "Red" "RedoColSplit" "Redraw" 
	"RedrawBox" "RedrawPage" "ReduceX2" "RelMouse" "RemICRVector_a" 
	"RemICRVector_b" "RemoveFNS" "Rename" "RenderPoly" "RenderToBitmap" 
	"RenderToChunky" "Repeat" "Repeats" "Replace$" "ReplyRexxMsg" 
	"ReqColours" "ReqFileLoc" "ReqFileRequest" "ReqFileRequest$" "ReqFontSize" 
	"ReqOutput" "Req_Base" "Request" "Reserve" "ResetList" 
	"ResetString" "ResetTimer" "Restore" "Return" "Rex_Base" 
	"RexxError" "RexxEvent" "RexxSysBase" "RexxsysBase" "Right$" 
	"Rnd" "Rotate" "Rrandomize" "Rrnd" "Run" 
	"Runerrsoff" "Runerrson" "SBlit" "SBlitMode" "SColl" 
	"SHARED" "SMouseX" "SMouseY" "SPACE$" "SafeToBlit" 
	"SaveBank" "SaveBitmap" "SaveCMAP" "SaveChunky" "SaveIncData" 
	"SavePalette" "SaveScreen" "SaveShape" "SaveShapes" "SaveSprites" 
	"SaveTape" "Scale" "ScaleChunkyX" "ScaleChunkyY" "Screen" 
	"ScreenHeight" "ScreenPens" "ScreenTags" "ScreenWidth" "ScreensBitMap" 
	"Scroll" "SearchBegin" "SearchEnd" "SearchMem" "SearchMemFound" 
	"SearchString" "Secs" "Select" "SelectBox" "SelectMode" 
	"SendRexxCommand" "SerialEvent" "SetBLWait" "SetBPLCON0" "SetBits" 
	"SetBox" "SetBoxColor" "SetBoxString" "SetBoxTitle" "SetColl" 
	"SetCollHi" "SetCollOdd" "SetCopyBuffer" "SetCxStatus" "SetCycle" 
	"SetEnv" "SetErr" "SetEventFilter" "SetFileComment" "SetGadgetStatus" 
	"SetHProp" "SetHotKey" "SetICR_a" "SetICR_b" "SetIconHit" 
	"SetIconType" "SetInt" "SetLocal" "SetMedMask" "SetMedVolume" 
	"SetMenu" "SetPagePens" "SetPeriod" "SetSerialBuffer" "SetSerialLens" 
	"SetSerialParams" "SetStatus" "SetString" "SetTextGadget" "SetToolValue" 
	"SetVProp" "SetVoice" "SetWildString" "SetZone" "SetZoneMode" 
	"SetupLESDebug" "Sgn" "Shape" "ShapeGadget" "ShapeHeight" 
	"ShapeItem" "ShapeSpriteHit" "ShapeSub" "ShapeToIcon" "ShapeWidth" 
	"ShapesBitMap" "ShapesHit" "Shared" "Show" "ShowB" 
	"ShowBitMap" "ShowBitmap" "ShowBlitz" "ShowF" "ShowPalette" 
	"ShowRequesters" "ShowScreen" "ShowSprite" "ShowStencil" "Sin" 
	"SizeLimits" "SizeOf" "Slice" "Smallest" "Smallest.l" 
	"Smallest.q" "SolidMode" "Sort" "SortDown" "SortList" 
	"SortUp" "Sound" "SoundData" "Space$" "Speak" 
	"SpotBox" "SpriteMode" "SpritesHit" "Sqr" "Start" 
	"StartMedModule" "StartTracker" "Statement" "Stencil" "StopCycle" 
	"StopMed" "StopModule" "StopTracker" "Str$" "StrToFls" 
	"String$" "StringGadget" "StringSort" "StringSortDir" "StringSortItem" 
	"StringText$" "StripLead$" "StripTrail$" "SubHit" "SubIDCMP" 
	"SubItem" "SubItemOff" "SwapBank" "SysJsr" "SystemDate" 
	"Tan" "TapeTrap" "TaskName$" "TextGadget" "TextRequest" 
	"TextTimeout" "Then" "Ticks" "Timer" "To" 
	"Toggle" "ToggleBox" "TokeJsr" "TrackerVolume" "Translate$" 
	"True" "Type" "UCase$" "USED" "USEPATH" 
	"UStr$" "UnBuffer" "UnLeft$" "UnPackPBM" "UnQueue" 
	"UnRight$" "UnSetEnv" "UnSetLocal" "UnpackIFF" "UnpackPCF" 
	"Until" "Use" "UseCatalog" "UseZoneTable" "Used" 
	"VPos" "VPropBody" "VPropPot" "VWait" "VWaitPos" 
	"Val" "ViewPort" "VoiceLoc" "Volume" "Vpos" 
	"VwaitPos" "WBDepth" "WBExtViewMode" "WBHeight" "WBStartup" 
	"WBViewMode" "WBWidth" "WBlit" "WBox" "WCircle" 
	"WCls" "WColour" "WCursX" "WCursY" "WEllipse" 
	"WJam" "WLeftOff" "WLine" "WLocate" "WMouseX" 
	"WMouseY" "WMove" "WPlot" "WPointer" "WPrintScroll" 
	"WScroll" "WSize" "WTitle" "WTopOff" "Wait" 
	"WaitBlitter" "WaitCommodity" "WaitEvent" "WaitFor" "WaitTrackerEvent" 
	"WbToScreen" "WeekDay" "Wend" "While" "Window" 
	"WindowFont" "WindowHeight" "WindowInput" "WindowOutput" "WindowTags" 
	"WindowWidth" "WindowX" "WindowY" "Wline" "WriteBoot" 
	"WriteChunky" "WriteFile" "WriteMem" "WriteSector" "WriteSerial" 
	"WriteSerialMem" "WriteSerialString" "XBDecodeSound" "XBDiskBuffer" "XBDiskPlay" 
	"XBFilter" "XBInitSound" "XBLoadSound" "XBLoopSound" "XBPeekSound" 
	"XBSetPeriod" "XBSound" "XBSoundData" "XBVolume" "XFlip" 
	"XINCLUDE" "XOR" "XStatus" "Xor" "YFlip" 
	"Years" "Zone" "ZoneInit" "ZoneMode" "ZoneTable" 
	"ZoneTableNumber" "ZoneTableSize" "ZoneTest" "ZoomX2" "ZoomX4" 
	"ZoomX8" "ZoomXY" "cr_vbr"
	
        ; 68000 keywords
	
	"ABCD" "ADD" "ADDA" "ADDI" "ADDQ" 
	"ADDX" "AND" "ANDI" "ASL" "ASR" 
	"BCC" "BCS" "BEQ" "BGE" "BGT" 
	"BHI" "BLE" "BLS" "BLT" "BMI" 
	"BNE" "BPL" "BVC" "BVS" "BRA" 
	"BSR" "BCHG" "BCLR" "BSET" "BTST" 
	"CHK" "CLR" "CMP" "CMPA" "CMPI" 
	"CMPM" "DBCC" "DBCS" "DBEQ" "DBF" 
	"DBRA" "DBGE" "DBGT" "DBHI" "DBLE" 
	"DBLS" "DBLT" "DBMI" "DBNE" "DBPL" 
	"DBT" "DBVC" "DBVS" "DIVS" "DIVU" 
	"EOR" "EORI" "EXG" "EXT" "JMP" 
	"JSR" "LEA" "LINK" "LSL" "LSR" 
	"MOVE" "MOVEA" "MOVEM" "MOVEP" "MOVEQ" 
	"MULS" "MULU" "NBCD" "NEG" "NEGX" 
	"NOP" "NOT" "OR" "ORI" "PEA" 
	"RESET" "ROL" "ROR" "ROXL" "ROXR" 
	"RTE" "RTR" "RTS" "SBCD" "SCC" 
	"SCS" "SEQ" "SF" "SGE" "SGT" 
	"SHI" "SLE" "SLS" "SLT" "SMI" 
	"SNE" "SPL" "ST" "SVC" "SVS" 
	"STOP" "SUB" "SUBA" "SUBI" "SUBQ" 
	"SUBX" "SWAP" "TAS" "TRAP" "TRAPV" 
	"TST" "UNLK"))

(defvar bb2-amigados-keywords nil "AmigaDOS keywords")
(setq bb2-amigados-keywords
      '("AGARexxHost_" "AbortIO_" "AbortPkt_" "ActivateCxObj_" "ActivateGadget_" 
	"ActivateWindow_" "AddAmigaGuideHostA_" "AddAnimOb_" "AddAppIconA_" "AddAppMenuItemA_" 
	"AddAppWindowA_" "AddBob_" "AddBootNode_" "AddBuffers_" "AddClass_" 
	"AddConfigDev_" "AddDTObject_" "AddDevice_" "AddDosEntry_" "AddDosNode_" 
	"AddFont_" "AddFreeList_" "AddGList_" "AddGadget_" "AddHead_" 
	"AddIEvents_" "AddIntServer_" "AddLibrary_" "AddMemHandler_" "AddMemList_" 
	"AddNamedObject_" "AddPart_" "AddPort_" "AddResource_" "AddSegment_" 
	"AddSemaphore_" "AddTail_" "AddTask_" "AddVSprite_" "Alert_" 
	"AllocAbs_" "AllocAslRequest_" "AllocBitMap_" "AllocBoardInfo_" "AllocBoardMem_" 
	"AllocConfigDev_" "AllocDBufInfo_" "AllocDosObject_" "AllocEntry_" "AllocExpansionMem_" 
	"AllocFileRequest_" "AllocIFF_" "AllocLocalItem_" "AllocMem_" "AllocMiscResource_" 
	"AllocNamedObjectA_" "AllocPooled_" "AllocPotBits_" "AllocRaster_" "AllocRemember_" 
	"AllocScreenBuffer_" "AllocSignal_" "AllocSpriteDataA_" "AllocTrap_" "AllocUnit_" 
	"AllocVec_" "AllocateTagItems_" "Allocate_" "AlohaWorkbench_" "Amiga2Date_" 
	"AmigaGuideSignal_" "AndRectRegion_" "AndRegionRegion_" "Animate_" "ApplyTagChanges_" 
	"AreaDraw_" "AreaEllipse_" "AreaEnd_" "AreaMove_" "AskFont_" 
	"AskKeyMapDefault_" "AskSoftStyle_" "AslRequest_" "AssignAdd_" "AssignLate_" 
	"AssignLock_" "AssignPath_" "AttachCxObj_" "AttachPalExtra_" "AttemptLockDosList_" 
	"AttemptLockLayerRom_" "AttemptRemNamedObject_" "AttemptSemaphoreShared_" "AttemptSemaphore_" "AutoRequest_" 
	"AvailFonts_" "AvailMem_" "BeginCardAccess_" "BeginRefresh_" "BeginUpdate_" 
	"BehindLayer_" "BestModeIDA_" "BitMapScale_" "BltBitMapRastPort_" "BltBitMap_" 
	"BltClear_" "BltMaskBitMapRastPort_" "BltPattern_" "BltTemplate_" "BoardsPrivate1_" 
	"BuildEasyRequestArgs_" "BuildSysRequest_" "BumpRevision_" "CBump_" "CMove_" 
	"CWait_" "CacheClearE_" "CacheClearU_" "CacheControl_" "CachePostDMA_" 
	"CachePreDMA_" "CalcIVG_" "CallHookPkt_" "CardAccessSpeed_" "CardChangeCount_" 
	"CardForceChange_" "CardInterface_" "CardMiscControl_" "CardProgramVoltage_" "CardResetCard_" 
	"CardResetRemove_" "Cause_" "ChangeExtSpriteA_" "ChangeMode_" "ChangeScreenBuffer_" 
	"ChangeSprite_" "ChangeVPBitMap_" "ChangeWindowBox_" "CheckDate_" "CheckIO_" 
	"CheckSignal_" "ChildFree_" "ChildOrphan_" "ChildStatus_" "ChildWait_" 
	"ClearCxObjError_" "ClearDMRequest_" "ClearEOL_" "ClearMenuStrip_" "ClearPointer_" 
	"ClearRectRegion_" "ClearRegion_" "ClearRexxMsg_" "ClearScreen_" "CliInitNewcli_" 
	"CliInitRun_" "Cli_" "ClipBlit_" "CloneTagItems_" "CloseAmigaGuide_" 
	"CloseCatalog_" "CloseClipboard_" "CloseDevice_" "CloseEngine_" "CloseFont_" 
	"CloseIFF_" "CloseLibrary_" "CloseLocale_" "CloseMonitor_" "CloseScreen_" 
	"CloseWindow_" "CloseWorkBench_" "Close_" "CoerceMode_" "ColdReboot_" 
	"CollectionChunk_" "CollectionChunks_" "CompareDates_" "ConfigBoard_" "ConfigChain_" 
	"ConvToLower_" "ConvToUpper_" "ConvertHSBToRGB_" "ConvertRGBToHSB_" "CopyMemQuick_" 
	"CopyMem_" "CopySBitMap_" "CopyTuple_" "CreateArgstring_" "CreateBehindHookLayer_" 
	"CreateBehindLayer_" "CreateContext_" "CreateCxObj_" "CreateDir_" "CreateGadgetA_" 
	"CreateIORequest_" "CreateMenusA_" "CreateMsgPort_" "CreateNewProc_" "CreatePool_" 
	"CreateProc_" "CreateRexxMsg_" "CreateUpfrontHookLayer_" "CreateUpfrontLayer_" "CurrentChunk_" 
	"CurrentDir_" "CurrentTime_" "CxBroker_" "CxMsgData_" "CxMsgID_" 
	"CxMsgType_" "CxObjError_" "CxObjType_" "Date2Amiga_" "DateStamp_" 
	"DateToStr_" "Deallocate_" "Debug_" "Delay_" "DeleteArgstring_" 
	"DeleteCxObjAll_" "DeleteCxObj_" "DeleteDiskObject_" "DeleteFile_" "DeleteIORequest_" 
	"DeleteLayer_" "DeleteMsgPort_" "DeletePool_" "DeleteRexxMsg_" "DeleteVar_" 
	"DeviceProc_" "DeviceTuple_" "Disable_" "DisownBlitter_" "DisplayAlert_" 
	"DisplayBeep_" "DisposeCxMsg_" "DisposeDTObject_" "DisposeFontContents_" "DisposeLayerInfo_" 
	"DisposeObject_" "DisposeRegion_" "DivertCxMsg_" "DoAsyncLayout_" "DoCollision_" 
	"DoDTMethodA_" "DoGadgetMethodA_" "DoHookClipRects_" "DoIO_" "DoPkt_" 
	"DoubleClick_" "DrawBevelBoxA_" "DrawBorder_" "DrawEllipse_" "DrawGList_" 
	"DrawImageState_" "DrawImage_" "Draw_" "DupLockFromFH_" "DupLock_" 
	"EasyRequestArgs_" "Enable_" "EndCardAccess_" "EndNotify_" "EndRefresh_" 
	"EndRequest_" "EndUpdate_" "EnqueueCxObj_" "Enqueue_" "EntryHandler_" 
	"EraseImage_" "EraseRect_" "ErrorReport_" "ExAllEnd_" "ExAll_" 
	"ExNext_" "ExamineFH_" "Examine_" "Execute_" "ExitHandler_" 
	"Exit_" "ExtendFont_" "FGetC_" "FGets_" "FPutC_" 
	"FPuts_" "FRead_" "FWrite_" "FattenLayerInfo_" "Fault_" 
	"FilePart_" "FillRexxMsg_" "FilterTagChanges_" "FilterTagItems_" "FindArg_" 
	"FindCliProc_" "FindCollection_" "FindColor_" "FindConfigDev_" "FindDisplayInfo_" 
	"FindDosEntry_" "FindLocalItem_" "FindName_" "FindNamedObject_" "FindPort_" 
	"FindPropContext_" "FindProp_" "FindResident_" "FindSegment_" "FindSemaphore_" 
	"FindTagItem_" "FindTask_" "FindToolType_" "FindVar_" "Flood_" 
	"Flush_" "FontExtent_" "Forbid_" "FormatDate_" "FormatString_" 
	"Format_" "FreeArgs_" "FreeAslRequest_" "FreeBitMap_" "FreeBoardInfo_" 
	"FreeBoardMem_" "FreeClass_" "FreeColorMap_" "FreeConfigDev_" "FreeCopList_" 
	"FreeCprList_" "FreeDBufInfo_" "FreeDeviceProc_" "FreeDiskObject_" "FreeDosEntry_" 
	"FreeDosObject_" "FreeEntry_" "FreeExpansionMem_" "FreeFileRequest_" "FreeFreeList_" 
	"FreeGBuffers_" "FreeGadgets_" "FreeIFF_" "FreeLocalItem_" "FreeMem_" 
	"FreeMenus_" "FreeMiscResource_" "FreeNamedObject_" "FreePooled_" "FreePotBits_" 
	"FreeRaster_" "FreeRemember_" "FreeScreenBuffer_" "FreeScreenDrawInfo_" "FreeSignal_" 
	"FreeSpriteData_" "FreeSprite_" "FreeSysRequest_" "FreeTagItems_" "FreeTrap_" 
	"FreeUnit_" "FreeVPortCopLists_" "FreeVec_" "FreeVisualInfo_" "GT_BeginRefresh_" 
	"GT_EndRefresh_" "GT_FilterIMsg_" "GT_GetGadgetAttrsA_" "GT_GetIMsg_" "GT_PostFilterIMsg_" 
	"GT_RefreshWindow_" "GT_ReplyIMsg_" "GT_SetGadgetAttrsA_" "GadgetMouse_" "GetAPen_" 
	"GetAmigaGuideAttr_" "GetAmigaGuideMsg_" "GetAmigaGuideString_" "GetArgStr_" "GetAttr_" 
	"GetBPen_" "GetBitMapAttr_" "GetBoardName_" "GetCC_" "GetCardMap_" 
	"GetCatalogStr_" "GetColorMap_" "GetConsoleTask_" "GetCurrentBinding_" "GetCurrentDirName_" 
	"GetDTAttrsA_" "GetDTMethods_" "GetDTString_" "GetDTTriggerMethods_" "GetDefDiskObject_" 
	"GetDefPrefs_" "GetDefaultPubScreen_" "GetDeviceProc_" "GetDiskObjectNew_" "GetDiskObject_" 
	"GetDisplayInfoData_" "GetDrMd_" "GetExtSpriteA_" "GetFileSysTask_" "GetGBuffers_" 
	"GetIcon_" "GetLocaleStr_" "GetMsg_" "GetOutlinePen_" "GetPrefs_" 
	"GetProgramDir_" "GetProgramName_" "GetPrompt_" "GetRGB32_" "GetRGB4_" 
	"GetRPAttrsA_" "GetScreenData_" "GetScreenDrawInfo_" "GetSprite_" "GetTagData_" 
	"GetUniqueID_" "GetUnitID_" "GetUnit_" "GetVPModeID_" "GetVar_" 
	"GetVisualInfoA_" "GfxAssociate_" "GfxFree_" "GfxInternal1_" "GfxInternal2_" 
	"GfxInternal3_" "GfxLookUp_" "GfxNew_" "GfxSpare1_" "GfxSpare2_" 
	"GiveUnit_" "GoodID_" "GoodType_" "HelpControl_" "IDtoStr_" 
	"IEEEDPAbs_" "IEEEDPAcos_" "IEEEDPAdd_" "IEEEDPAsin_" "IEEEDPAtan_" 
	"IEEEDPCeil_" "IEEEDPCmp_" "IEEEDPCos_" "IEEEDPCosh_" "IEEEDPDiv_" 
	"IEEEDPExp_" "IEEEDPFieee_" "IEEEDPFix_" "IEEEDPFloor_" "IEEEDPFlt_" 
	"IEEEDPLog10_" "IEEEDPLog_" "IEEEDPMul_" "IEEEDPNeg_" "IEEEDPPow_" 
	"IEEEDPSin_" "IEEEDPSincos_" "IEEEDPSinh_" "IEEEDPSqrt_" "IEEEDPSub_" 
	"IEEEDPTan_" "IEEEDPTanh_" "IEEEDPTieee_" "IEEEDPTst_" "IEEESPAbs_" 
	"IEEESPAcos_" "IEEESPAdd_" "IEEESPAsin_" "IEEESPAtan_" "IEEESPCeil_" 
	"IEEESPCmp_" "IEEESPCos_" "IEEESPCosh_" "IEEESPDiv_" "IEEESPExp_" 
	"IEEESPFieee_" "IEEESPFix_" "IEEESPFloor_" "IEEESPFlt_" "IEEESPLog10_" 
	"IEEESPLog_" "IEEESPMul_" "IEEESPNeg_" "IEEESPPow_" "IEEESPSin_" 
	"IEEESPSincos_" "IEEESPSinh_" "IEEESPSqrt_" "IEEESPSub_" "IEEESPTan_" 
	"IEEESPTanh_" "IEEESPTieee_" "IEEESPTst_" "IfAmigaXIP_" "Info_" 
	"Inhibit_" "InitArea_" "InitBitMap_" "InitCode_" "InitGMasks_" 
	"InitGels_" "InitIFF_" "InitIFFasClip_" "InitIFFasDOS_" "InitLayers_" 
	"InitMasks_" "InitRastPort_" "InitRequester_" "InitResident_" "InitSemaphore_" 
	"InitStruct_" "InitTmpRas_" "InitVPort_" "InitView_" "Input_" 
	"InsertCxObj_" "Insert_" "InstallClipRegion_" "InstallLayerHook_" "InstallLayerInfoHook_" 
	"InternalLoadSeg_" "InternalUnLoadSeg_" "IntuiTextLength_" "Intuition_" "InvertKeyMap_" 
	"IoErr_" "IsAlNum_" "IsAlpha_" "IsCntrl_" "IsDigit_" 
	"IsFileSystem_" "IsGraph_" "IsInteractive_" "IsLower_" "IsPrint_" 
	"IsPunct_" "IsRexxMsg_" "IsSpace_" "IsUpper_" "IsXDigit_" 
	"ItemAddress_" "LayoutMenuItemsA_" "LayoutMenusA_" "LendMenus_" "LengthArgstring_" 
	"LoadRGB32_" "LoadRGB4_" "LoadSeg_" "LoadView_" "LocalItemData_" 
	"LockAmigaGuideBase_" "LockDosList_" "LockIBase_" "LockLayerInfo_" "LockLayerRom_" 
	"LockLayer_" "LockLayers_" "LockPubScreenList_" "LockPubScreen_" "LockRecord_" 
	"LockRecords_" "LockRexxBase_" "Lock_" "MakeClass_" "MakeDosEntry_" 
	"MakeDosNode_" "MakeFunctions_" "MakeLibrary_" "MakeLink_" "MakeScreen_" 
	"MakeVPort_" "MapANSI_" "MapRawKey_" "MapTags_" "MatchEnd_" 
	"MatchFirst_" "MatchIX_" "MatchNext_" "MatchPatternNoCase_" "MatchPattern_" 
	"MatchToolValue_" "MaxCli_" "ModeNotAvailable_" "ModifyIDCMP_" "ModifyProp_" 
	"MoveLayerInFrontOf_" "MoveLayer_" "MoveScreen_" "MoveSizeLayer_" "MoveSprite_" 
	"MoveWindowInFrontOf_" "MoveWindow_" "Move_" "MrgCop_" "NameFromFH_" 
	"NameFromLock_" "NamedObjectName_" "NewDTObjectA_" "NewFontContents_" "NewLayerInfo_" 
	"NewLoadSeg_" "NewModifyProp_" "NewObjectA_" "NewRegion_" "NewScaledDiskFont_" 
	"NextBoardInfo_" "NextDisplayInfo_" "NextDosEntry_" "NextObject_" "NextPubScreen_" 
	"NextTagItem_" "ObtainBattSemaphore_" "ObtainBestPenA_" "ObtainConfigBinding_" "ObtainDataTypeA_" 
	"ObtainGIRPort_" "ObtainInfoA_" "ObtainPen_" "ObtainSemaphoreList_" "ObtainSemaphoreShared_" 
	"ObtainSemaphore_" "OffGadget_" "OffMenu_" "OldOpenLibrary_" "OnGadget_" 
	"OnMenu_" "OpenAmigaGuideA_" "OpenAmigaGuideAsyncA_" "OpenCatalogA_" "OpenClipboard_" 
	"OpenDevice_" "OpenDiskFont_" "OpenEngine_" "OpenFont_" "OpenFromLock_" 
	"OpenIFF_" "OpenIntuition_" "OpenLibrary_" "OpenLocale_" "OpenMonitor_" 
	"OpenResource_" "OpenScreenTagList_" "OpenScreen_" "OpenWindowTagList_" "OpenWindow_" 
	"OpenWorkBench_" "Open_" "OrRectRegion_" "OrRegionRegion_" "Output_" 
	"OwnBlitter_" "OwnCard_" "PackBoolTags_" "PackStructureTags_" "ParentChunk_" 
	"ParentDir_" "ParentOfFH_" "ParseDate_" "ParseIFF_" "ParseIX_" 
	"ParsePatternNoCase_" "ParsePattern_" "PathPart_" "Permit_" "PointInImage_" 
	"PolyDraw_" "PopChunk_" "PrintDTObjectA_" "PrintFault_" "PrintIText_" 
	"Procure_" "PropChunk_" "PropChunks_" "PubScreenStatus_" "PushChunk_" 
	"PutDefDiskObject_" "PutDiskObject_" "PutIcon_" "PutMsg_" "PutStr_" 
	"QBSBlit_" "QBlit_" "QueryOverscan_" "RLDispatch_" "RawDoFmt_" 
	"ReadArgs_" "ReadBattClock_" "ReadBattMem_" "ReadCardStatus_" "ReadChunkBytes_" 
	"ReadChunkRecords_" "ReadExpansionByte_" "ReadExpansionRom_" "ReadItem_" "ReadLink_" 
	"ReadPixelArray8_" "ReadPixelLine8_" "ReadPixel_" "ReadUnitID_" "Read_" 
	"RectFill_" "RefreshDTObjectA_" "RefreshGList_" "RefreshGadgets_" "RefreshTagItemClones_" 
	"RefreshWindowFrame_" "Relabel_" "ReleaseBattSemaphore_" "ReleaseCard_" "ReleaseConfigBinding_" 
	"ReleaseDataType_" "ReleaseGIRPort_" "ReleaseInfoA_" "ReleaseNamedObject_" "ReleasePen_" 
	"ReleaseSemaphoreList_" "ReleaseSemaphore_" "RemAssignList_" "RemConfigDev_" "RemDevice_" 
	"RemDosEntry_" "RemFont_" "RemHead_" "RemIBob_" "RemIntServer_" 
	"RemLibrary_" "RemMemHandler_" "RemNamedObject_" "RemPort_" "RemResource_" 
	"RemSegment_" "RemSemaphore_" "RemTail_" "RemTask_" "RemVSprite_" 
	"RemakeDisplay_" "RemoveAmigaGuideHostA_" "RemoveAppIcon_" "RemoveAppMenuItem_" "RemoveAppWindow_" 
	"RemoveClass_" "RemoveCxObj_" "RemoveDTObject_" "RemoveGList_" "RemoveGadget_" 
	"Remove_" "Rename_" "ReplyAmigaGuideMsg_" "ReplyMsg_" "ReplyPkt_" 
	"ReportMouse_" "RequestFile_" "Request_" "ResetBattClock_" "ResetMenuStrip_" 
	"RethinkDisplay_" "RouteCxMsg_" "RunCommand_" "SDivMod32_" "SMult32_" 
	"SMult64_" "SPAbs_" "SPAcos_" "SPAdd_" "SPAsin_" 
	"SPAtan_" "SPCeil_" "SPCmp_" "SPCos_" "SPCosh_" 
	"SPDiv_" "SPExp_" "SPFieee_" "SPFix_" "SPFloor_" 
	"SPFlt_" "SPLog10_" "SPLog_" "SPMul_" "SPNeg_" 
	"SPPow_" "SPSin_" "SPSincos_" "SPSinh_" "SPSqrt_" 
	"SPSub_" "SPTan_" "SPTanh_" "SPTieee_" "SPTst_" 
	"SameDevice_" "SameLock_" "ScalerDiv_" "ScreenDepth_" "ScreenPosition_" 
	"ScreenToBack_" "ScreenToFront_" "ScrollLayer_" "ScrollRasterBF_" "ScrollRaster_" 
	"ScrollVPort_" "ScrollWindowRaster_" "Seek_" "SelectInput_" "SelectOutput_" 
	"SendAmigaGuideCmdA_" "SendAmigaGuideContextA_" "SendIO_" "SendPkt_" "SetABPenDrMd_" 
	"SetAPen_" "SetAmigaGuideAttrsA_" "SetAmigaGuideContextA_" "SetArgStr_" "SetAttrsA_" 
	"SetBPen_" "SetChipRev_" "SetCollision_" "SetComment_" "SetConsoleTask_" 
	"SetCurrentBinding_" "SetCurrentDirName_" "SetCxObjPri_" "SetDMRequest_" "SetDTAttrsA_" 
	"SetDefaultPubScreen_" "SetDrMd_" "SetEditHook_" "SetExcept_" "SetFileDate_" 
	"SetFileSize_" "SetFileSysTask_" "SetFilterIX_" "SetFilter_" "SetFont_" 
	"SetFunction_" "SetGadgetAttrsA_" "SetInfoA_" "SetIntVector_" "SetIoErr_" 
	"SetKeyMapDefault_" "SetLocalItemPurge_" "SetMaxPen_" "SetMenuStrip_" "SetMode_" 
	"SetMouseQueue_" "SetOutlinePen_" "SetOwner_" "SetPointer_" "SetPrefs_" 
	"SetProgramDir_" "SetProgramName_" "SetPrompt_" "SetProtection_" "SetPubScreenModes_" 
	"SetRGB32CM_" "SetRGB32_" "SetRGB4CM_" "SetRGB4_" "SetRPAttrsA_" 
	"SetRast_" "SetSR_" "SetSignal_" "SetSoftStyle_" "SetTaskPri_" 
	"SetTranslate_" "SetVBuf_" "SetVar_" "SetWindowPointerA_" "SetWindowTitles_" 
	"SetWriteMask_" "ShowTitle_" "Signal_" "SizeLayer_" "SizeWindow_" 
	"SortGList_" "SortLayerCR_" "SplitName_" "StackSwap_" "StartNotify_" 
	"StopChunk_" "StopChunks_" "StopOnExit_" "StoreItemInContext_" "StoreLocalItem_" 
	"StrConvert_" "StrToDate_" "StrToLong_" "Stricmp_" "StripFont_" 
	"StrnCmp_" "Strnicmp_" "SumKickData_" "SumLibrary_" "SuperState_" 
	"Supervisor_" "SwapBitsRastPortClipRect_" "SyncSBitMap_" "SysReqHandler_" "SystemTagList_" 
	"TEDGetCurrentLine_" "TEDGetFilename_" "TEDGetFirstLine_" "TEDGetJumpTable_" "TEDGetLabelCount_" 
	"TEDGetLabelList_" "TEDSetJumpTable_" "TagInArray_" "TextExtent_" "TextFit_" 
	"TextLength_" "Text_" "ThinLayerInfo_" "TimedDisplayAlert_" "ToLower_" 
	"ToUpper_" "TypeOfMem_" "UCopperListInit_" "UDivMod32_" "UMult32_" 
	"UMult64_" "UnGetC_" "UnLoadSeg_" "UnLockDosList_" "UnLockRecord_" 
	"UnLockRecords_" "UnLock_" "UnlockAmigaGuideBase_" "UnlockIBase_" "UnlockLayerInfo_" 
	"UnlockLayerRom_" "UnlockLayer_" "UnlockLayers_" "UnlockPubScreenList_" "UnlockPubScreen_" 
	"UnlockRexxBase_" "UnpackStructureTags_" "UpfrontLayer_" "UserState_" "VBeamPos_" 
	"VFPrintf_" "VFWritef_" "VPrintf_" "Vacate_" "VideoControl_" 
	"ViewAddress_" "ViewPortAddress_" "WBInfo_" "WBenchToBack_" "WBenchToFront_" 
	"WaitBOVP_" "WaitBlit_" "WaitForChar_" "WaitIO_" "WaitPkt_" 
	"WaitPort_" "WaitTOF_" "Wait_" "WeighTAMatch_" "WhichLayer_" 
	"WindowLimits_" "WindowToBack_" "WindowToFront_" "WriteBattClock_" "WriteBattMem_" 
	"WriteChars_" "WriteChunkBytes_" "WriteChunkRecords_" "WriteExpansionByte_" "WritePixelArray8_" 
	"WritePixelLine8_" "WritePixel_" "WritePotgo_" "Write_" "XFA_AllocFrames_" 
	"XFA_AnimFrames_" "XFA_AnimMem_" "XFA_CMapPtr_" "XFA_ChangePackBitMap_" "XFA_ClosePackStuff_" 
	"XFA_ClosePlayStuff_" "XFA_CloseRead_" "XFA_FreeAnim_" "XFA_FreeFrame_" "XFA_FreeFrames_" 
	"XFA_GetPackMode_" "XFA_HeadPtr_" "XFA_IsSkip_" "XFA_LibErr_" "XFA_LoadAnim_" 
	"XFA_OpenPackStuff_" "XFA_OpenPlayStuff_" "XFA_OpenRead_" "XFA_PackBitMap_" "XFA_PackMem_L_" 
	"XFA_PackMem_W_" "XFA_Play_" "XFA_PosOnFrame_" "XFA_PutFrame_" "XFA_PutSeqFrame_" 
	"XFA_PutSkip_" "XFA_ReadFrame_" "XFA_SaveAnim_" "XFA_SaveScreen_" "XFA_SetFramesArray_" 
	"XFA_SetPack_" "XFA_UnPackBitMap_" "XFA_UnPackBitMap_L_" "XFA_UnPackBitMap_W_" "XFA_UseCMap_" 
	"XFA_UseHead_" "XProtocolHostMon_" "XProtocolUserMon_" "XorRectRegion_" "XorRegionRegion_" 
	"ZipWindow_"))

(defvar bb2-ted-indent-p nil "Use TED style simple 2 space indenting")
(setq bb2-ted-indent-p t)

(defconst bb2-trigger-characters
  (mapcar 'string-to-char '(";" " " "(" "," "'" "{" "}"))
  "When the user types one of these characters, we trigger the keyword replacement logic.")

(defconst bb2-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; ' is a string delimiter
    (modify-syntax-entry ?' "\"" table)
    ;; " is a string delimiter
    (modify-syntax-entry ?\" "\"" table)
    ;; ; is a comment start
    (modify-syntax-entry ?\; "<" table)
    ;; /n is a comment end
    (modify-syntax-entry ?\n ">" table)
    ;;underscore is part of a word
    (modify-syntax-entry ?_ "w" table)
    ;; $ is part of a word
    (modify-syntax-entry ?\$ "w" table)
    ;; \ is punctuation, not an escape character
    ;; but \\ is escape in AmiBlitz? how to do it?
    (modify-syntax-entry ?\\ "." table)
    table))

(defvar bb2-keywords-regexp nil "regular expression for bb2 keywords")
(setq bb2-keywords-regexp (regexp-opt bb2-keywords 'words))

;; constants- ie. #something_like_this
(defvar bb2-const-regexp nil "regular expression for bb2 constants")
(setq bb2-const-regexp "#[a-zA-Z0-9_@]+")

;; types, ie .w .l .q string$ .newtype
(defvar bb2-types-regexp nil "regular expression for bb2 types")
(setq bb2-types-regexp "\\B\\$\\|\\(\\b\\|[[:blank:]]+\\)\\.[a-zA-Z_0-9]+")

(defvar bb2-amigados-keywords-regexp nil "regular expression for AmigaDOS keywords")
(setq bb2-amigados-keywords-regexp (regexp-opt bb2-amigados-keywords 'words))

(defvar bb2-highlights nil)
(setq bb2-highlights
	`((,bb2-keywords-regexp . font-lock-keyword-face)
	  (,bb2-amigados-keywords-regexp . font-lock-builtin-face)
	  (,bb2-const-regexp . font-lock-constant-face)
	  (,bb2-types-regexp . font-lock-type-face)))

;; set bb2-mode to use simple 2 space indents like TED on Amiga
(defun bb2-use-ted-indent () 
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (set (make-local-variable 'tab-stop-list) '(0 2 4 6))
  (setq standard-indent 2)  
  ; replace indent-relative
  (setq indent-line-function 'insert-tab)  
  ; turn off electric-indent for this mode
  (electric-indent-local-mode -1))

(defun keywordize-keyhook ()
  (if (bb2-should-replace-keyword-p)
      (save-excursion (bb2-keywordize-symbol -1))))

(defun bb2-should-replace-keyword-p ()
  "check if user pressed a key that triggers keyword replacement"
  (and (bb2-not-just-initialized-p)
       (or (bb2-user-pressed-special-p)
	   (and (bb2-user-is-typing-p)
		(bb2-user-pressed-trigger-key-p)))))

(defun bb2-not-just-initialized-p ()
  (not (eq this-command 'bb2-mode)))

;; The bb2 editor changed keywords on up or down.
;; it doesnt play nice with the mechanism taken from sql-up.
;; we need another way of doing things.
(defun bb2-user-pressed-special-p ()
  "Did the user press enter, up or down?"  
  (and (< 0 (length (this-command-keys-vector)))
       (or (equal 13 last-command-event)
	   (equal 10 last-command-event))))
;	   (equal 'up last-command-event)
;	   (equal 'down last-command-event))))

(defun bb2-user-is-typing-p ()
  (eq this-command #'self-insert-command))

(defun bb2-user-pressed-trigger-key-p ()
  "Did the user enter a character from our list?"
  (let ((bb2-current-char last-command-event))
    (member bb2-current-char bb2-trigger-characters)))

(defun bb2-keywordize-symbol (direction)
  "direction is 1 for forward or -1 for backward"
  (forward-symbol direction)
  (bb2-process-symbol (thing-at-point 'symbol)
		      (bounds-of-thing-at-point 'symbol)))

(defun bb2-process-symbol (symbol symbol-boundaries)
  (let ((found-keyword (bb2-find-keyword symbol)))
    (when found-keyword
	  (delete-region (car symbol-boundaries) (cdr symbol-boundaries))
	  (insert found-keyword))))

(defun bb2-find-keyword (symbol)
  "Return the Blitz Keyword for a given symbol"
  (let ((keyword-list (bb2-choose-keyword-list symbol)))
    (cl-some (lambda (x)
	       (if (string-match-p (concat "^" x "$") symbol) x))
	     keyword-list)))

(defun bb2-choose-keyword-list (symbol)
  (if (string-suffix-p "_" symbol)
      bb2-amigados-keywords
    bb2-keywords))

(define-derived-mode bb2-mode prog-mode "bb2"
  "Major mode for Blitz Basic II code"
  :syntax-table bb2-mode-syntax-table

  (if bb2-ted-indent-p
      (bb2-use-ted-indent))
  
  ;; font-lock-defaults last param sets case-insensitivity
  (setq font-lock-defaults '((bb2-highlights) nil t))
  (font-lock-fontify-buffer)

  (add-hook 'post-command-hook 'keywordize-keyhook nil t))


;; associate  bb2-mode to ascii files only at the moment
(add-to-list 'auto-mode-alist '("\\.bb.ascii\\'" . bb2-mode))	     

(provide 'bb2-mode)
