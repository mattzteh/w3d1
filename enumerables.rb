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
            if ele.kind_of?Array
                flattened += ele.my_flatten
            else
                flattened << ele
            end
        end
        flattened
    end


end
    


# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


