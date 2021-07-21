class Show
  attr_reader :name,
              :creator,
              :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    @characters.sum do |character|
       character.salary
    end
    # total_count_salary = 0
    # @characters.each do |character|
    #   total_count_salary += character.salary
    # end
    # total_count_salary
  end

  def highest_paid_actor
    high_paid_actor = @characters.max_by do |character|
      character.salary
    end
    high_paid_actor.actor
  end

  def actors
    @characters.map do |character|
      character.actor
    end 
    # actors = []
    # @characters.each do |character|
    #   actors << character.actor
    # end
    # actors
  end
end
