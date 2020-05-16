class Board
  
  attr_reader :size
 
   def initialize (num)
     @grid=Array.new(num){Array.new(num, :N)}
     @size=num*num
   end
 
 
   def [](pos,val)
     a,b =pos
     @grid[a][b]
   end
 
   def []=(pos)
     a,b =pos
     @grid[a][b]=val
   end
 
   def num_ships
     @grid.flatten.count{|sub| sub==:S}
   end
 
   def attack (pos)
     a,b=pos
     if @grid[a][b]==:S 
       @grid[a][b]=:H 
       puts "you sunk my battleship!"
       return true
     else
       @grid[a][b]=:X
     end
     false
   end
 
   def place_random_ships
       ships=@size * 0.25
       while self.num_ships <  ships
         col=rand(0...@grid.size)
         row=rand(0...@grid.size) 
         @grid[row][col]=:S if @grid[row][col] != :S
       end
   end
 
   def hidden_ships_grid
     @grid.map{|ar| ar.map{|v| v==:S ?  :N : v}}
   end
 
   def self.print_grid(grid)
     grid.each do |val|
         val.each_with_index do |v,i|
           print v 
           print " " if i!=val.size-1
         end
         puts
     end
   end
 
   def cheat
     Board.print_grid(@grid)
   end
 
   def print 
     newgrid=self.hidden_ships_grid
     Board.print_grid(newgrid)
   end
 end
 