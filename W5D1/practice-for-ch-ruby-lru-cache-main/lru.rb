
# note that input is limited to ints, strings, arrays, symbols, 
# and hashes.

class LRUCache
    def initialize(max_size)
        @max_size = max_size
        @underlying_array = []
    end

    def count
      # returns number of elements currently in cache
      return @underlying_array.length
    end

    def add(el)
      # adds element to cache according to LRU principle
        if @underlying_array.include?(el) # if ele is already here, add it to the front.
            index = @underlying_array.index(el)
            @underlying_array.delete_at(index)
            @underlying_array.unshift(el) 
        else
            if count >= @max_size
                # get rid of last used element
                # add new element
                @underlying_array.pop # (last ele is LRU, get rid of it)
                @underlying_array.unshift(el) # (first ele is MRU)
            else
                # add new element
                @underlying_array.unshift(el)   # first ele is most recently used
            end
        end
    end

    def show
      # shows the items in the cache, with the LRU item first
      print @underlying_array.reverse
    end

    private
    # helper methods go here!

  end


  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]