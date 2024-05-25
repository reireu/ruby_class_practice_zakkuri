puts "3vs3の対戦ゲームへようこそ"

class Player
  attr_accessor :name, :characters

  def initialize(name)
    @name = name
    @characters = []
  end
end

class SpecialAbility
  def self.damage_to_all_enemies(deck, damage)
    deck.each do |character|
      CHARACTERS[character][:hp] -= damage
      puts "#{CHARACTERS[character][:name]}に#{damage}のダメージを与えました"
    end
  end

  def self.heal_to_all_allies(deck, heal_amount)
    deck.each do |character|
      CHARACTERS[character][:hp] += heal_amount
      puts "#{CHARACTERS[character][:name]}に#{heal_amount}回復しました"
    end
  end
end

class Game
  CHARACTERS = {
    "attacker1" => { name: "attacker1", hp: 100, attack: 20, defense: 5, special_ability: :attacker1_ability },
    "magician1" => { name: "magician1", hp: 80, attack: 15, defense: 3, special_ability: :magician1_ability },
    "defencer1" => { name: "defencer1", hp: 120, attack: 15, defense: 10, special_ability: nil },
    "attacker2" => { name: "attacker2", hp: 110, attack: 22, defense: 6, special_ability: :attacker2_ability },
    "magician2" => { name: "magician2", hp: 90, attack: 17, defense: 4, special_ability: :magician2_ability },
    "defencer2" => { name: "defencer2", hp: 130, attack: 17, defense: 12, special_ability: nil },
    "attacker3" => { name: "attacker3", hp: 120, attack: 25, defense: 7, special_ability: :attacker3_ability },
    "magician3" => { name: "magician3", hp: 100, attack: 20, defense: 5, special_ability: :magician3_ability },
    "defencer3" => { name: "defencer3", hp: 140, attack: 20, defense: 15, special_ability: nil }
  }

  def initialize
    @players = []
    @deck = []
    @board = []
  end

  def display_board
    @players.each do |player|
      puts "#{player.name}のキャラクター:"
      player.characters.each do |char|
        character = CHARACTERS[char]
        puts "#{character[:name]} - HP: #{character[:hp]}, Attack: #{character[:attack]}, Defense: #{character[:defense]}"
      end
      puts "----------------------------"
    end
  end

  def apply_damage(attacker, defender)
    damage = [attacker[:attack] - defender[:defense], 0].max
    defender[:hp] -= damage
    puts "#{attacker[:name]}が#{defender[:name]}に#{damage}のダメージを与えました"
  end

  def play_turn
    @players.each do |player|
      puts "#{player.name}のターンです"

      player.characters.each do |char|
        character = CHARACTERS[char]

        if character[:hp] <= 0
          next
        end

        # ランダムな敵キャラクターを選択
        enemy = @deck.sample

        while CHARACTERS[enemy][:hp] <= 0
          enemy = @deck.sample
        end

        # ダメージを適用
        apply_damage(character, CHARACTERS[enemy])
      end

      # 特殊能力の使用
      player.characters.each do |char|
        character = CHARACTERS[char]
        case character[:special_ability]
        when :magician1_ability
          SpecialAbility.heal_to_all_allies(@deck, 15)
          SpecialAbility.damage_to_all_enemies(@deck, 15)
        when :attacker2_ability
          SpecialAbility.damage_to_all_enemies(@deck, rand(25..35))
        when :magician2_ability
          SpecialAbility.heal_to_all_allies(@deck, rand(10..20))
          SpecialAbility.damage_to_all_enemies(@deck, rand(10..20))
        when :attacker3_ability
          SpecialAbility.damage_to_all_enemies(@deck, rand(15..60))
        when :magician3_ability
          SpecialAbility.heal_to_all_allies(@deck, rand(3..38))
          SpecialAbility.damage_to_all_enemies(@deck, rand(3..38))
        end
      end
    end
  end

  def game_over?
    @deck.each do |char|
      return false if CHARACTERS[char][:hp] > 0
    end
    true
  end

  def start
    2.times do |i|
      puts "Player #{i + 1} の名前を入力してください:"
      name = gets.chomp
      player = Player.new(name)

      puts "#{player.name}さん、3つのキャラクターを選択してください"

      3.times do |j|
        character = nil
        until CHARACTERS.keys.include?(character)
          puts "キャラクター #{j + 1} を選択してください（attacker1、magician1、defencer1からattacker3、magician3、defencer3のいずれかを入力してください）:"
          character = gets.chomp
        end
        player.characters << character
        @deck << character
      end

      @players << player
    end

    until game_over?
      display_board
      play_turn
    end

    puts "ゲームオーバー！"
    display_board
  end
end

game = Game.new
game.start

