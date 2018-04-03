class Vampire
  @@vampries = []

  def initialize(name, age, in_coffin, drank_blood_today)
    @name = name
    @age = age
    @in_coffin = in_coffin
    @drank_blood_today = drank_blood_today
  end

  def name
    @name
  end

  def age
    @age
  end

  def in_coffin
    @in_coffin
  end

  def drank_blood_today
    @drank_blood_today
  end

  def in_coffin=(value)
    @in_coffin = value
  end

  def drank_blood_today=(value)
    @drank_blood_today = value
  end

  def self.create(name, age, in_coffin, drank_blood_today)
    @@vampire.push(Vampire.new(name, age, in_coffin, drank_blood_today))
    @@vampire.last
  end

  def drink_blood
    @drank_blood_today = true
  end

  def sunrise
    @@vampries.each do |vampire|
      if !vampire.in_coffin && !vampire.drank_blood_today
        @@vampires.delete(vampire)
      end
    end
  end
end
