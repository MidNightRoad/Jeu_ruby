require 'bundler'
require 'pry'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/playerv2'#modifier ici si besoin pour corection

#ATTENTION fonctionne avec playerv2 juste pour un aspect esthetique ! peux fonctionner aussi 
#avec le fichier player de base 
def accueil 
puts"
 ------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts "Cree un nouveau personnage \n Le nom de ton personnage : "
print ">" 
name = gets.chomp

player1 = Player.new("Jose")
player2 = Player.new("Garcia")
player3 = HumanPlayer.new(name)
ennemis = [player2, player1]
return player1,player2,player3,ennemis
end 
def fight(player1,player2,player3,ennemis)
while player3.life_point >0 && (player1.life_point > 0 || player2.life_point >0)#la boucle de s'arrete que pour deux condition, soit player3 n'a plus de vie soit player1 et 2 
   puts " Tu a #{player3.life_point} point de vie "
   sleep 5
   puts "
    Quelle action veut-tu faire ??
  
    a - chercher une meilleure arme
    s - chercher à se soigner 

    Attaquer un joueur en vue :
    
    0- Garcia a #{player2.life_point} points de vie
    1 - José a #{player1.life_point} points de vie 
    
    Ecrit ton choix"
    print ">"
    choose = gets.chomp#applique pour chaque reponse la methode a appliquer 
    if choose == "a"
     player3.search_weapon
    elsif choose == "s"
     player3.search_life_pack
    elsif choose == "0"
     player3.attack(player2)
    elsif choose == "1"
     player3.attack(player1)  
    else 
      puts "Choix incorect"
    end
    sleep 5
    puts "#{player1.name} a #{player1.life_point}"
    puts "#{player2.name} a #{player2.life_point}"
    puts "Tu as #{player3.life_point} de point de vie "
    sleep 2
    puts "ATTENTION ON T'ATTAQUE"
    sleep 2
    ennemis.each do |player|#dans l'array prend chaque player
      if player.life_point <= 0#si 0 de point de vie ne peux pas attaquer 
        puts "#{player.name} est mort, il ne peut plus attaquer "
      else
        player.attack(player3)#attaque si il a encore des points de vie 
      end
    end
  end
end
  
  
def fight_end (player3)#fin du jeu
  if player3.life_point >0
    puts"TU AS GAGNÉ !! BRAVO"
  else
    puts "DOMMAGE, TU AS PERDU"    
  end
end
def process
  player1,player2,player3,ennemis=accueil
  fight(player1,player2,player3,ennemis)
  fight_end(player3)
end
process
                                                        





