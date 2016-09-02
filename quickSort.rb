#Ruby

$comparison = 0
class Array
  def quick_sort_head(l,r)
    # puts "l = #{l}, r = #{r}"
    return self if self.length <= 1
    $comparison = $comparison + r - l 
    p = l
    i = j = l+1
    
    middle = ((l+r) / 2).to_i

    
    # self.swap(l,r)
    # self.swap(l,middle)
    
    if self[l] > self[middle]
      if self[middle] > self[r]
        self.swap(l,middle)
      elsif self[r] < self[l]
        self.swap(l,r)
      else
        p = l
      end

    else
      if self[l] > self[r]
        p = l
      elsif self[r] < self[middle]
        self.swap(l,r)
      else
        self.swap(l,middle)
      end
    end
    
    while j <= r
      if self[j] < self[p]
        self.swap(i,j)
        i += 1
      end
      j += 1
    end
    self.swap(p,i-1)
    p = i-1
    
    self.quick_sort_head(l,p-1) if p > l+1
    self.quick_sort_head(p+1,r) if r > p+1
    

    return self

  end

  def quick_sort_bottom(l,r)
    # puts "l = #{l}, r = #{r}"
    # puts "-------- begin --------"
    # puts self[l..r]
    return self if self.length <= 1
    # puts "-- comparison: #{$comparison} + #{r - l}"
    $comparison = $comparison + r - l 
    
    p = r
    i = j = l
    
    
    while j < r
      if self[j] < self[p]
        # puts "---"
        # puts "i :#{i}, j:#{j}"
        self.swap(i,j)
        # puts self[l..r]
        i += 1
      end
      j += 1
    end
    # puts "---"
    # puts "i :#{i}, j:#{j}"
    
    # if i != l
      self.swap(p,i) 
      # puts self[l..r]
      p = i
    # end
    
    
    self.quick_sort_bottom(l,p-1) if p > l+1
    self.quick_sort_bottom(p+1,r) if r > p+1
    

    return self

  end

  def quick_sort_middle(l,r)
    # puts "l = #{l}, r = #{r}"
    return self if self.length <= 1
    $comparison = $comparison + r - l 
    middle = ((l+r) / 2).to_i
    p = middle
    i = j = l
    
    
    while j <= r
      if i < p
        if self[j] < self[p]
          self.swap(i,j)
          i += 1
        end
        j += 1
      elsif i > p
        if self[j] < self[p]
          self.swap(i,j)
          i += 1
        end
        j += 1
      else

        i += 1  
      end
      
    end
    
    if p < i
      self.swap(p,i-1)
      p = i-1
    else
      self.swap(p,i)
      p = i-1
    end
    
    
    
    self.quick_sort_bottom(l,p-1) if p > l+1
    self.quick_sort_bottom(p+1,r) if r > p+1
    

    return self

  end

  def swap(i, j)
     temp = self[i]
     self[i] = self[j]
     self[j] = temp
  end
end

random_names = File.readlines("hw2.txt")
intArray = random_names.map(&:to_i)

ha = [2,6,14,18,26,20,4,10,50,12]
ha2 = [4,14,10,6,2]

puts intArray.quick_sort_head(0,9999)
# puts intArray.quick_sort_bottom(0,9999)
# puts intArray.quick_sort_middle(0,9999)
# puts ha.quick_sort_middle(0,7)
# ha.quick_sort_bottom(0,9)
# puts "=====final====="
# puts ha
puts "comparison: #{$comparison}"


# head:162085
# bottom:164123
# middle:150657
# total:138382