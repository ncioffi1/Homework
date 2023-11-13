# <!-- # Big O-ctopus And Biggest Fish

# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

# ```sh
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
#  'fiiiissshhhhhh']
# => "fiiiissshhhhhh"
# ```

# ## Sluggish Octopus

# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to
# all other fish lengths

def find_longest_fish(arr1)
    longest_fish = ""
    sorted = false
    while !sorted
        sorted = true
        (0...arr1.length).each do |i1|
            if i1 < arr1.length
                if arr1[i1] < arr1[i1 + 1]
                    arr1[i1], arr1[i1 + 1] = arr1[i1 + 1], arr1[i1]
                    sorted = false
                end
            end
        end
    end
    return arr1[0]
end

# ## Dominant Octopus

# Find the longest fish in O(n log n) time. **Hint:** You saw a sorting algorithm
# that runs in O(n log n) in the [sorting complexity demo][sorting-demo] from the
# Sorting Complexity reading. Remember that Big O is classified by the dominant
# term.

def merge_sort(arr)
    return arr if count < 2 # 1

    middle = count / 2 # 1

    left, right = arr.take(middle), arr.drop(middle) # n
    sorted_left, sorted_right = left.merge_sort, right.merge_sort # log n
    merge(sorted_left, sorted_right) # n
end

def merge(left, right)
    merged_array = [] # 1
    until left.empty? || right.empty? # 1
        merged_array << ((left.first < right.first) ? left.shift : right.shift) # n
    end

    merged_array + left + right # n
end

# ## Clever Octopus

# Find the longest fish in O(n) time. The octopus can hold on to the longest fish
# that you have found so far while stepping through the array only once.

def clever_octopus(arr1)
    longest_fish = ""
    arr1.each do |ele|
        if ele.length > longest_fish.length
            longest_fish = ele
        end
    end
    return longest_fish
end
# ## Dancing Octopus

# Full of fish, the Octopus attempts [Dance Dance Revolution][ddr]. The game has
# tiles in the following directions:

# ```ruby
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up"]
# ```

# To play the game, the octopus must step on a tile with her corresponding
# tentacle. You can assume that the octopus's eight tentacles are numbered and
# correspond to the tile direction indices.

# ## Slow Dance

# Given a tile direction, iterate through a tiles array to return the tentacle
# number (tile index) the octopus must move. This should take O(n) time.

def slow_dance(tile_dir, tiles_array)
    tiles_array.each_with_index do |dir, i1|
        return i1 if tile_dir == dir
    end
    return nil
end
# ```sh
# slow_dance("up", tiles_array)
# > 0

# slow_dance("right-down", tiles_array)
# > 3
# ```

# ## Fast Dance!

# Now that the octopus is warmed up, let's help her dance faster. Use a different
# data structure and write a new function so that you can access the tentacle
# number in O(1) time.
def fast_dance(tile_dir, tiles_array)
    return tiles_array.index(tile_dir)
end

# ```sh
# fast_dance("up", new_tiles_data_structure)
# > 0

# fast_dance("right-down", new_tiles_data_structure)
# > 3
# ```

# [ddr]: https://en.wikipedia.org/wiki/Dance_Dance_Revolution
# [sorting-demo]: https://assets.aaonline.io/fullstack/ruby/homeworks/sorting_demo/sorting_demo.rb -->