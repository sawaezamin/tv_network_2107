require './lib/network'
require './lib/show'
require './lib/character'

RSpec.describe Network do
  describe 'attributes' do
    it 'exists' do
      nbc = Network.new("NBC")
      expect(nbc).to be_a(Network)
    end

    it 'has a name and no shows by default' do
      nbc = Network.new("NBC")
      expect(nbc.name).to eq("NBC")
      expect(nbc.shows).to eq([])
    end
  end

  describe 'methods' do
    before :each do
      @nbc = Network.new("NBC")

      @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])

      @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
    end

    it 'can add a show into a network' do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)

      expect(@nbc.shows).to eq([@knight_rider, @parks_and_rec])
    end

    xit 'can find the main characters in the network' do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)

      expect(@nbc.main_characters).to eq([@kitt])
    end

    xit 'puts actors together by their respective shows' do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)

      different_actors = {

                          @knight_rider=> [@michael_knight.actor, @kitt.actor],
                          @parks_and_rec=> [@leslie_knope.actor, @ron_swanson.actor]

                          }
      expect(@nbc.actors_by_show).to eq(different_actors)
    end
  end
end
