def factors(num)
    factors = []
  
    (1..num).each do |ele|
      factors << ele if num % ele == 0
    end
    factors
end

def subwords(str, arr)
    arr.select do |word|
        if str.include?(word)
            word
        end
    end
end

def doubler(arr)
    doubled = []
    arr.each do |num|
        doubled << num * 2
    end
    doubled
end

class Array

    def bubble_sort!(&prc)
        prc ||= Proc.new{ |num1, num2|  num1 <=> num2 }

        sorted = false
        while !sorted
            sorted = true
            (0...self.length-1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self[i]

                    sorted = false
                end
            end
        end
        self
    end

    def bubble_sort(&prc)
        self.dup.bubble_sort!(&prc)
    end

    def my_each
        i = 0
        while i < self.length
            yield self[i]
            i+=1
        end
        self
    end

    def my_map
        mapped = []
        self.each do |ele|
            mapped << yield(ele)
        end
        mapped
    end

    def my_select
        selected = []
        self.each do |ele|
            selected << ele if yield(ele)
        end
        selected
    end

    def my_inject(acc = nil, &prc)
        arr = self.dup
        acc ||= arr.shift
        arr.each do |ele|
            acc = prc.call(acc, ele)
        end
        
        acc
    end
        


end
        


