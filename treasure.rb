require "./floor.rb"

class Treasure < Floor
    def initialize
        @token = "$"
        @on_fire = false
        @is_goal = false
        @can_walk = true
    end

    def step_on player
        # should anything happen?
        # yes, score should go up, $ should disappear
        player.score = player.score + 100
        @token = "."
    end
end