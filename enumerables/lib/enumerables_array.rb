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