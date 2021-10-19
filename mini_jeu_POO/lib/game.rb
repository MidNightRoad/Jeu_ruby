
class Game
  attr_accessor :humanplayer, :ennemis
  def initialize(name)
    @humanplayer= humanplayer
    humanplayer= HumanPlayer.new(name)
    player1 = Player.new("Jose")
    player2 = Player.new("Garcia")
    player3 = Player.new("Michel")
    player4 = Player.new("Didier")
    ennemis = [player1, player2, player3, player4]
    @ennemis = ennemis
  end
  
  
  def kill_player(x)
    @ennemis.delete(@ennemis[x])
  end
 
  def is_still_ongoing?
    if  @ennemis.length > 0
       true
    else
       false
    end
  end
  def show_players
   puts humanplayer.life_point
   puts ennemis.length
  end
  def menu 
    puts "
    Quelle action veut-tu faire ??
  
    a - chercher une meilleure arme
    s - chercher à se soigner 

    Attaquer un joueur en vue :"
    if ennemis[0].life_point > 0
      puts "0 - #{ennemis[0].name} à #{ennemis[0].life_point} point de vie"
    else
      game.kill_player[0]
    end
    if ennemis[1].life_point > 0
      puts "1 - #{ennemis[1].name} à #{ennemis[1].life_point} point de vie"
    else
      game.kill_player[1]
    end
    if ennemis[2].life_point > 0
      puts "2 - #{ennemis[2].name} à #{ennemis[2].life_point} point de vie"
    else
      game.kill_player[2]
    end
    if ennemis[3].life_point > 0 
      puts "3 - #{ennemis[3].name} à #{ennemis[3].life_point} point de vie"
    else 
      game.kill_player[0]
    end

    "Ecrit ton choix"
    print ">"
    
    choose = gets.chomp
    if choose == "a"
     player3.search_weapon
    elsif choose == "s"
     player3.search_life_pack
    elsif choose == "0"
     humanplayer.attack(ennemis[0])
    elsif choose == "1"
      humanplayer.attack(ennemis[1])
    elsif choose ==  "2"
      humanplayer.attack(ennemis[2])
    elsif choose == "3"
      humanplayer.attack(ennemis[3])
    else
      puts "Choix incorect"
    end
  end
  def ennemis_attack
    puts "ATTENTION ON T'ATTAQUE"
    sleep 2
    ennemis.each do |player|
      if player.life_point <= 0
        puts "#{player.name} est mort, il ne peut plus attaquer "
      else
        player.attack(player3)
      end
    end 
  end
  def end 
    if player3.life_point >0
      puts"TU AS GAGNÉ !! BRAVO"
    else
    puts "DOMMAGE, TU AS PERDU"    
    end
  end
    
end


