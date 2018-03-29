class Game
    attr_accessor :p1Board, :p2Board
    def initialize
        puts ""
        @p1Board = Board.new
        @p2Board = Board.new
    end
    def play
        while true
            @p1Board.showwithships
            @p2Board.shownoships    
            puts "Player ONE, where would you like to shoot?"
            @p2Board.checkhit(p2Board.converty)
            if (@p2Board.checkForLose)
                puts "Player Two Lost!!!"
                break
            end
            @p2Board.showwithships
            @p1Board.shownoships
            puts "Player two, where would you like to shoot?"
            @p1Board.checkhit(p2Board.converty)
            if (@p2Board.checkForLose)
                puts "Player One Lost!!!"
                break
            end
        end
    end
    def movie
      puts 'dear winner, I have a special treat for you'
      puts "Before you movie starts i ask you please be patient with the opening credits.  Peoples want to be noticed"
      puts "movie starts in 5"
      sleep(1)
      puts "movie starts in 4"
      sleep(1)
      puts "movie starts in 3"
      sleep(1)
      puts "movie starts in 2"
      sleep(1)
      puts "movie starts in 1"
      sleep(1)
      system("nc towel.blinkenlights.nl 23")
    end
end
class Board
    attr_accessor :lost
  def initialize
    @lost = false
  @arr = [['🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊'],
          ['🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊'],
          ['🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊'],
          ['🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊'],
          ['🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊'],
          ['🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊'],
          ['🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊'],
          ['🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊'],
          ['🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊'],
          ['🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊','🌊']]
          showwithships
          @ships = [Aircraft.new,Battleship.new,Submarine.new,Cruiser.new,Destroyer.new]
          @ships.each do |i|
            puts "place ship: #{i.class.name}"
            shipplacer( i.placeShip(converty))
            showwithships
          end
  end
  def checkForLose
    @ships.each do |i|
        if !i.sunk
            return false
        end
    end
            return true
  end
  def pboard
    " +---+---+---+---+---+---+---+---+---+---+
a| #{@arr[0][0]} | #{@arr[0][1]} | #{@arr[0][2]} | #{@arr[0][3]} | #{@arr[0][4]} | #{@arr[0][5]} | #{@arr[0][6]} | #{@arr[0][7]} | #{@arr[0][8]} | #{@arr[0][9]} |
 +---+---+---+---+---+---+---+---+---+---+
b| #{@arr[1][0]} | #{@arr[1][1]} | #{@arr[1][2]} | #{@arr[1][3]} | #{@arr[1][4]} | #{@arr[1][5]} | #{@arr[1][6]} | #{@arr[1][7]} | #{@arr[1][8]} | #{@arr[1][9]} |
 +---+---+---+---+---+---+---+---+---+---+
c| #{@arr[2][0]} | #{@arr[2][1]} | #{@arr[2][2]} | #{@arr[2][3]} | #{@arr[2][4]} | #{@arr[2][5]} | #{@arr[2][6]} | #{@arr[2][7]} | #{@arr[2][8]} | #{@arr[2][9]} |
 +---+---+---+---+---+---+---+---+---+---+
d| #{@arr[3][0]} | #{@arr[3][1]} | #{@arr[3][2]} | #{@arr[3][3]} | #{@arr[3][4]} | #{@arr[3][5]} | #{@arr[3][6]} | #{@arr[3][7]} | #{@arr[3][8]} | #{@arr[3][9]} |
 +---+---+---+---+---+---+---+---+---+---+
e| #{@arr[4][0]} | #{@arr[4][1]} | #{@arr[4][2]} | #{@arr[4][3]} | #{@arr[4][4]} | #{@arr[4][5]} | #{@arr[4][6]} | #{@arr[4][7]} | #{@arr[4][8]} | #{@arr[4][9]} |
 +---+---+---+---+---+---+---+---+---+---+
f| #{@arr[5][0]} | #{@arr[5][1]} | #{@arr[5][2]} | #{@arr[5][3]} | #{@arr[5][4]} | #{@arr[5][5]} | #{@arr[5][6]} | #{@arr[5][7]} | #{@arr[5][8]} | #{@arr[5][9]} |
 +---+---+---+---+---+---+---+---+---+---+
