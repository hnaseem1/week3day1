class Book
  @@on_shelf = [] #available books
  @@on_loan = [] #borrowed


# INSTANCE METHODS
  # def due_date
  #
  #   #reader and writer method
  #
  # end

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @due_date
  end

  def borrow

    #check using lent_out? return false if false
    if lent_out?
      return false
    else
      @due_date = Book.current_due_date
      @@on_loan.push(Book.new(@title, @author, @isbn))
      @@on_shelf.each do |book|
        if @isbn == book.isbn
          @@on_shelf.delete(book)
        end
        true
      end
    end
    end
    #else current_due_date and remove it from @@on_shelf move to @@on_loan and return true

  def return_to_library
    if lent_out?
      @@on_shelf.push(Book.new(@title, @author, @isbn))
      @due_date = nil
      @@on_loan.each do |book|
        if @isbn == book.isbn
          @@on_loan.delete(book)
        end
      end
      return true
    else
      return false
    end
  end

  def due_date
    return @due_date
  end

  def lent_out?
    @@on_shelf.each do |book|
      if @isbn == book.isbn
        return false
      end
    end
    return true
  end

  def isbn
    @isbn
  end

#CLASS MATHODS
  def self.create(title, author, isbn)
    @@on_shelf.push(Book.new(title, author, isbn))
    return @@on_shelf[@@on_shelf.length-1]
  end

  def self.current_due_date
    @due_date = (Time.new + (60*60*24*7))
  end

  def self.overdue_books
    overdue = []
    @@on_loan.each do |book|
      if book.due_date == !nil
        if book.due_date < Time.now
          overdue.push(book)
        end
      end
    end
    return overdue
  end

  def self.browse
    @@on_shelf[Random.rand(@@on_shelf.length)]
  end

  def self.available
    return @@on_shelf
  end

  def self.borrowed
    return @@on_loan
  end

end


sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect # #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.available.inspect # [#<Book:0x00555e82acde20 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431">, #<Book:0x00555e82acdce0 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # []
puts sister_outsider.lent_out? # false
puts sister_outsider.borrow # true
puts sister_outsider.lent_out? # true
puts sister_outsider.borrow # false
puts sister_outsider.due_date # 2017-02-25 20:52:20 -0500 (this value will be different for you)
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # [#<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=2017-02-25 20:55:17 -0500>]
puts Book.overdue_books.inspect # []
puts sister_outsider.return_to_library # true
puts sister_outsider.lent_out? # false
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">, #<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=nil>]
puts Book.borrowed.inspect # []
