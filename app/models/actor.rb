class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{first_name} #{last_name}"
  end

  def list_roles
    role = ""
    the_show = ""
    self.characters.collect do |char|
        role = char.name
    end
    self.shows.collect do |sho|
        the_show = sho.name
    end
    "#{role} - #{the_show}"
  end
end