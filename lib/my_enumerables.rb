module Enumerable
  # Your code goes here
  def my_each
    i = 0
    if block_given?
      while i < self.length do
        yield(self[i])
        i+=1
      end
    end
    self
  end

  def my_each_with_index
    i = 0
    if block_given?
      while i < self.length do
        yield(self[i], i)
        i+=1
      end
    end
    self
  end

  def my_select
    array = []

    self.my_each { |n| array << n if yield(n) }
    return array
  end

  def my_all?
    answer = true
    self.my_each { |n| answer = false unless yield(n) }

    return answer
  end

  def my_none?
    answer = true
    self.my_each { |n| answer = false if yield(n) }
    return answer
  end

  def my_count
    idx = 0
    if block_given?
      self.my_each { |n| idx+=1 if yield(n)}
    else
      self.my_each { idx+=1 }
    end
    return idx
  end

  def my_map
    array = []
    self.my_each { |n| array << yield(n) }
    return array
  end

  def my_inject(initial)
    results = initial
    self.my_each { |n| results = yield(results, n) }
    return results
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
end
