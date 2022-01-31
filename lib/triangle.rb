class Triangle
  attr_reader :a, :b, :c

  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b ==c ||a == c
      :isosceles
    else 
      :scalene
    end
  end

  def sides_greater_than_zero?
    [a,b,c].all?(&:positive?)
  end

  def triangle_inequality?
    a+b > c && b+c > a && a+c > b
  end

  def validate_triangle
    raise TriangleError unless triangle_inequality? && sides_greater_than_zero?
  end

  class TriangleError < StandardError
  end
end
