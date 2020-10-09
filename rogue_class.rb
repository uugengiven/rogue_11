require 'io/console' # this is needed for STDIN.getch to work
require './floor'
require './treasure'
require './lava'
require './teleport'

class Player
    # should hold x and y for the player
    attr_accessor :x
    attr_accessor :y
    attr_accessor :token
    attr_accessor :score

    def initialize
        @token = "@"
        @score = 0
    end
end


def draw_grid grid, player
    (0...10).each do |grid_y|
        (0...10).each do |grid_x|
            if (grid_x == player.x && grid_y == player.y)
                print player.token
            else
                print grid[grid_y][grid_x].token
            end
        end
        puts
    end
    puts "Player X is #{player.x}"
    puts "Player Y is #{player.y}"
    puts "Score is #{player.score}"
end

# TO DO
# Make a thing to pick up

# TO DONE
# Create a board
# Show the board
# Show the player
# Walk around the board
# Don't let player walk off the edge
# Make it so I don't have to hit enter every time I type a direction
# Make it so q quits

mr_nye = Player.new
grid = Array.new(10) { Array.new(10) { Floor.new } }

# Array.new(10) is the same as [nil, nil, nil, nil...]
# Array.new(10){ 1 } is the same as [1, 1, 1, 1, 1...]

mr_nye.x = 3
mr_nye.y = 3

grid[5][7] = Treasure.new
grid[6][1] = Lava.new
grid[1][9] = Teleport.new

draw_grid grid, mr_nye

keep_playing = true
while(keep_playing)
    puts "What direction do you want to go? (user w, a, s, d, or q to quit)"
    direction = STDIN.getch

    
    # Here is where I move
    if direction == "w"
        # moving up means player_y is smaller
        if mr_nye.y > 0
            mr_nye.y = mr_nye.y - 1
        end
    elsif direction == "s"
        if mr_nye.y < 9 # cause we're adding 1 and 9 is the highest this can go
            mr_nye.y = mr_nye.y + 1
        end
    elsif direction == "a"
        if mr_nye.x > 0
            mr_nye.x = mr_nye.x - 1
        end
    elsif direction == "d"
        if mr_nye.x < 9
            mr_nye.x = mr_nye.x + 1
        end
    elsif direction == "q"
        keep_playing = false
    end

    # Here is where I see what I'm standing on
    grid[mr_nye.y][mr_nye.x].step_on mr_nye

    draw_grid grid, mr_nye
end