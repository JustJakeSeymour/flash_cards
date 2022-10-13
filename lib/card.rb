class Card

  attr_reader :answer, :category, :question

  #initialize with :question :answer and :category
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def compare(cat)
    @category == cat
  end

end
