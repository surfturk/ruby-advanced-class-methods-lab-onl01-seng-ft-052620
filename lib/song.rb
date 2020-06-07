require = "pry"


class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  
  def self.create
   song = self.new
   @@all << song
   song
  end
  
  

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


def self.new_by_name(name)
    song_name = self.new 
    song_name.name = name  
    song_name
end

def self.create_by_name(name)
  
  song_name = self.new
  song_name.name = name
  song_name.save
  song_name
end  


def self.find_by_name(name)
  @@all.each do |song|
    if song.name == name
      return song  
    end 
  end
  return nil
end  


def self.find_or_create_by_name(name)
  
    self.find_by_name(name) ||   self.create_by_name(name)   
    
end  


def self.alphabetical
  
 @@all.sort_by {|word| word.name}
   
   end



def  self.new_from_filename(name)
  song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
    
end


def self.create_from_filename
  
  self.new_from_filename
   self.save
  
end  



end
