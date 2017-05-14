module Complicated

  def new_house name, empire
    return {
      name: name,
      money: rand(10),
      army: rand(3),
      empire: empire,
      # =============
      pop: rand(5) + 5,
      inf: rand(3) + 1
    }
  end

  def new_empire name, king
    return {
      name: name,
      king: king
    }
  end

end

