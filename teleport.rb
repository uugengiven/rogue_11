require "./floor.rb"

class Teleport < Floor
    def initialize
        @token = "#"
        @on_fire = true
        @is_goal = false
        @can_walk = true
    end

    def step_on player
        # should anything happen?
        # move player x/y
        temp = player.x
        player.x = player.y
        player.y = temp
    end
end