require 'rails_helper'

describe Background do
  before :each do
    @data = {background:"Acolyte", skill_proficiency_one:"Insight (WIS)", skill_proficiency_two:"Religion (INT)", tool_proficiency_one:"-", tool_proficiency_two:"-", extra_languages:"Any 2", equipment:'A musical instrument (one of your choice) - the favor of an admirer (love letter - lock of hair - or trinket) - a costume - and a pouch containing 15 gp'}
  end

  it "exists" do
    background = Background.new(@data)

    expect(background).to be_a(Background)
    expect(background.name).to eq("Acolyte")
    expect(background.skill_proficiency_one).to eq("Insight (WIS)")
    expect(background.skill_proficiency_two).to eq("Religion (INT)")
    expect(background.tool_proficiency_one).to eq("-")
    expect(background.tool_proficiency_two).to eq("-")
    expect(background.extra_languages).to eq("Any 2")
    expect(background.equipment).to eq(["A musical instrument (one of your choice)", "the favor of an admirer (love letter", "lock of hair", "or trinket)", "a costume", "and a pouch containing 15 gp"])
  end

end
