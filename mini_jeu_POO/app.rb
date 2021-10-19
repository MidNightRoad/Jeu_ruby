require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def perso 
  player1 = Player.new("Jose")#lance un objet de type pilote
  player2 = Player.new("Garcia")
return player1,player2
end 
def fight (player1,player2)
 puts "POPOPO , c'est l'heure du FIGHT "
 sleep 2
 puts "Aujourd'hui on a #{player1.name} avec #{player1.life_point} de vie !! Il est chaud comme la braise !"
 sleep 2
 puts "Ensuite , la legende #{player2.name} avec #{player2.life_point} de vie !! Chaud comme une barraque a frites !"
 sleep 2 
 while player1.life_point >= 0 && player2.life_point >= 0 #Boucle while qui tourne tant que la condition n'est pas atteinte 
   if player2.life_point <= 0
     break
   else
   player2.attack(player1)
   puts "---------------------------------"
      sleep 5
   end
   if player1.life_point <= 0
     break
   else
     player1.attack(player2)
   puts "---------------------------------"
     sleep 5
   end
 end
end 
def process
  player1,player2 = perso
  fight(player1,player2)
end 
process

