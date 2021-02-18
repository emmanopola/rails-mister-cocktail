require 'json'
require 'open-uri'

puts "cleaning database"
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient_parse = JSON.parse(ingredient_serialized)

ingredient_parse['drinks'].each do |i|
  ingredient = Ingredient.create(name: i["strIngredient1"])
  puts "Created #{ingredient.name}"
end
