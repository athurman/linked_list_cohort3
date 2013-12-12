require 'linked_list_item'

class LinkedList
  attr_reader :items

  def initialize *payloads
    @first_node = nil

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
end