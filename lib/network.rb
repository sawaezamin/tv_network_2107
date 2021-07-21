class Network
  attr_reader :name,
              :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    characters = @shows.flat_map do |show|
      show.characters
    end
    characters.find_all do |character|
      character.salary > 500_000 && character.name == character.name.upcase
    end
  end

  def actors_by_show
    different_actors = Hash.new([])
    @shows.each do |show|
      different_actors[show] = show.actors
    end
    different_actors
  end
end
