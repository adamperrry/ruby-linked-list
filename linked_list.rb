require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize
    self.head = nil
  end

  def append(value)
    new_node = Node.new(value: value)
    if head.nil?
      self.head = new_node
    else
      cur = head
      cur = cur.next_node until cur.next_node.nil?
      cur.next_node = new_node
    end
  end

  def prepend(value)
    self.head = Node.new(value: value, next_node: head)
  end

  def size
    count = 0
    cur = head
    until cur.nil?
      count += 1
      cur = cur.next_node
    end
    count
  end

  def tail
    at(size - 1)
  end

  def at(index)
    return nil unless index.between?(0, size - 1)

    cur = head
    index.times { cur = cur.next_node }
    cur
  end

  def pop
    remove_at(size - 1)
  end

  def contains?(value)
    cur = head
    until cur.nil?
      return true if cur.value == value

      cur = cur.next_node
    end
    false
  end

  def find(value)
    i = 0
    cur = head
    until cur.nil?
      return i if cur.value == value

      i += 1
      cur = cur.next_node
    end
    nil
  end

  def remove_at(index)
    return nil unless index.between?(0, size - 1)

    cur = head
    if index.zero?
      self.head = cur.next_node
      return cur.value
    end

    (index - 1).times { cur = cur.next_node }
    val = cur.next_node.value
    cur.next_node = cur.next_node.next_node
    val
  end

  def insert_at(value:, index:)
    return unless index.between?(0, size)

    if index.zero?
      prepend(value)
      return
    end

    cur = head
    (index - 1).times { cur = cur.next_node }
    cur.next_node = Node.new(value: value, next_node: cur.next_node)
  end

  def to_s
    str = ''
    cur = head
    until cur.nil?
      str += "#{cur} -> "
      cur = cur.next_node
    end
    str + 'nil'
  end

  private

  attr_writer :head
end
