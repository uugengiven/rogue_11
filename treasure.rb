require "./floor.rb"

class Treasure < Floor
    def initialize
        @token = "$"
        @on_fire = false
        @is_goal = false
        @can_walk = true
        @value = 100
    end

    def step_on player
        # should anything happen?
        # yes, score should go up, $ should disappear
        player.score = player.score + @value
        @value = 1
        @token = "."
    end
end