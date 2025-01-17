require './lib/card'
require './lib/deck'
# require './lib/turn'

RSpec.describe Deck do
  it 'exists' do
    # confirms deck instance will be created from deck class
    card_1 = Card.new(card_array = ["Question1", "Answer1", :cat1])
    card_2 = Card.new(card_array = ["Question2", "Answer2", :cat1])
    card_3 = Card.new(card_array = ["Question3", "Answer3", :cat2])

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it 'has cards in it' do
    # holds cards, which is array of card class
    card_1 = Card.new(card_array = ["Question1", "Answer1", :cat1])
    card_2 = Card.new(card_array = ["Question2", "Answer2", :cat1])
    card_3 = Card.new(card_array = ["Question3", "Answer3", :cat2])

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck.cards).to be (cards)
  end

  it 'counts the cards' do
    # can count how many cards are in deck (count = cards.length)
    card_1 = Card.new(card_array = ["Question1", "Answer1", :cat1])
    card_2 = Card.new(card_array = ["Question2", "Answer2", :cat1])
    card_3 = Card.new(card_array = ["Question3", "Answer3", :cat2])

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck.count).to eq 3
  end

  it 'sorts by category' do
    # can isolate cards by category (for each card category << card)
    card_1 = Card.new(card_array = ["Question1", "Answer1", :cat1])
    card_2 = Card.new(card_array = ["Question2", "Answer2", :cat1])
    card_3 = Card.new(card_array = ["Question3", "Answer3", :cat2])

    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.cards_in_category(:cat1)).to eq [card_1, card_2]
  end

  it 'returns a new sort by category' do
    # make sure @sorted_cards aren't stacking / adding
    card_1 = Card.new(card_array = ["Question1", "Answer1", :cat1])
    card_2 = Card.new(card_array = ["Question2", "Answer2", :cat1])
    card_3 = Card.new(card_array = ["Question3", "Answer3", :cat2])

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck.cards_in_category(:cat1)).to eq [card_1, card_2]

    expect(deck.cards_in_category(:cat2)).to eq [card_3]
  end

  it 'returns an empty array if there are no cards of prompted category' do
    # make sure @sorted_cards aren't stacking / adding
    card_1 = Card.new(card_array = ["Question1", "Answer1", :cat1])
    card_2 = Card.new(card_array = ["Question2", "Answer2", :cat1])
    card_3 = Card.new(card_array = ["Question3", "Answer3", :cat2])

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck.cards_in_category(:cat3)).to eq []
  end
end
