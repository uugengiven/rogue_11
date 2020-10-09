class Floor
    attr_accessor :token
    attr_accessor :on_fire
    attr_accessor :is_goal
    attr_accessor :can_walk

    def initialize
        @token = "."
        @on_fire = true
        @is_goal = false
        @can_walk = true
    end

    def step_on player
        # does anything happen?
        # no, not for just floor
        player.score = player.score + 1
    end
end