#!/usr/bin/ruby
require './Algorithm'
require 'colorize' 

class TimedSort
  include Algorithm
  
  # Uses instance_methods to populate menu
  def get_menu
    sorted_methods = Algorithm.instance_methods.sort
    puts ''
    puts 'Choose an Algorithm'.red
    sorted_methods.each do |a |
      puts "#{sorted_methods.index(a) + 1}: #{a}" 
    end
    response = gets.chomp!
    clear_terminal
    route_input(response)
  end

  # Clears terminal - works on Windows, MacOS, and Linux
  def clear_terminal
    RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i ? system('cls') : system('clear')
  end

  def restart_loop
    get_menu
  end

  def route_input(response)
    case response.downcase
    when "1"
      bubble_sort(generate_random_array)
    when "2", "3"
      heap_sort(generate_random_array)
    when "4"
      insertion_sort(generate_random_array)
    when "5", "6"
      merge_sort(generate_random_array)
    when "7"
      quick_sort(generate_random_array)
    when "8"
      ruby_sort(generate_random_array)
    when "9"
      selection_sort(generate_random_array)
    end
  end
  
  def set_array_size
    puts "How many elements do you want in the array?"
    response = gets.chomp!
  end



  # Creates big array that is used for sorting.
  def generate_random_array  
    big_array = []
    # Adjust this value to to increase/decrease array size used for sorting.
    i = 100
    
    while i >= 1 
      big_string = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
      big_array << big_string
        i = i - 1      
      end
      big_array       
  end

  #TODO - Add a loading bar while sorting is occuring
  def loading_bar
    loading_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    1.upto(loading_array.length.to_i) do |i|
      printf("\rCycles Complete: %d", i)
      sleep(0.1)
    end
  end

end
timer = TimedSort.new
timer.get_menu
