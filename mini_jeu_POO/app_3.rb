require 'bundler'
require 'pry'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/playerv2'
 
puts"
 ------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts "Cree un nouveau personnage \n Le nom de ton personnage : "
print ">" 
name = gets.chomp
game=Game.new(name) 
while game.is_still_ongoing?
  game.menu 
  game.ennemis_attack
end