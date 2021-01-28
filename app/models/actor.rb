class Actor < ActiveRecord::Base
  has_many :characters 
  has_many :shows, through: :characters 

  def full_name
    first_name = self.first_name
    last_name = self.last_name
    first_name + " " + last_name
  end

  def list_roles
    # binding.pry
    show = self.shows.map {|show| show.name}
    character = self.characters.map {|character| character.name}
    roles_string = "#{character.join()} - #{show.join()}"
    roles_string.split(", ")
  end
end