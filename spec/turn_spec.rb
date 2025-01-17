require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  # card class exists and an instance can be made
  it 'exists' do
    card = Card.new(card_array = ["Question1", "Answer1", :misc])
    turn = Turn.new("I don't know", card)

    expect(turn).to be_a Turn
  end

  # write a test that makes sure intended card is within Turn
  it 'holds intended card' do
    card = Card.new(card_array = ["Question1", "Answer1", :misc])
    turn = Turn.new("I don't know", card)

    expect(turn.card).to eq(card)
  end

  # write a test that makes sure intended guess is within Turn
  it 'holds intended guess' do
    card = Card.new(card_array = ["Question1", "Answer1", :misc])
    turn = Turn.new("I don't know", card)

    expect(turn.guess).to eq("I don't know")
  end

  # recognizes "string" and "card.question" and compares they are the same
  it 'can have a right answer' do
    card = Card.new(card_array = ["Question1", "Answer1", :misc])
    turn = Turn.new("Answer1", card)

    turn.correct?
    expect(turn.correct?).to be true
  end

  # recognizes "string and "card.question" and compares they are different
  it 'can have a wrong answer' do
    card = Card.new(card_array = ["Question1", "Answer1", :misc])
    turn = Turn.new("I don't know", card)

    turn.correct?
    expect(turn.correct?).to be false
  end

  # turn.feedback returns correct response for right & wrong answers
  it 'returns correct responses' do
    card = Card.new(card_array = ["Question1", "Answer1", :misc])
    turn1 = Turn.new("Answer1", card)
    turn2 = Turn.new("I don't know", card)

    turn1.correct?
    expect(turn1.feedback).to eq "That's correct!"
    turn2.correct?
    expect(turn2.feedback).to eq "Sorry, but no..."
  end
end
