module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    self.my_each do |elem|
      yield(elem, index)
      index += 1
    end
  end

  def my_select
    res = []
    self.my_each do |elem|
      res.push elem if yield(elem)
    end
    res
  end

  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end
  
  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end
  
  def my_none?
    self.my_each do |elem|
      return false if yield(elem) 
    end
    true
  end

  def my_count
    return self.size unless block_given?

    count = 0
    self.my_each do |elem|
      count += 1 if yield(elem)
    end
    count
  end

  def my_map
    arr = []
    self.my_each do |elem|
      arr << yield(elem)
    end
    arr
  end

  def my_inject(initial_value)
    res = initial_value
    self.my_each do |elem|
      res = yield(res, elem)
    end
    res
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield elem
    end

    self
  end
end
