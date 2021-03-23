class Spells
  attr_reader :all_spells,
              :current_spells,
              :spell_slots

  def initialize(character_class, level, class_table)
    @spell_slots = {}
    @current_spells = []
    case character_class
    when 'Barbarian'
      @all_spells = "Not a spellcaster"
      @current_spells = "Not a spellcaster"
      @spell_slots = "Not a spellcaster"
    when 'Monk'
      @all_spells = "Not a spellcaster"
      @current_spells = "Not a spellcaster"
      @spell_slots = "Not a spellcaster"
    when 'Fighter'
      @all_spells = "Not a spellcaster"
      @current_spells = "Not a spellcaster"
      @spell_slots = "Not a spellcaster"
    when 'Rogue'
      # find_rogue_spells ? @sub_class == "Arcane(level) Trickster" : "Not a spellcaster"
      # For the future ^^^
      @all_spells = "Not a spellcaster"
      @current_spells = "Not a spellcaster"
      @spell_slots = "Not a spellcaster"
    when 'Bard'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_bard_spells(level, class_table)
    when 'Cleric'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_cleric_spells(level, class_table)
    when 'Druid'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_simple_spells(level, class_table)
    when 'Paladin'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_simple_spells(level, class_table)
    when 'Ranger'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_simple_spells(level, class_table)
    when 'Sorcerer'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_sorcerer_spells(level, class_table)
    when 'Warlock'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_warlock_spells(level, class_table)
    when 'Wizard'
      @all_spells = Spell.where('classes LIKE ?', '%' + character_class + '%')
      find_simple_spells(level, class_table)
    end
  end

  def find_simple_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        find_spell_slots(row.scan(/\d+/)[2..-1])
        find_current_spells
        require "pry"; binding.pry
      end
    end
  end

  def find_bard_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        if level == "1" || level == "2" || level == "5" || level == "9" || level == "10" || level == "13" || level == "15" || level == "17"
          # require "pry"; binding.pry
        else
          find_spell_slots(row.scan(/\d+/)[2..-1])
          find_current_spells
        end
        # require "pry"; binding.pry
      end
    end
  end

  def find_cleric_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        if level == "2" || level == "6" || level == "8" || level == "11" || level == "14" || level == "17" || level == "18"
          # require "pry"; binding.pry
        elsif level == "5"
          # require "pry"; binding.pry
        else
          find_spell_slots(row.scan(/\d+/)[2..-1])
          find_current_spells
        end
        # require "pry"; binding.pry
      end
    end
  end

  def find_sorcerer_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        spell_level = 0
        row.scan(/\d+/)[2..-1].each do |number|
          @spell_slots[spell_level] = number.to_i
          spell_level += 1
        end
        find_current_spells
        # require "pry"; binding.pry
      end
    end
  end

  def find_warlock_spells(level, class_table)
    class_table.each do |row|
      if row.scan(/\d+/)[0] == level
        if level == "11" || level == "13" || level == "15" || level == "17"
          # require "pry"; binding.pry
        else
          # require "pry"; binding.pry
          find_spell_slots(row.scan(/\d+/)[2..-1])
          find_current_spells
        end
      end
    end
  end

  def find_spell_slots(row_numbers)
    spell_level = 0
    row_numbers.each do |number|
      @spell_slots[spell_level] = number.to_i
      spell_level += 1
    end
  end

  def find_current_spells
    @spell_slots.each do |slot, spells|
      @current_spells << @all_spells.where(level: slot).sample(spells)
    end
    @current_spells.flatten
  end


end