g| #{@arr[6][0]} | #{@arr[6][1]} | #{@arr[6][2]} | #{@arr[6][3]} | #{@arr[6][4]} | #{@arr[6][5]} | #{@arr[6][6]} | #{@arr[6][7]} | #{@arr[6][8]} | #{@arr[6][9]} |
 +---+---+---+---+---+---+---+---+---+---+
h| #{@arr[7][0]} | #{@arr[7][1]} | #{@arr[7][2]} | #{@arr[7][3]} | #{@arr[7][4]} | #{@arr[7][5]} | #{@arr[7][6]} | #{@arr[7][7]} | #{@arr[7][8]} | #{@arr[7][9]} |
 +---+---+---+---+---+---+---+---+---+---+
i| #{@arr[8][0]} | #{@arr[8][1]} | #{@arr[8][2]} | #{@arr[8][3]} | #{@arr[8][4]} | #{@arr[8][5]} | #{@arr[8][6]} | #{@arr[8][7]} | #{@arr[8][8]} | #{@arr[8][9]} |
 +---+---+---+---+---+---+---+---+---+---+
j| #{@arr[9][0]} | #{@arr[9][1]} | #{@arr[9][2]} | #{@arr[9][3]} | #{@arr[9][4]} | #{@arr[9][5]} | #{@arr[9][6]} | #{@arr[9][7]} | #{@arr[9][8]} | #{@arr[9][9]} |
 +---+---+---+---+---+---+---+---+---+---+
  1   2   3   4   5   6   7   8   9    10"
  end
  def showwithships
    b = pboard
    puts b
  end
  def converty 
    i = gets.chomp
    y = i.split('').first
    x = i.split('').last.to_i - 1
    arr = ['a','b','c','d','e','f','g','h','i','j']
    y = arr.index("#{y}")
    return [y,x]
  end
  def shownoships
    b = pboard
    newb = b.gsub(/[🚢]/, '🌊')
    puts newb
  end
def checkhit fir
      y = fir.first
      x = fir.last
      pos = @arr[y][x]
      if pos == '🚢'
        @arr[y][x] = pos.gsub(/[🚢]/,'💥')
      elsif pos == '💥'
        p 'why are you so stupid? you already fired there'
      elsif pos == '❎'
        p 'why are you so stupid? you already fired there'
      else
        @arr[y][x] = pos.gsub(/[🌊]/,'❎')
      end
      @ships.each do |i|
        i.hit(fir)
      end
  end
  def shipplacer loc
    loc.each do |i|
      y = i.split('').first.to_i   
      x = i.split('').last.to_i
      @arr[y][x] = '🚢'
    end
  end
end
class Ship
    attr_accessor :sunk
  def initialize
    @ship = []
    @sunk = false;
  end
   def placeShip(arg)
    startver = arg.first
    starthor = arg.last
    p "do you want the ship to be horizontal or verticle?"
    p "(ver/hor)"
    orient = gets.chomp!
    if orient == "hor"
      @length.times do |i|
        @ship << "#{startver}#{i + starthor}"
        i +=1
        if (i + starthor) > 10 || startver > 10
          puts "sorry, you board is not big enough to do that. please try again"
          return placeShip(arg)
        end
      end
    elsif orient == "ver"
      @length.times do |i|
        @ship << "#{i + startver}#{starthor}"
        i +=1
        if (i + startver) > 10 || starthor > 10
          puts "sorry, you board is not big enough to do that. please try again"
          return placeShip(arg)
        end
      end
    end
    return @ship
  end
  def hit(coord)
    first = coord.first
    last = coord.last
    val = "#{first}#{last}"
      if @ship.include?("#{val}")
        temp = @ship.index(val)
        @ship[temp] = "H"
        if sunk?
          p "hit and sunk"
          return 2
        else
          p "hit not sunk"
          return 1
        end
      else
        p "you missed"
        return 0
      end
    end
  def sunk?
    # p "you are in sunk?"
    if @ship.uniq.count == 1
      # p "it is sunk"
      @sunk = true
      return true
    else
      # p " it is not sunk"
      return false
    end
  end
end
class Aircraft < Ship 
  def initialize
    @length = 5
    super
  end
end
class Battleship < Ship 
  def initialize
    @length = 4
    super
  end
end
class Submarine < Ship 
  def initialize
    @length = 3
    super
  end
end
class Cruiser < Ship 
  def initialize
    @length = 3
    super
  end
end
class Destroyer < Ship 
  def initialize
    @length = 2
    super
  end
end

g = Game.new
g.play