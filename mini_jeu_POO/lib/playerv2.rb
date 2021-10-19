class Player 
  attr_accessor :name, :life_point

  def initialize(name)
    @name= name 
    @life_point= 10
  end


  def show_state
    puts "  #{@name} a #{@life_point} de points de vie et un arme de niveau #{@weapon_level} "
  end

  def gets_damage(compute_damage)
    @life_point= life_point - compute_damage
  return compute_damage
    
  end
  def self.name 
    return @name
  end
  def self.life_point
    return @life_point
  end
  
  def attack(player_attacked)
     puts " #{@name} attaque comme une pute #{player_attacked.name}"
     puts"Il inflige #{player_attacked.gets_damage(compute_damage)} de degats "
  end


  def compute_damage
    return rand(1..6)
  end
end
class HumanPlayer < Player
  attr_accessor :weapon_level
  
  def initialize (name)
    super (name)#rapellle la methode name dans la class parent (player)
      life_point = 100
      @life_point = life_point
      weapon_level = 1
      @weapon_level = weapon_level
    
  end
  def compute_damage
    return rand(1..6) * @weapon_level
  end
  def search_weapon
    level= rand(1..6)
    puts "Tu a trouve une arme de level #{level}"
    if @weapon_level < level #si l'arme de base est inferieur a celle trouvé , change le niveau de l'arme  de level #{level}"
      puts "Daim , mieux , tu passe d'un level #{@weapon_level} a #{level}"
      dif =  level - @weapon_level#clacule la difference entre les deux armes 
      @weapon_level = @weapon_level + dif #rajoute la difference a weapon pour modifier le niveau
    elsif @weapon_level >= level
      puts "Pas ouf reste sur ton arme de base va "
    end 
  end
  def self.weapon_level
    return @weapon_level
  end 
  def search_life_pack
    chatte = rand(1..6)# Calcule si la chatte est presente ou pas
    if chatte == 1
      puts chatte 
      puts "AIE COUP DUR , Tu ne trouve pas de pack de vie "
    elsif chatte == 6 
      puts chatte 
      puts "Quelle chatte , tu gagne +80 de point de vie"
      @life_point = life_point + 80 
    else
      puts chatte 
      puts "Pas deguelasse tu gagne +50 point de vie"
      @life_point = life_point + 50 
    
    end
  end





















end