#1. Think about the rules of the board and knight, make sure to follow them
#2. For every square there is a number of possible moves, choose a data structure that will allow you to work with them. Don't allow aany moves to go off the board
#3. Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series
#4. Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like.
def knight_moves(starting_square = [0,0], ending_square = [7,7])
    queue = [starting_square]
    # Need to keep track of the path, each square visited should be a key, and it's value should be it's parent, this way we can trace back
    # the path, once the target square is found
    visited_squares = { starting_square => nil }
    
    while !queue.empty?
        current_square = queue.shift
        
        if current_square == ending_square
            # target_square found, should reconstruct / return the path
            path = []
            while current_square
                path.unshift(current_square)
                current_square = visited_squares[current_square]
            end
            puts "You made it in #{path.length} moves! Here's your path:"
            return path
        end
        
        moves = calculate_moves(current_square)
        

        moves.each do |square_coordinates|
            if !visited_squares.key?(square_coordinates)
                visited_squares[square_coordinates] = current_square
                queue << square_coordinates
            end
            
        end
    end
end

def calculate_moves(square_coordinates)
    min_limit = 0
    max_limit = 7
    output_set_of_squares = []
    x = square_coordinates[0]
    y = square_coordinates[1]
    # knight can move:
        # x + 2, y + 1
        output_set_of_squares << [x + 2, y + 1]
        # x + 2, y - 1
        output_set_of_squares << [x + 2, y - 1]
        # x - 2, y + 1
        output_set_of_squares << [x - 2, y + 1]
        # x - 2, y - 1
        output_set_of_squares << [x - 2, y - 1]
        # y + 2, x + 1
        output_set_of_squares << [x + 1, y + 2]
        # y + 2, x - 1
        output_set_of_squares << [x - 1, y + 2]
        # y - 2, x + 1
        output_set_of_squares << [x + 1, y - 2]
        # y - 2, x - 1
        output_set_of_squares << [x - 1, y - 2]

    # check that squares are within bounds, if not, remove
    i = 0
    while i < output_set_of_squares.length
        x_coordinate = output_set_of_squares[i][0]
        y_coordinate = output_set_of_squares[i][1]
        
        if x_coordinate < min_limit || x_coordinate > max_limit || y_coordinate < min_limit || y_coordinate > max_limit
            output_set_of_squares.delete_at(i)
        else
            i += 1
        end
    end
    return output_set_of_squares
    
end

p knight_moves([3,3],[4,3])
p knight_moves([0,0],[7,7])
p knight_moves([0,0],[0,1])