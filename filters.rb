# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

  def find(id)
    @candidates.each do |candidate|
      return candidate if candidate[:id] == id
    end
  end
    
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2
  end
    
  def qualified_candidates(candidates)
    candidates.select do |candidate|
      experienced?(candidate) &&
      github_points?(candidate) &&
      knows_ruby_or_python?(candidate) &&
      applied_recently?(candidate) &&
      over_17?(candidate)
    end
  end
  
  # More methods will go below

  def ordered_by_qualifications(candidates)
    candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  end

  # Check if the candidate has 100 or more GitHub points
  def github_points?(candidate)
    candidate[:github_points] >= 100
  end

  # Check if the candidate knows Ruby or Python
  def knows_ruby_or_python?(candidate)
    candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
  end

  # Check if the candidate applied within the last 15 days
  def applied_recently?(candidate)
    candidate[:date_applied] >= 15.days.ago.to_date
  end

  # Check if the candidate is 18 or older
  def over_17?(candidate)
    candidate[:age] > 17
  end
  