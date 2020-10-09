require "./floor.rb"

class Lava < Floor
    def initialize
        @token = "~"
        @on_fire = true
        @is_goal = false
        @can_walk = true
    end

    def step_on player
        # should anything happen?
        # score should go down when stepping on lava
        player.score = player.score - 10
    end
end