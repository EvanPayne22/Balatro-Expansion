
-- you can have shared helper functions
function shakecard(self) --visually shake a card
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end

function return_JokerValues() -- not used, just here to demonstrate how you could return values from a joker
    if context.joker_main and context.cardarea == G.jokers then
        return {
            chips = card.ability.extra.chips,       -- these are the 3 possible scoring effects any joker can return.
            mult = card.ability.extra.mult,         -- adds mult (+)
            x_mult = card.ability.extra.x_mult,     -- multiplies existing mult (*)
            card = self,                            -- under which card to show the message
            colour = G.C.CHIPS,                     -- colour of the message, Balatro has some predefined colours, (Balatro/globals.lua)
            message = localize('k_upgrade_ex'),     -- this is the message that will be shown under the card when it triggers.
            extra = { focus = self, message = localize('k_upgrade_ex') }, -- another way to show messages, not sure what's the difference.
        }
    end
end

SMODS.Atlas({
    key = "lucky_day",
    path = "j_lucky_day.png",
    px = 71,
    py = 95
})

SMODS.Joker{
    key = "lucky_day",
    config = { extra = { x_mult = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = "",
    atlas = 'lucky_day',
    soul_pos = nil,
    set = "Joker",

    calculate = function(self, card, context)
        if context.individual then
            if context.cardarea == G.play then 
                if context.other_card:is_suit("Clubs") then
                    return {
                        x_mult = card.ability.extra.x_mult,
                        card = card
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult }, key = self.key }
    end
}

SMODS.Atlas({
    key = "wild_west",
    path = "j_wild_west.png",
    px = 71,
    py = 95
})

SMODS.Joker{
    key = "wild_west",
    config = { extra = {max = 30, min = 10} },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = "",
    atlas = 'wild_west',
    soul_pos = nil,
    set = "Joker",

    calculate = function(self, card, context)
        if context.individual then
            if context.cardarea == G.play then 
                if context.other_card.ability.name == 'Wild Card' then
                    local temp_Mult = pseudorandom('wild_west', card.ability.extra.min, card.ability.extra.max)/10
                    return {
                        message = localize{type='variable',key='a_mult',vars={temp_Mult}},
                        x_mult = temp_Mult
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { temp_Mult }, key = self.key }
    end
}

SMODS.Atlas({
    key = "domino",
    path = "j_wild_west.png",
    px = 71,
    py = 95
})

SMODS.Joker{
    key = "domino",
    config = { repetitions = 1 },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = "",
    atlas = 'domino',
    soul_pos = nil,
    set = "Joker",

    calculate = function(self, card, context)
        if context.repetition then
            if context.cardarea == G.play then 
                if context.other_card.ability.name == 'Stone Card' then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = card.ability.repetitions,
                        card = card
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { }
    end
}

SMODS.Atlas({
    key = "jackpot",
    path = "j_wild_west.png",
    px = 71,
    py = 95
})

SMODS.Joker{
    key = "jackpot",
    config = { extra = { chips = 777 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = "",
    atlas = 'jackpot',
    soul_pos = nil,
    set = "Joker",

    calculate = function(self, card, context)
        if not context.joker_main or not context.scoring_hand then return end

        local sevens = 0
        for _, c in ipairs(context.scoring_hand) do
            if c:get_id() == 7 then
                sevens = sevens + 1
            end
        end

        if sevens >= 3 then
            return {
                message = "Jackpot",
                chips = card.ability.extra.chips,
                card = card
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key }
    end
}
