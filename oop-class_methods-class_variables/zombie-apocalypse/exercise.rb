require 'pry'
class Zombie

  @@horde = []
  @@plague_level = 10 # Will increase
  @@max_speed = 5 # Will remain the same
  @@max_strength = 8 # Constant
  @@default_speed = 1 # Constant
  @@default_strength = 3 #Constant

# Below are all the instance methods
  def initialize(speed, strength)
    if speed > @@max_speed
      @speed = @@max_speed
    elsif strength <= @@default_strength
      @strength = @@default_strength
    else
      @strength = strength
      @speed = speed
    end
  end
    # binding.pry
  def encounter

    # This instance method represents you coming across a zombie! This can end in three possible outcomes: 1. escaping unscathed 2. being killed by the zombie 3. catching the plague and becoming a zombie yourself.

    #
    # This method should call outrun_zombie? (see below) and survive_attack? (see also below) to determine which scenario applies. In the case that you are turned into a zombie (ie. you don't outrun the zombie but you aren't killed by it), create a new zombie object (that's you!) and add it to the @@horde.
    #
    # In all three cases you should return a string that describes what happened to you in the encounter (eg. "You escaped!").


    if !outrun_zombie? && survive_attack?
      @@horde.push(Zombie.new(10, 10))
      return "You Are A Zombie Now!!"

    elsif !outrun_zombie? && !survive_attack?
      return "You Are A Dead!"

    elsif outrun_zombie? && survive_attack?
        return "You escaped!"
    end
  end

  def outrun_zombie?

    if (Random.rand(@@max_speed.abs + 1)+1) > @speed
      true
    else
      false
    end
  end

  def survive_attack?

    if (Random.rand(@@max_strength.abs + 1)+1) > @strength
      true
    else
      false
    end
  end

# Below are all the class methods

  def self.all
    @@horde
  end

  def self.some_die_off
    random = Random.rand(@@horde.length + 1) + 1
      random.times do
        @@horde.delete_at(2)
      end
  end

  def self.spawn
    Random.rand(@@plague_level.abs + 1).times do
      @@horde.push(Zombie.new(Random.rand(@@max_speed.abs + 1), Random.rand(@@max_strength.abs + 1)))
    end
  end

  def self.increase_plague_level
      @@plague_level += Random.rand(3)
  end


  def self.new_day

    self.spawn
    self.some_die_off
    self.increase_plague_level

  end
end

puts Zombie.all.inspect # []
Zombie.new_day
# binding.pry
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
