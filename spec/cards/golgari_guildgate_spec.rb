require 'spec_helper'

RSpec.describe Magic::Cards::GolgariGuildgate do
  include_context "two player game"

  let(:card) { Card("Golgari Guildgate") }

  let!(:permanent) do
    p1.play_land(land: card)
    p1.permanents.by_name("Golgari Guildgate").first
  end

  it "enters the battlefield tapped" do
    expect(permanent).to be_tapped
  end

  it "taps for either black or green" do
    p1.activate_ability(ability: permanent.activated_abilities.first) do
      _1.choose(:black)
    end

    expect(p1.mana_pool[:black]).to eq(1)
  end
end
