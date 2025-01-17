require 'rails_helper'

RSpec.describe 'NPC Facade' do
  it "It returns npc poro" do
    npc = NpcFacade.create_npc('standard array', 1)

    expect(npc).to be_a(NpcModel)
    expect(npc.alignment).to be_a(String)
    expect(npc.ancestry).to be_a(String)
    expect(npc.archetype_name).to be_a(String)
    expect(npc.archetype_desc).to be_a(String)
    expect(npc.armor_class).to be_a(String)
    expect(npc.background_equipment).to be_a(String)
    expect(npc.background_extra_languages).to be_a(String)
    expect(npc.background_name).to be_a(String)
    expect(npc.personality_personality).to be_a(String)
    expect(npc.personality_ideal).to be_a(String)
    expect(npc.personality_bond).to be_a(String)
    expect(npc.personality_flaw).to be_a(String)
    expect(npc.skill_proficiency_one).to be_a(String)
    expect(npc.skill_proficiency_two).to be_a(String)
    expect(npc.background_tool_proficiency_one).to be_a(String)
    expect(npc.background_tool_proficiency_two).to be_a(String)
    expect(npc.character_class).to be_a(String)
    expect(npc.equipment_extras).to be_a(String)
    expect(npc.gold).to be_a(String)
    expect(npc.gender).to be_a(String)
    expect(npc.hit_dice).to be_a(String)
    expect(npc.initiative).to be_a(String)
    expect(npc.languages).to be_a(String)
    expect(npc.level).to be_a(String)
    expect(npc.name).to be_a(String)
    expect(npc.proficiencies_armor).to be_a(String)
    expect(npc.proficiencies_weapons).to be_a(String)
    expect(npc.proficiencies_tools).to be_a(String)
    expect(npc.size).to be_a(String)
    expect(npc.speed).to be_a(String)
    expect(npc.core_modifiers_str_mod).to be_a(String)
    expect(npc.core_modifiers_dex_mod).to be_a(String)
    expect(npc.core_modifiers_con_mod).to be_a(String)
    expect(npc.core_modifiers_int_mod).to be_a(String)
    expect(npc.core_modifiers_wis_mod).to be_a(String)
    expect(npc.core_modifiers_cha_mod).to be_a(String)
    expect(npc.core_scores_str).to be_a(String)
    expect(npc.core_scores_dex).to be_a(String)
    expect(npc.core_scores_con).to be_a(String)
    expect(npc.core_scores_int).to be_a(String)
    expect(npc.core_scores_wis).to be_a(String)
    expect(npc.core_scores_cha).to be_a(String)
    expect(npc.hit_points).to be_a(String)
    expect(npc.passive_perception).to be_a(String)
    expect(npc.saving_throws_str).to be_a(String)
    expect(npc.saving_throws_dex).to be_a(String)
    expect(npc.saving_throws_con).to be_a(String)
    expect(npc.saving_throws_int).to be_a(String)
    expect(npc.saving_throws_wis).to be_a(String)
    expect(npc.saving_throws_cha).to be_a(String)
    expect(npc.skills_proficiencies).to be_a(String)
    expect(npc.skills_acrobatics).to be_a(String)
    expect(npc.skills_animal_handling).to be_a(String)
    expect(npc.skills_arcana).to be_a(String)
    expect(npc.skills_athletics).to be_a(String)
    expect(npc.skills_deception).to be_a(String)
    expect(npc.skills_history).to be_a(String)
    expect(npc.skills_insight).to be_a(String)
    expect(npc.skills_intimidation).to be_a(String)
    expect(npc.skills_investigation).to be_a(String)
    expect(npc.skills_medicine).to be_a(String)
    expect(npc.skills_nature).to be_a(String)
    expect(npc.skills_perception).to be_a(String)
    expect(npc.skills_performance).to be_a(String)
    expect(npc.skills_persuasion).to be_a(String)
    expect(npc.skills_religion).to be_a(String)
    expect(npc.skills_sleight_of_hand).to be_a(String)
    expect(npc.skills_stealth).to be_a(String)
    expect(npc.skills_survival).to be_a(String)
    expect(npc.sub_ancestry).to be_a(String)
    expect(npc.spell_slots).to be_a(String)
    expect(npc.traits).to be_a(String)
    expect(npc.vision).to be_a(String)
    expect(npc.is_saved).to be_a(Integer)
  end
end
