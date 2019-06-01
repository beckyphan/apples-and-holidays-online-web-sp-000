require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  
  holiday_hash.each do |season, day_hash|
    if season == :summer
      day_hash.each do |holiday, attributes|
        if holiday == :fourth_of_july
          return attributes[1]
        end
      end
    end
  end
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, day_hash|
    day_hash.each do |holiday, attributes|
      if holiday == :christmas || holiday == :new_years
        attributes << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, day_hash|
    day_hash.each do |holiday, attributes|
      if holiday == :memorial_day
        attributes << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash.each do |season, day_hash|
    if season == :winter
      day_hash.each do |holiday, attributes|
        winter_supplies << attributes
      end
    end
  end
  return winter_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, day_hash|
    puts season.to_s.capitalize! + ":"
    day_hash.each do |holiday, supply_array|
      holiday_cap = ""
      holiday_arr = holiday.to_s.split('_')
      
      if holiday_arr.length > 1
        holiday_arr.each do |word|
          holiday_cap = holiday_cap.strip + " #{word.capitalize!}"
        end
      else
        holiday_arr.each do |word|
          holiday_cap = "#{word.capitalize!}"
        end
      end
      
      supply_array.each do |supply|
        supply.capitalize!
      end
      
      puts "  #{holiday_cap}: #{supply_array.to_s.flatten}"
      binding.pry
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  array = []

  holiday_hash.each do |season, day_hash|
    day_hash.each do |holiday, attribute|
      if attribute.include?("BBQ")
        array << holiday
      end
    end
  end
  return array
end







