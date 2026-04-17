class Mastermind
  Colors = %w[ROUGE BLEU JAUNE VIOLET ORANGE].freeze
  NB_SLOTS = 4
  MAX_ATTEMPTS = 12

  def initialize
    @all_possibilities = Colors.repeter_permutation(NB_SLOTS).to_a
    end

    def play
      puts "== JEU DE MASTERMIND=="
      puts "Couleurs: #{Colors.join(',')}"

      print "\nVoulez-vous (1) deviner ou (2) Creer le code ?"
      choix = gets.chomp

      choix =='2'? createur_mode : inviter_mode
    end

    private

    def inviter_mode
      secret = Colors.sample(NB_SLOTS)
      puts "\nL'ordinateur a cache un code. A vous de jouer !"

      (1..MAX_ATTEMPTS).each do |turn|
        print "\nTour #{turn}/#{MAX_ATTEMPTS} | Entrez #{NB_SLOTS} couleurs:"
        guess = gets.chomp.upcase.split

      until choix_valid?(guess)
        print "Invalide. Reesayez:"
        guess = gets.chomp.upcase.split
      end

      blacks, whites = feedback(guess, secret)
      display_feedback(blacks, whites)

      if blacks == NB_SLOTS
        puts "Bravo ! Vous avez trouve le code secret"
        return
      end
    end
        puts "PERDU! Le code etait: #{secret.join('')}"
  end
    
    def createur_mode
      print "\nEntrez votre code secret (#{NB_SLOTS} couleurs parmi #{Colors.join(',')}):"
      secret = gets.chomp.upcase.split
      end

      until choix_valid?(secret)
        print "Code invalide. Reessayez:"
        secret = gets.chomp.upcase.split
      end

      candidates = @all_possibilities.dup

      (1..MAX_ATTEMPTS).each do |turn|
        guess = candidates.first
        blacks, whites = feedback(guess, secret)

        puts "Tour #{turn} | L'ordinateur propose : #{guess.join{''}}"
        puts "Feedback : #{blacks} Noir(s), #{whites} Blanc(s)"
        sleep(0.5)

        if blacks == NB_SLOTS
          puts "\nL'ordinateur a gagne ! il a trouve votre code."
          return
        end

        candidates.select! do |c|
          feedback(guess, c) == [blacks, whites]
        end
      end

      puts "L'ordinateur a echoue ! vous etes un genie."
    end

  def feedback(guess, secret)
    blacks = 0
    whites = 0

  temp_secret = decret.dup 
  temp_guess = guess.dup

  temp_guess.each_with_index do |color, i|
    if color == temp_secret[i]
      blacks +=  1
      temp_secret[i] = nil
      temp_guess[i] = nil
    end
  end

  temp_guess.compact.each do |color|
    if (idx = temp_secret.index(color))
      whites += 1 
      temp_secret[idx] = nil
    end
  end
  
  [blacks, whites]
end

def choix_valid?(guess)
  guess.size == NB_SLOTS && guess.all? {|c| Colors.include?(c)}
end

def display_feedback(blacks, whites)
  puts "-> #{blacks} Noir(s) (bien places), #{whites} Blanc(s) (mal places)"
 end
end

Mastermind.new.play




