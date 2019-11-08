require "pry"
require "colorize"

class Foods 
  attr_accessor :main, :side
  def initialize
    @main = [
      { name:"Salmon", price: 15 }, 
      { name:"Chicken", price: 12 },
      { name:"Stirfry", price: 11 },
      { name:"Burger", price: 10 },
      { name:"Veggie Sandwich", price: 10 }
    ]
    @side = [ 
      { name:"Veggies", price: 4 }, 
      { name:"Mac and Cheese", price: 5 },
      { name:"Fries", price: 3 },
      { name:"Salad", price: 4 },
      { name: "Fruit", price: 5 } 
    ]
  end 
end 

class Order
  attr_accessor :meal, :price 
  def initialize
    @meal = [] 
    @price = []
  end 
end 

class LunchLady < Foods
  def initialize
    @foods = Foods.new
    @order = Order.new
    seperator
    puts "~~Lunch Lady~~".yellow
    puts
    seperator
    puts "Welcome #{user.name}!".cyan
    seperator
    choose_meal
  end

  def seperator
    puts "*" * 10
    puts
  end

  def user 
    puts "Enter name:".cyan
    user_name = gets.strip
    User.new(user_name)
  end

  def choose_meal
    @total = []
    seperator
    puts "Choose your Main Dish".cyan
    @foods.main.each_with_index { |food, index|
      puts "#{index + 1}) #{food[:name]} $#{food[:price]}".blue.on_white }
    choice = gets.to_i 
    case choice 
      when 1 
        @order.meal << @foods.main[choice - 1]
        @total << @foods.main[choice - 1][:price]
        side_dish1
      when 2
        @order.meal << @foods.main[choice - 1]
        @total << @foods.main[choice - 1][:price]
        side_dish1
      when 3
        @order.meal << @foods.main[choice - 1]
        @total << @foods.main[choice - 1][:price]
        side_dish1
      when 4
        @order.meal << @foods.main[choice - 1]
        @total << @foods.main[choice - 1][:price]
        side_dish1
      when 5
        @order.meal << @foods.main[choice - 1]
        @total << @foods.main[choice - 1][:price]
        side_dish1
      else
        puts "Invalid choice, try again (hint: pick a number)".red
        choose_meal
      end 
  end

  def side_dish1
    seperator
    puts "Select your first side dish".cyan
    @foods.side.each_with_index { |food, index|
    puts "#{index + 1}) #{food[:name]} $#{food[:price]}".blue.on_white }
    
    choice_1 = gets.to_i 

    case choice_1 
      when 1 
        @order.meal << @foods.side[choice_1 - 1]
        @total << @foods.side[choice_1 - 1][:price]
        @foods.side.delete_at(choice_1 - 1)
        side_dish2
      when 2
        @order.meal << @foods.side[choice_1 - 1]
        @total << @foods.side[choice_1 - 1][:price]
        @foods.side.delete_at(choice_1 - 1)
        side_dish2
      when 3
        @order.meal << @foods.side[choice_1 - 1]
        @total << @foods.side[choice_1 - 1][:price]
        @foods.side.delete_at(choice_1 - 1)
        side_dish2
      when 4
        @order.meal << @foods.side[choice_1 - 1]
        @total << @foods.side[choice_1 - 1][:price]
        @foods.side.delete_at(choice_1 - 1)
        side_dish2
      when 5
        @order.meal << @foods.side[choice_1 - 1]
        @total << @foods.side[choice_1 - 1][:price]
        @foods.side.delete_at(choice_1 - 1)
        side_dish2
      else
        puts "Invalid choice, try again (hint: pick a number)".red
        side_dish1 
      end 
  end

  def side_dish2 
    seperator
    puts "Select your second side dish".cyan
    @foods.side.each_with_index { |food, index|
    puts "#{index + 1}) #{food[:name]} $#{food[:price]}".blue.on_white}
    choice_2 = gets.to_i 

    case choice_2
      when 1
        @order.meal << @foods.side[choice_2 - 1]
        @total << @foods.side[choice_2 - 1][:price]
        total
      when 2
        @order.meal << @foods.side[choice_2 - 1]
        @total << @foods.side[choice_2 - 1][:price]
        total
      when 3
        @order.meal << @foods.side[choice_2 - 1]
        @total << @foods.side[choice_2 - 1][:price]
        total
      when 4
        @order.meal << @foods.side[choice_2 - 1]
        @total << @foods.side[choice_2 - 1][:price]
        total
      when 5
        @order.meal << @foods.side[choice_2 - 1]
        @total << @foods.side[choice_2 - 1][:price]
        total
      else 
        puts "Invalid choice, try again (hint: pick a number)".red
        side_dish2
      end 
  end
  
  def total
    seperator
    puts "Your complete order:".yellow
    puts
    @order.meal.each { |lunch| puts "> #{lunch[:name]}".blue.on_white }
    puts
    puts "Total cost $#{@total.inject(:+)}".blue.on_white
    puts
    seperator
    puts "Thanks for ordering!".cyan
    puts
    seperator
    order_again?
  end
  
  def order_again?
    puts "Would you like to order again?".cyan
    puts "If yes, type 'yes'!"
    puts "If no, type literally anything else."
    seperator
    input = gets.strip
    if input == "yes" 
      choose_meal
    else
      puts "Ok byeeeee".yellow
      exit
    end
  end

end


class User
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

LunchLady.new