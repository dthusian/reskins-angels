-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.refining.entities) then
	return
end

-- Set input parameters
local inputs = {
	type = "assembling-machine",
	icon_name = "ore-sorting-facility",
	base_entity_name = "assembling-machine-1",
	mod = "angels",
	particles = { ["big"] = 1, ["medium"] = 2 },
	group = "refining",
	make_remnants = false,
}

local tier_map = {
	["angels-ore-sorting-facility"] = { tier = 1 },
	["angels-ore-sorting-facility-2"] = { tier = 2 },
	["angels-ore-sorting-facility-3"] = { tier = 3 },
	["angels-ore-sorting-facility-4"] = { tier = 4 },
	["angels-ore-sorting-facility-5"] = { tier = 5 },

	-- Sea Block
	["sb-ore-sorting-facility-5"] = { tier = 5 },
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
				filename = "__angelsrefininggraphics__/graphics/entity/ore-sorting-facility/ore-sorting-facility-base.png",
				priority = "extra-high",
				width = 449,
				height = 458,
				frame_count = 40,
				line_length = 10,
				shift = util.by_pixel(0, -2.5),
				animation_speed = 0.5,
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-angels__/graphics/entity/refining/ore-sorting-facility/ore-sorting-facility-mask.png",
				priority = "extra-high",
				width = 449,
				height = 458,
				frame_count = 40,
				line_length = 10,
				shift = util.by_pixel(0, -2.5),
				animation_speed = 0.5,
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-angels__/graphics/entity/refining/ore-sorting-facility/ore-sorting-facility-highlights.png",
				priority = "extra-high",
				width = 449,
				height = 458,
				frame_count = 40,
				line_length = 10,
				shift = util.by_pixel(0, -2.5),
				animation_speed = 0.5,
				blend_mode = reskins.lib.settings.blend_mode,
				scale = 0.5,
			},
			-- Shadow
			{
				filename = "__angelsrefininggraphics__/graphics/entity/ore-sorting-facility/ore-sorting-facility-shadow.png",
				priority = "extra-high",
				width = 528,
				height = 356,
				repeat_count = 40,
				shift = util.by_pixel(21.5, 24.5),
				animation_speed = 0.5,
				draw_as_shadow = true,
				scale = 0.5,
			},
		},
	}

	::continue::
end
