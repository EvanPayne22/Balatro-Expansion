return {
    descriptions = {
        Joker = {
            j_be_lucky_day = {
                name = "Lucky Day",
                text = {
                    {
                        "Played {C:clubs}Clubs{} each give",
                        "{X:mult,C:white} X#1# {} Mult when scored",
                    }
                },
            },

            j_be_wild_west = {
                name = "The Wild West",
                text = {
                    {
                        "Each played {C:enhanced}Wild Card{}",
                        "gives between {X:mult,C:white} X1.0 {} and",
                        "{X:mult,C:white}X3.0{} Mult when scored",
                        
                    }
                },
            },

            j_be_domino = {
                name = "Domino Effect",
                text = {
                    {
                        "Each played {C:enhanced}Stone Card{}",
                        "retriggers when scored",
                    }
                },
            },

            j_be_jackpot = {
                name = "Jackpot",
                text = {
                    {
                        "{C:chips}+#1#{} Chips if played",
                        "hand contains",
                        "at least three {C:attention}7s{}",
                    }
                },
            },

        }
    },
    misc = {

            -- do note that when using messages such as: 
            -- message = localize{type='variable',key='a_xmult',vars={current_xmult}},
            -- that the key 'a_xmult' will use provided values from vars={} in that order to replace #1#, #2# etc... in the localization file.


        dictionary = {
            a_chips="+#1#",
            a_chips_minus="-#1#",
            a_hands="+#1# Hands",
            a_handsize="+#1# Hand Size",
            a_handsize_minus="-#1# Hand Size",
            a_mult="+#1# Mult",
            a_mult_minus="-#1# Mult",
            a_remaining="#1# Remaining",
            a_sold_tally="#1#/#2# Sold",
            a_xmult="X#1# Mult",
            a_xmult_minus="-X#1# Mult",
        }
    }
}
