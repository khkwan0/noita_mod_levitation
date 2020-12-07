dofile_once("data/scripts/lib/utilities.lua")

local flying_needs_recharge = 0

function OnPlayerSpawned( player_entity )
  _gui = GuiCreate()
end

function OnWorldPostUpdate()
  GuiOptionsAdd(_gui, GUI_OPTION.IsDraggable)
  GuiOptionsAdd(_gui, GUI_OPTION.AlwaysClickable)
  GuiStartFrame(_gui)
  local clicked = GuiButton(_gui, 123765, 0,0, "Inf Levitation ("..(flying_needs_recharge == 1 and "OFF" or "ON")..")")
  if (clicked) then
    if (flying_needs_recharge == 1) then
      flying_needs_recharge = 0
    else
      flying_needs_recharge = 1
    end
  end
  local players = get_players()
  if (players) then
    local player_entity = players[1]
    if (player_entity ~= nil) then
      local character_data_component = EntityGetFirstComponent( player_entity, "CharacterDataComponent")
      ComponentSetValue( character_data_component, "flying_needs_recharge", flying_needs_recharge)
    end
  end
end