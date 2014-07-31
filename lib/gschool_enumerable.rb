module GschoolEnumerable
  def g_each  #iterating over an array w/out "each", this is how "each" is created... this is an impliciate block
    for item in self  #for loop... item is a madeup local variable
      yield(item)   #yield means to relinquish control of "item"
    end
    return self  #returns orig array
  end

  # def g_each(&block)  ##this is an explicit block
  #   for item in self
  #     block.call(item)
  #   end
  #   return self
  # end

  def g_select
    ary = []  #create a new array
    self.g_each do |item|
      ary << item if yield(item)
    end
    return ary  #returns a new array
  end

  def g_reject
    ary = []
    self.g_each do |item|
      ary << item if(!yield(item))
    end
    return ary
  end

  def g_map #stopped here
    ary = []
    self.g_each do |item|
      ary << item if yield(item)
    end
    return ary
  end

  def g_select!
    self.g_each do |item|
      self.delete(item) if (!yield(item))
    end
  end


end



