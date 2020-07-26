module Algorithm
  
  def bubble_sort(array)
    return array if array.size <= 1
    swap = true
    start = Time.now
      while swap
        swap = false
        (array.length - 1).times do |x|
          if array[x] > array[x+1]
            array[x], array[x+1] = array[x+1], array[x]
            swap = true
          end
        end
      end
    array
    finish = Time.now
    diff = finish - start
    puts "The Bubble Sort completed in #{diff} seconds.".green
    sleep(2)
    restart_loop
  end

  def ruby_sort(array)
    start = Time.now
    array.sort
    finish = Time.now
    diff = finish - start
    puts "The Ruby Sort completed in #{diff} seconds.".green
    sleep(2)
    restart_loop
  end

  

  def insertion_sort(array)
    start = Time.now
    (array.length).times do |j|
      while j > 0
        if array[j-1] > array[j]
          array[j], array[j-1] = array[j-1], array[j]
        else
          break
        end
        j-=1
      end
    end
    array
    finish = Time.now
    diff = finish - start
    puts "The Insertion Sort completed in #{diff} seconds.".green
    sleep(2)
    restart_loop
  end

  def selection_sort(array)
    start = Time.now
    n = array.length - 1
    n.times do |i|
      min_index = i
      for j in (i + 1)..n
        min_index = j if array[j] < array[min_index]
      end
      array[i], array[min_index] = array[min_index], array[i] if min_index != i
    end
    array
    finish = Time.now
    diff = finish - start
    puts "The Selection Sort completed in #{diff} seconds.".green
    sleep(2)
    restart_loop
  end

  def merge_sort(array)
    start = Time.now
    if array.length <= 1
      array
    else
      mid = (array.length / 2).floor
      left = merge_sort(array[0..mid-1])
      right = merge_sort(array[mid..array.length])
      finish = Time.now
      diff = finish - start
      puts "The Merge completed in #{diff} and seconds.".green  
      merge(left, right)
    end
  end
  
  def merge(left, right)
    diff_1 = diff_1.to_i
    start = Time.now
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left[0] < right[0]
      [left[0]] + merge(left[1..left.length], right)
    else
      [right[0]] + merge(left, right[1..right.length])
    end
    finish = Time.now
    diff = finish - start
    puts "The Merge Sort completed in #{diff} and seconds.".green
    sleep(2)
    restart_loop
  end
end