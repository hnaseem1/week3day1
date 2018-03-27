class

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
end

  def encounter

  end

  def outrun_zombie?

  end

  def servive_attack?

  end


# Below are all the class methods


