require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

#create some cards
@card_1 = Card.new("Name the main Character in FLCL.", "Naota", :ANIME)
@card_2 = Card.new("Name the robot in FLCL.", "Kanti", :ANIME)
@card_3 = Card.new("Name the protagonist in FLCL.", "Haruko", :ANIME)
@card_4 = Card.new("Who is the Astro Pirate King?", "Atomisk", :ANIME)

#put those cards into a deck
@cards = [@card_1,@card_2,@card_3,@card_4] #first put the cards into an array
@deck = Deck.new(@cards) #put anime card stack array into new deck obj
@round = Round.new(@deck) #make new round with anime deck


def start(round)
  puts " "
  puts " "
  puts "***F L A S H ***C A R D***G A M E***"
  puts " "
  puts " "
  puts "Welcome! You are playing with #{@cards.length} cards."
  puts "Good Luck and Enjoy! : ) "
  puts "This is card number #{@round.turns.length + 1} out of #{@cards.length}..."
  puts "--------------------------------------"
  @cards.each do |card| #iterates through cards
    puts "Question: #{card.question}"
    puts "Type your guess -> "
    @guess = gets.chomp
    @round.take_turn(@guess)
    puts "#{@round.turns.last.feedback}"
    #require 'pry'; binding.pry
end
end

start(@round)

puts " "
puts " "

puts "*** G A M E O V E R ***"

puts "Nice Work!"
puts "You got #{@round.amount_correct} correct answers."
puts "You got #{@round.percent_correct} % correct answers."
puts "See more results below"
puts "And you got #{@round.percent_correct_category(:ANIME)}% per category." 
