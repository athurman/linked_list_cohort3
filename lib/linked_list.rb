require 'linked_list_item'

class LinkedList
  attr_reader :items

  def initialize
    @items = []
    @linked_list_item
  end

  def add_item payload
    @linked_list_item = LinkedListItem.new(payload)
    @items.push(@linked_list_item)
  end

  def get index
    if index > (@items.length - 1)
      raise IndexError
    else
      return @items[index].payload
    end
  end
end