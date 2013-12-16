require 'linked_list_item'

class LinkedList
  attr_reader :items
  attr_reader :size
  attr_reader :last

  def initialize *payloads
    @first_node = nil
    @size = 0

    payloads.each{|payload|
      if @first_node.nil?
        @first_node = LinkedListItem.new(payload)
      else
        node = @first_node
        while node.next_list_item != nil do
          node = node.next_list_item
        end
        node.next_list_item = LinkedListItem.new(payload)
      end
      }
  end

  def add_item payload
    if @first_node.nil?
      @first_node = LinkedListItem.new(payload)
    else
      node = @first_node
      while node.next_list_item != nil do
        node = node.next_list_item
      end

      node.next_list_item = LinkedListItem.new(payload)
    end
  end

  def get index
    raise IndexError if index < 0
    return @first_node.payload if index == 0

    node = @first_node
    for i in 0...index
      raise IndexError if node.nil?
      node = node.next_list_item
    end
    return node.payload
  end

  def [] index
    self.get(index) # The keyword self in Ruby gives you access to the current object
  end

  def []= index, payload
    raise IndexError if index < 0

    node = @first_node
    for i in 0...index
      raise IndexError if node.nil?
      node = node.next_list_item
    end
    node.payload = payload
  end

  def size
    size = 0
    node = @first_node

    unless node.nil?
      size = 1
      while node.next_list_item != nil do
        size = size + 1
        node = node.next_list_item
      end
    end

    @size = size
  end

  def last
    node = @first_node

    if node.nil?
      @last = nil
    else
      while node.next_list_item != nil do
        node = node.next_list_item
      end
      @last = node.payload
    end
  end

  # def print_payloads *payloads
  #   payloads.each{|payload| "#{payload}, "}
  # end

  def to_s
    node = @first_node
    return "| |" if node.nil?

    first = node.payload
    while node.next_list_item != nil do
      node = node.next_list_item
      first << ", " + node.payload
    end

    return "| " + first + " |"
  end

  def remove index
    raise IndexError if index < 0

    node = @first_node
    for i in 0...index
      raise IndexError if node.nil?

      node = node.next_list_item
    end
  end

end