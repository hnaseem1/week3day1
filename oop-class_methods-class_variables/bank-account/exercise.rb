class BankAccount

  @@interest_rate = 0.06
  @@accounts = []

  def initialize
    @balance = 0
  end
  def balance
    @balance
  end

  def interest
    @balance * @@interest_rate
  end

  def deposit(value)
    @balance += value
  end
  def withdraw(value)
    @balance -= value
  end

  def self.create
    @@accounts.push(BankAccount.new)
    return @@accounts[@@accounts.length - 1]
  end

  def self.total_funds
    sum = 0
    @@accounts.each do |a|
    sum += a.balance
    end
    return sum
  end

  def self.interest_time
    @@accounts.each do |a|
    a.deposit(a.interest)
    end
  end

end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
