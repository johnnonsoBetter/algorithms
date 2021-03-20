class Merger
    def initialize(left_array, right_array)
        @left_array = left_array
        @right_array = right_array
        

    end

    def startMerge(right, left, tracker)
        return if !@temp_arr[@temp_arr.length - 1].nil?

        if right > (@left_array.length - 1)
            #copy all item from left array to the temp array
            copyRemaining(left, @left_array, tracker)
            return
        end

        if left > (@right_array.length - 1)
            #copy all item from right array to the temp array
            copyRemaining(right, @right_array, tracker)
            return
        end
        p @left_array[left] < @right_array[right]
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
        p "started copying"
        i = 0
        len = start_pos - array.length

        while i < len
            @temp[tracker] = array[start_pos]
            tracker = tracker + 1
            start_pos = start_pos + 1
            i = i + 1
        end

    end

    def makeMerge
        @temp_arr = Array.new(@left_array.length + @right_array.length)
        right = 0
        left = 0

        startMerge(right, left, 0)



    end

    def showArrayResult
        p @temp_arr
    end


end

ele = Merger.new([
    5, 20, 30, 45, 100
], [
    10, 25, 28, 40, 42
])
ele.makeMerge

ele.showArrayResult

