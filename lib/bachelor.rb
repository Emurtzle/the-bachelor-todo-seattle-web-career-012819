require "pry"

def get_first_name_of_season_winner(data, season)
  p1 = nil
  p1 = data[season].find do |person|
    person["status"] == "Winner"
  end
  return p1["name"].split()[0]
end

def get_contestant_name(data, occupation)
  p1 = nil
  data.each do |season, season_data|
    season_data.each do |person|
      if person["occupation"].include?(occupation)
        p1 = person
      end
    end
  end
  return p1["name"]
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  
  data.each do |season, season_data|
    season_data.each do |person|
      if person["hometown"] == hometown
        counter += 1
      end
    end
  end
  return counter
end

def get_occupation(data, hometown)
  data.each do |season, season_data|
    season_data.each do |person|
      if person["hometown"] == hometown
        return person["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  counter = 0.0
  age_sum = 0.0
  
  data[season].each do |person|
    counter += 1
    age_sum += person["age"].to_i
  end
  age_sum/counter.round
end
