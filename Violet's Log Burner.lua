--Credits for: >>Higgins, Matteus and Spade<< to provide some scripts examples
--Credits for: >>Alar<< -ME
--Fully edited by >>Blind Rooster<<
--Requires: Violet is Blue Quest, then enter the "Yeti town!(Violet is Blue) Teleport", Start in front of the Bonfire.
--Take your logs in Preset 1.
--Version 1.0 ( ) - Release
--Version 1.1 () - Improved delays, Cleaner script.
--Version 1.2 (X) - Idlecheck, Now picks Fire Spirit. 
print("Running Lua script Violet's Log Burner.");
local API = require("api")
API.SetDrawTrackedSkills(true)
API.SetMaxIdleTime(10)
local item1 = 0;
local loopprotect1 = 0;
local loopprotect2 = 0;
MAX_IDLE_TIME_MINUTES = 5
startTime, afk = os.time(), os.time()
BonfireID = 43784 
BankchestID = 43807
local Cselect = API.ScriptDialogWindow2("Burning", {
    "Logs", "Oak Logs", "Willow Logs", "Maple Logs", "Teak Logs", "Acadia Logs", "Arctic pine Logs", 
    "Eucalyptus Logs", "Mahogany Logs", "Yew Logs", "Magic Logs", "Elder Logs", "Eternal magic Logs", 
    },"Start", "Close").Name;

--Logs ID's
if "Logs" == Cselect then
    ScripCuRunning1 = "Burn Logs";
    item1 = 1511;
end
if "Oak Logs" == Cselect then
    ScripCuRunning1 = "Burn Oak Logs";
    item1 = 1521;
end
if "Willow Logs" == Cselect then
    ScripCuRunning1 = "Burn Willow Logs";
    item1 = 1519;
end
if "Maple Logs" == Cselect then
    ScripCuRunning1 = "Burn Maple Logs";
    item1 = 1517;
end
if "Teak Logs" == Cselect then
    ScripCuRunning1 = "Burn Teak Logs";
    item1 = 6333;
end
if "Acadia Logs" == Cselect then
    ScripCuRunning1 = "Burn Acadia Logs";
    item1 = 40285;
end
if "Arctic pine Logs" == Cselect then
    ScripCuRunning1 = "Burn Arctic pine Logs";
    item1 = 10810;
end
if "Eucalyptus Logs" == Cselect then
    ScripCuRunning1 = "Eucalyptus Logs";
    item1 = 12581;
end
if "Mahogany Logs" == Cselect then
    ScripCuRunning1 = "Burn Mahogany Logs";
    item1 = 6332 ;
end
if "Yew Logs" == Cselect then
    ScripCuRunning1 = "Burn Yew Logs";
    item1 = 1515 ;
end
if "Magic Logs" == Cselect then
    ScripCuRunning1 = "Burn Magic Logs" ;
    item1 = 1513 ;
end
if "Elder Logs" == Cselect then
    ScripCuRunning1 = "Burn Elder Logs" ;
    item1 = 29556 ;
end
if "Eternal magic Logs" == Cselect then
    ScripCuRunning1 = "Burn Eternal magic Logs";
    item1 = 58250 ;
end

print("Action:", ScripCuRunning1, item1);

textdata = API.CreateIG_answer();
textdata.box_name = "test_text";
textdata.box_start = FFPOINT.new(66,77,0);
textdata.colour = ImColor.new(0,255,0);
API.DrawTextAt(textdata);
--ticks
function R(min,max)
    return min + API.Math_RandomNumber(max)-1
end

local previus_t = API.Get_tick() --outside of LoopyLoop
-----main loop
API.Write_LoopyLoop(true);
API.Write_Doaction_paint(true);

while (API.Read_LoopyLoop()) do
    API.RandomEvents();
    API.DoRandomEvents()


    if (loopprotect1) > 4 then API.Write_LoopyLoop(false); end
    if (loopprotect2) > 4 then API.Write_LoopyLoop(false); end

    if (API.Math_RandomNumber(1000) > 993) then
        API.PIdle1();
    end

    if (API.Math_RandomNumber(1000) > 998) then
        API.PIdle2();
    end

    if (not API.CheckAnim(100)) then
        ScripCuRunning2 = "Searching";
        if (API.OpenInventoryInterface2()) then
            if (API.CheckInvStuff1(item1,0)) then
                loopprotect1 = loopprotect1 + 1;
                loopprotect2 = 0;
                ScripCuRunning2 = "Looking for Bonfire";
                if (API.DoPortables0(BonfireID, "Add logs to")) then 
                    ScripCuRunning2 = "Burning";
                    API.RandomSleep2(1500, 3050, 4050);
                end
            else           
                loopprotect2 = loopprotect2 + 1;
                loopprotect1 = 0;
                ScripCuRunning2 = "Looking for bank chest";
                API.OpenBankChest0(BankchestID, '1');

            end
        else
            ScripCuRunning1 = "Inventory not open";
        end
    end
    API.RandomSleep2(500, 2050, 3000);

end
