class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        selected = []
        self.my_each do |ele|
            selected << ele if prc.call(ele)
        end
        selected
    end

    def my_reject(&prc)
        rejected = []
        self.my_each do |ele|
            rejected << ele if !prc.call(ele)
        end
        rejected
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false

    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten
        flattened = []
        self.each do  |ele| 
            if ele.kind_of?(Array)
                flattened += ele.my_flatten
            else
                flattened << ele
            end
        end
        flattened
    end

    def my_zip(*arrs)
        zipped = []
        (0...self.length).each do |i|
            subarr = [self[i]]
            arrs.each do |arr|
                subarr << arr[i]
            end
            zipped << subarr
        end
        zipped
    end

    def my_rotate (num=1)
        rotated = (self[0]..self[-1]).to_a
        if num > 0
            num.times do
                shifted = rotated.shift
                rotated.push(shifted)
            end
        else
            (num*(-1)).times do 
                popped = rotated.pop
                rotated.unshift(popped)
            end
        end
        rotated
    end

    def my_join(data=nil)
        joined = ""
        self.each_with_index do |ele, i|
            if data == nil || i == self.length - 1
                joined += ele
            else i != self.length - 1
                joined += (ele += data)
            end
        end
        joined
    end

    def my_reverse
        reversed = []
        i = self.length - 1
        while i >= 0
            reversed << self[i]
            i -= 1
        end
        reversed
    end
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
    
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]




