require 'pry'
class Triangle
  

  attr_accessor :side1, :side2, :side3
  @sides = []

  def initialize(side1, side2, side3)
    @side1, @side2, @side3 = side1, side2, side3
    @sides = [side1, side2, side3]
  end

  def kind
    if(negative? == true || valid? == false)
      raise TriangleError
    elsif(equilateral?)
      :equilateral
    elsif(scalene?)
      :scalene
    elsif(isosceles?)
      :isosceles
    elsif(illegal?)
      :illegal
    end
  end

  def negative?
    @sides.each do |length|
      if(length <= 0)
        return true
      end
    end
  end

  def equilateral?
    (@side1 == @side2) && (@side1 == @side3)
  end

  def scalene?
    (@side1 != @side2) && (@side1!= @side3) && (@side2 != @side3)
  end

  def isosceles?
    (@side2 == @side3) || (@side1 == @side2) || (@side1 = @side3)
  end

  def valid?
    (@side1 + @side2 > @side3) && (@side2 + @side3 > @side1) && (@side1 + @side3 > @side2)
  end
  
  def illegal?
    (@side1 + @side2 == 0) && (@side2 + @side3 == 0) && (@side1 + @side3 == 0)
  end 

end

class TriangleError < StandardError

end