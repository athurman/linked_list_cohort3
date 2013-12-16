require 'linked_list_item'

class LinkedList
  attr_reader :items
  attr_reader :size
  attr_reader :last

  def initialize *payloads
    @first_node = nil
    @size = 0
    payloads.each{|payload| add_item(payload)}
  end

  def add_item payload
    if @first_node.nil?
      @first_node = LinkedListItem.new(payload)
    else
      node = @first_node
      until node.last? do
        node = node.next_list_item
      end
      node.next_list_item = LinkedListItem.new(payload)
    end
    @size += 1
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
    get(index)
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

  def indexOf payload
    node = @first_node
    return nil if node.nil?
    i = 0
    until node.payload == payload do
      return nil if node.last?
      node = node.next_list_item
      i += 1
    end
    i
  end

  def last
    node = @first_node

    if node.nil?
      @last = nil
    else
      until node.last? do
        node = node.next_list_item
      end
      @last = node.payload
    end
  end

  def to_s
    node = @first_node
    return "| |" if node.nil?
    first = node.payload.to_s
    until node.last? do
      node = node.next_list_item
      first = first + ", #{node.payload}"
    end
    return "| " + first + " |"
  end

  def sorted?
    node = @first_node
    return true if node.nil?

    until node.last? do
      previous_node = node
      node = node.next_list_item
      return false if previous_node > node
    end
    return true if node == @first_node
    return true if previous_node <= node
  end

  def remove index
    raise IndexError if index < 0 or @first_node.nil?
    node = @first_node

    if index == 0
      @first_node = node.next_list_item
    else
      (index - 1).times do
        raise IndexError if node.nil?
        previous_node = node
        node = node.next_list_item
      end
      # Get the previous node to point to the next list item after it,
      # in order to "remove it"
      node.next_list_item = node.next_list_item.next_list_item
    end
    @size -= 1
  end

  def sort
    return self if @first_node.nil?
    until self.sorted? do
      node = @first_node #This line resets the Linked List to run through again.
      until node.last? do #Nested loop goes through until full list is sorted.
        item1 = node
        item2 = node.next_list_item
        node = node.next_list_item
        if item1 > item2
          item1.payload, item2.payload = item2.payload, item1.payload
        end
      end
    end
    self
  end

  def swap_with_next index
    node = @first_node
    if index == 0
      node.payload, node.next_list_item.payload = node.next_list_item.payload, node.payload
    else
      index.times do
        node = node.next_list_item
      end
      raise IndexError if node.last?
      node.payload, node.next_list_item.payload = node.next_list_item.payload, node.payload
    end
  end

end