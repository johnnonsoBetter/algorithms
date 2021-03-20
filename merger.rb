class Merger
    def initialize(left_array, right_array)
        @left_array = left_array
        @right_array = right_array
        

    end

    def startMerge(right, left, tracker)
        return if !@temp_arr[@temp_arr.length - 1].nil?

        if @right_array[right].nil?
            #copy all item from left array to the temp array
            copyRemaining(left, @left_array, tracker)
            return
        end

        if @left_array[left].nil?
            #copy all item from right array to the temp array
            copyRemaining(right, @right_array, tracker)
            startMerge(right, left, tracker)
            return
        end
        
        if @left_array[left] < @right_array[right]
            @temp_arr[tracker] = @left_array[left]
            tracker = tracker + 1
            left = left + 1
            startMerge(right, left, tracker)
        else
            @temp_arr[tracker] = @right_array[right]
            tracker = tracker + 1
            right = right + 1
            startMerge(right, left, tracker)
        end


    end

    def copyRemaining(start_pos, array, tracker)
       
        i = 0
        len = array.length - start_pos
        while i < len
            @temp_arr[tracker] = array[start_pos]
            tracker = tracker + 1
            start_pos = start_pos + 1
            i = i + 1
        end

    end

    def makeMerge
        @temp_arr = Array.new(@left_array.length + @right_array.length)
        startMerge(0, 0, 0)



    end

    def showArrayResult
        p @temp_arr
    end


end

ele = Merger.new([
    5, 20, 30, 45, 100, 200
], [
    10, 25, 28, 40, 788, 789
])
ele.makeMerge

ele.showArrayResult

