require "bundler/setup"
require "ruby-progressbar"
module Complicated
  def start_battle left, right
    puts "Enter attacking strategy: 1 = carefully 2 = normal 3 = aggressively 4 = blitzkrieg 5 = in the ISIS way 100 = nuclear war"
    strat = gets.to_i

    pbar = ProgressBar.create( :format  => "%a %b\u{15E7}%i %p%% %t",
                    :progress_mark  => '>',
                    :remainder_mark => "\u{FF65}")
    calcProg = lambda {|left, right|
      pbar.log "Estimated strength: ~#{left.round(-1)+1} million vs ~#{right.round(-1)+1} million"
      total = left + right + 0.0
      return (left / total) * 100
    }

    ([left, right].max / 4 + 5).times do
      pbar.progress = calcProg[left, right]
      damage = rand(3) - 1
      if strat == 2
        damage += rand(5) - 2
      elsif strat == 3
        damage += rand(16) - 7
      elsif strat == 4
        damage += rand(30) - 13
      elsif strat == 5
        damage += rand(50) - 25
      elsif strat == 100
        damage += rand(250) - 100
      end
      left += damage if damage < 0
      right -= damage if damage > 0
      pbar.log "Damage: #{(damage * 1000000 + rand(100000)).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
      if left <= 0 or right <= 0
        left = 0 if left < 0
        right = 0 if right < 0
        pbar.progress = calcProg[left, right]
        pbar.log "Battle is over.........press enter"
        gets
        pbar.stop
        break
      end
      pbar.progress = calcProg[left, right]
      sleep rand(0.1..1.5)
    end
    return [left, right]
  end
end
if $0 == __FILE__
  include Complicated
  start_battle 50, 110
end
