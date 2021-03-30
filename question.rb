class Question

  attr_reader :num1 , :num2, :solution

  def initialize
    @num1 = rand(1..10)
    @num2 = rand(1..10)
    @solution = num1 + num2
  end

  def validate(ans)
    ans.to_i == @solution
  end
end
