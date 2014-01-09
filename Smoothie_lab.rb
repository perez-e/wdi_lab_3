# Instructions are written inline.
 
# docs you may enjoy
# http://www.ruby-doc.org/core-2.0/Hash.html
# http://ruby-doc.org/core-2.0/String.html
# http://ruby-doc.org/core-2.0/Array.html
 
# Every Morning I make a smoothie with the follow ingredients:
smoothie_ingredients = {
  'flax seeds' => '1 tbsp',
  'chia seeds' => '1 tbsp',
  'coconut flakes' => '1 tbsp',
  'spirulina' => '1 tsp',
  'pumpkin seeds' => '1 tbsp',
  'oatmeal' => '1/4 cup',
  'coco powder' => '1 tbsp',
  'peanut butter' => '1 tbsp',
  'almonds' => '1/4 cup',
  'walnuts' => '1/4 cup',
  'spinach' => '1/4 cup',
  'greek yogurt' => '1/4 cup',
  'nutrional yeast' => '1 tbsp',
  'brussel sprouts' => '1/4 cup',
  'asparagus' => '1/4 cup',
  'kale' => '1/4 cup',
  'brocoli rabe' => '1/4 cup',
  'blue berries' => '1/4 cup',
  'chopped banana' => '1/2 cup',
  'straw berries' => '1/4 cup',
  'mango' => '1/4 cup',
  'hemp milk' => '1 cup'
}
 
# Write a function called blend.
# It should take all the smoothie ingredients (not the measurements) and chop up and mix all the characters
# and output a mixed string of characters
# Be sure to remove the spaces, as we don't want any air bubbles in our smoothie!
 
def blend(smoothie_ingredients)
  string_ingredients = ""
  smoothie_ingredients.each_key {|ingredient| string_ingredients << ingredient}
  string_ingredients.delete(" ").split("").shuffle.join("")
end
 
 
# create a class called Blender
# It should have a method that takes an array of ingredients and returns a mixed string of characters.
# Give the blender an on and off switch and only allow the blender to function when it's on.
# FOR SAFETY'S SAKE When you create a new blender by default it should be off.
# Blend the the smoothie array
 
class Blender
  attr_reader :ingredients, :switch
  def initialize
    @ingredients=nil
    @switch = "off"
  end

  def put_ingredients=(ingredients)
    if @switch == "off"
        @ingredients = ingredients
    elsif @switch == "on"
        puts "You can't put ingredients with the blender turned on"
        puts "TURN OFF BLENDER!"
    end 
  end

  def turn_on
    @switch = "on"
  end

  def blend
    if @switch == "on" && @ingredients
      ingredients = @ingredients
      string_ingredients = ""
      ingredients.each {|ingredient| string_ingredients << ingredient}
      string_ingredients.delete(" ").split("").shuffle.join("")
    elsif @switch == "off"
      puts "The blender won't function!! It's turned off!"
      puts "TURN ON THE BLENDER!"
    else
      puts "No ingredents in the blender."
    end
  end

  def turn_off
    @switch = "off"
  end

  def start(ingredients)
    puts "Do you have the ingredieints? [y/n]"
    res = gets.chomp
    if res == "y"
      self.put_ingredients=(ingredients)
      puts "Turn on the blender? [y/n]"
      response = gets.chomp
      if response == "y"
        turn_on
        puts "ready to blend? [y/n]"
        response_2 = gets.chomp
        if response_2 == "y"
            while @switch == "on"
              puts blend
              puts "Ready to turn off the blender? [y/n]"
              response_3 = gets.chomp
              if response_3 == "y"
                turn_off
                puts "Hooray, your smoothie is done."
              end
            end
        elsif response_2 == "n"
          puts "Okay no smoothie for you, and stay hungry forever and die!"
        else
          puts "I didn't understand you."
          start(ingredients)
        end
      elsif response == "n"
        puts "no smoothie for you!"
      else
        puts "I didn't understand you"
        start(ingredients)
      end
    elsif res == 'n'
      puts "No smoothie for you!"
    else
      puts "I didn't understand you!"
      start(ingredients)
    end
  end
 
end

# first exercise test
puts blend(smoothie_ingredients)
puts

# second exercise test
blender = Blender.new.start(smoothie_ingredients.keys)