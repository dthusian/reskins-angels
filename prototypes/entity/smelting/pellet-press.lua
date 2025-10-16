-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.smelting.entities) then
	return
end

-- Set input parameters
local inputs = {
	type = "assembling-machine",
	icon_name = "pellet-press",
	base_entity_name = "assembling-machine-1",
	mod = "angels",
	particles = { ["big"] = 1, ["medium"] = 2 },
	group = "smelting",
	make_remnants = false,
}

local tier_map = {
	["angels-pellet-press"] = { tier = 1, prog_tier = 3 },
	["angels-pellet-press-2"] = { tier = 2, prog_tier = 4 },
	["angels-pellet-press-3"] = { tier = 3, prog_tier = 5 },
	["angels-pellet-press-4"] = { tier = 4, prog_tier = 6 },
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
	---@type data.AssemblingMachinePrototype
	local entity = data.raw[inputs.type][name]
	if not entity then
		goto continue
	end

	local tier = reskins.lib.tiers.get_tier(map)
	inputs.tint = map.tint or reskins.lib.tiers.get_tint(tier)

	reskins.lib.setup_standard_entity(name, tier, inputs)

	-- Reskin entities
	entity.graphics_set.animation = {
		layers = {
			-- Base
			{
				filename = "__angelssmeltinggraphics__/graphics/entity/pellet-press/pellet-press-base.png",
				priority = "extra-high",
				width = 200,
				height = 199,
				line_length = 10,
				frame_count = 60,
				animation_speed = 0.5,
				shift = util.by_pixel(0, 0),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-angels__/graphics/entity/smelting/pellet-press/pellet-press-mask.png",
				priority = "extra-high",
				width = 200,
				height = 199,
				line_length = 10,
				frame_count = 60,
				animation_speed = 0.5,
				shift = util.by_pixel(0, 0),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-angels__/graphics/entity/smelting/pellet-press/pellet-press-highlights.png",
				priority = "extra-high",
				width = 200,
				height = 199,
				line_length = 10,
				frame_count = 60,
				animation_speed = 0.5,
				shift = util.by_pixel(0, 0),
				blend_mode = reskins.lib.settings.blend_mode,
				scale = 0.5,
			},
			-- Shadow
			{
				filename = "__angelssmeltinggraphics__/graphics/entity/pellet-press/pellet-press-shadow.png",
				priority = "extra-high",
				width = 246,
				height = 132,
				line_length = 6,
				frame_count = 60,
				animation_speed = 0.5,
				draw_as_shadow = true,
				shift = util.by_pixel(12, 17),
				scale = 0.5,
			},
		},
	}

	::continue::
end
