--- STEAMODDED HEADER
--- STEAMODDED SECONDARY FILE

----------------------------------------------
------------MOD GAME UI-----------------------

local Lobby = require "Lobby"

local createUIBoxHUDBlindRef = create_UIBox_HUD_blind
function create_UIBox_HUD_blind()
  if Lobby.code then
    local scale = 0.4
    local stake_sprite = get_stake_sprite(G.GAME.stake or 1, 0.5)
    G.GAME.blind:change_dim(1.5,1.5)

    return {n=G.UIT.ROOT, config={align = "cm", minw = 4.5, r = 0.1, colour = G.C.BLACK, emboss = 0.05, padding = 0.05, func = 'HUD_blind_visible', id = 'HUD_blind'}, nodes={
        {n=G.UIT.R, config={align = "cm", minh = 0.7, r = 0.1, emboss = 0.05, colour = G.C.DYN_UI.MAIN}, nodes={
          {n=G.UIT.C, config={align = "cm", minw = 3}, nodes={
            {n=G.UIT.O, config={object = DynaText({string = {{ref_table = Lobby.enemy, ref_value = 'username'}}, colours = {G.C.UI.TEXT_LIGHT},shadow = true, rotate = true, silent = true, float = true, scale = 1.6*scale, y_offset = -4}),id = 'HUD_blind_name'}},
          }},
        }},
        {n=G.UIT.R, config={align = "cm", minh = 2.74, r = 0.1,colour = G.C.DYN_UI.DARK}, nodes={
          {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
            {n=G.UIT.R, config={align = "cm", minh = 0.3, maxw = 4.2}, nodes={
              {n=G.UIT.T, config={ref_table = {val = ''}, ref_value = 'val', scale = scale*0.9, colour = G.C.UI.TEXT_LIGHT, func = 'HUD_blind_debuff_prefix'}},
              {n=G.UIT.T, config={ref_table = G.GAME.blind.loc_debuff_lines, ref_value = 1, scale = scale*0.9, colour = G.C.UI.TEXT_LIGHT, id = 'HUD_blind_debuff_1', func = 'HUD_blind_debuff'}}
            }},
            {n=G.UIT.R, config={align = "cm", minh = 0.3, maxw = 4.2}, nodes={
              {n=G.UIT.T, config={ref_table = G.GAME.blind.loc_debuff_lines, ref_value = 2, scale = scale*0.9, colour = G.C.UI.TEXT_LIGHT, id = 'HUD_blind_debuff_2', func = 'HUD_blind_debuff'}}
            }},
          }},
          {n=G.UIT.R, config={align = "cm",padding = 0.15}, nodes={
            {n=G.UIT.O, config={object = G.GAME.blind, draw_layer = 1}},
            {n=G.UIT.C, config={align = "cm",r = 0.1, padding = 0.05, emboss = 0.05, minw = 2.9, colour = G.C.BLACK}, nodes={
              {n=G.UIT.R, config={align = "cm", maxw = 2.8}, nodes={
                {n=G.UIT.T, config={text = 'Chips To Beat', scale = 0.3, colour = G.C.WHITE, shadow = true}}
              }},
              {n=G.UIT.R, config={align = "cm", minh = 0.6}, nodes={
                {n=G.UIT.O, config={w=0.5,h=0.5, colour = G.C.BLUE, object = stake_sprite, hover = true, can_collide = false}},
                {n=G.UIT.B, config={h=0.1,w=0.1}},
                {n=G.UIT.T, config={ref_table = Lobby.enemy, ref_value = 'score', scale = 0.001, colour = G.C.RED, shadow = true, id = 'HUD_blind_count', func = 'blind_chip_UI_scale'}}
              }},
              {n=G.UIT.R, config={align = "cm", minh = 0.45, maxw = 2.8, func = 'HUD_blind_reward'}, nodes={
                {n=G.UIT.T, config={text = 'Enemy hands left: ', scale = 0.3, colour = G.C.WHITE}},
                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = Lobby.enemy, ref_value = 'hands'}}, colours = {G.C.BLUE},shadow = true, rotate = true, bump = true, silent = true, scale = 0.45}),id = 'dollars_to_be_earned'}},
              }},
            }},
          }},
        }},
      }}
  else
    return createUIBoxHUDBlindRef()
  end
end

----------------------------------------------
------------MOD GAME UI END-------------------