module HaitiBank


module Securite
  def verifier_identite
    puts"[SECURITE] Identite verifiee pour le compte : #{self.object_id}"
    end
end

module OutilsCalcul
  def info_banque
    "Bienvenue chez HaitiBank - Fondee en 2026 "
  end
end

class Compte
  include Securite 
  extend OutilsCalcul

attr_reader :solde

def initialize(solde_initial)
  @solde = solde_initial
end

def deposer(montant)
  @solde += montant
  puts "Depot de #{montant} HTG effectue."
 end
end

class CompteEpargne < Compte
  def initialize(solde_initial, taux_interet)
    super(solde_initial)
    @taux_interet = taux_interet
  end

def appliquer_interets
  interets = @solde * @taux_interet
  deposer(interets)
  puts "interets de #{interets} HTG ajoutes !"
  end
end
end

puts HaitiBank::Compte.info_banque

mon_compte = HaitiBank::CompteEpargne.new(1000, 0.05)

mon_compte.deposer(500)

mon_compte.verifier_identite

mon_compte.appliquer_interets

puts "solde final: #{mon_compte.solde} HTG"

  

