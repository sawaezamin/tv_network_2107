require './lib/character'
require './lib/show'

RSpec.describe Show do
  before :each do
    @michael_knight = Character.new({name: "Michael Knight",
                                    actor: "David Hasselhoff",
                                    salary: 1_600_000})

    @kitt = Character.new({name: "KITT",
                          actor: "William Daniels",
                          salary: 1_000_000})
                          
    @knight_rider = Show.new("Knight Rider",
                             "Glen Larson",
                             [@michael_knight, @kitt])
  end

  it 'exists' do
    expect(@knight_rider).to be_a(Show)
  end

  it 'has attribues' do
    expect(@knight_rider.name).to eq("Knight Rider")
    expect(@knight_rider.creator).to eq("Glen Larson")
    expect(@knight_rider.characters).to eq([@michael_knight, @kitt])
  end

  it 'has a total salary of actors' do
    expect(@knight_rider.total_salary).to eq(2_600_000)
  end

  it 'shows who the highest paid actor' do
    expect(@knight_rider.highest_paid_actor).to eq(@michael_knight.actor)
  end

  it 'gives the name of actors in the show' do
    expect(@knight_rider.actors).to eq(["David Hasselhoff", "William Daniels"])
  end
end
