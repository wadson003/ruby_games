class Joueur
  attr_reader :nom, :symbole

  def initialize(nom, symbole)
    @nom = nom
    @symbole = symbole
    end
  end

  class Table_jeu
    attr_reader :grille

    def initialize
      @grille = Array.new(9,"")
    end

    def afficher
      puts "\n #{@grille[0]} | #{@grille[1]} | #{@grille[2]}"
      puts "-------"
      puts "#{@grille[3]} | #{@grille[4]} | #{@grille[5]}"
      puts "-------"
      puts "#{@grille[6]} | #{@grille[7]} | #{@grille[8]} \n\n"
      end

  def nouveau (position, symbole)
    if @grille[position] ==""
      @grille[position] = symbole
      return true
      end
      false
    end

    def full?
      !@grille.include?("")
      end
    end

class Jeu
  def initialize
    @table = Table_jeu.new
    @joueur = [
      {nom:"Joueur 1",symbole:"X"},
      {nom:"Joueur 2", symbole:"O"}
    ]
    @joueur_correspondant = 0
  end

  def combinaisons_gagnantes
    gagnant  = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], 
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4,6]
    ]

  gagnant.each do |a, b, c|
    if @table.grille[a] != "" && @table.grille[a] == @table.grille[b] &&
      @table.grille[a] == @table.grille[c]
      return true
       end
      end
   false
  end

  def jouer
    puts "=== DEMARRONS LE JEU ==="

  loop do 
    @table.afficher
    actuel_joueur = @joueur[@joueur_correspondant]

    print "#{actuel_joueur[:nom]} (#{actuel_joueur[:symbole]}), choisis une case(1-9):"
    input = gets.chomp.to_i() -1

    if input.between?(0,8)
    if @table.update(input, actuel_joueur[:symbole])
      if combinaisons_gagnantes
        @table.afficher
        puts "Bravo ! #{actuel_joueur[:nom]} a gagne!"
        break 
      elsif @table.full?
        @table.afficher
        puts "Match nul !"
        break
       end

       @joueur_correspondant= 1-@joueur_correspondant
      else
        puts "Case deja occupee, reessaie."
       end
      else
        puts "Entree invalide. Choisis un chiffre entre 1 et 9."
         end
        end
      end
    end

    Jeu.new.jouer