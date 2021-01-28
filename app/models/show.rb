class Show < ActiveRecord::Base
  has_many :characters 
  has_many :actors, through: :characters
  belongs_to :network 

  def actors_list 
   actor_first_name = self.actors.map {|actor| actor.first_name}
   actor_last_name = self.actors.map {|actor| actor.last_name}
   actor_name_string = "#{actor_first_name.join()} #{actor_last_name.join()}"
   actor_name_string.split.each_slice(2).map{|a|a.join ' '}
  end
end