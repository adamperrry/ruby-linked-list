class Node
  attr_accessor :value, :next_node
  def initialize(value: nil, next_node: nil)
    self.value = value
    self.next_node = next_node
  end

  def to_s
    "( #{value} )"
  end
end
