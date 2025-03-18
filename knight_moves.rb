#1. Think about the rules of the board and knight, make sure to follow them
#2. For every square there is a number of possible moves, choose a data structure that will allow you to work with them. Don't allow aany moves to go off the board
#3. Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series
#4. Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like.
def knight_moves(starting_square = [0,0], ending_square = [7,7])
    queue = [starting_square]
    # start at starting_square
    
    # finish condition
    while !queue.empty?
        current_square = queue.shift
        if current_square == ending_square
            return "shortest path found"
        end
        
        moves = calculate_moves(current)
    end
end

def calculate_moves(square_coordinates)
    min_limit = 0
    max_limit = 7
    output_set_of_squares = []
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
            output_set_of_squares.delete(i)
        else
            index += 1
        end
    end
    return output_set_of_squares
    
end
