class LinkedListItem
  include Comparable
  attr_reader :payload
  attr_reader :next_list_item

  def initialize(payload)
    @payload = payload
    @next_list_item = nil
  end

  def payload= payload
    @payload = payload
  end

  def next_list_item= next_list_item
    if next_list_item != self
        @next_list_item = next_list_item
    else
      raise ArgumentError
    end
  end

  def last?
    @next_list_item.nil?
  end

  def <=> other_linked_list_item
    return 1 if self.payload.is_a?(Symbol) && !other_linked_list_item.payload.is_a?(Symbol)
    return -1 if !self.payload.is_a?(Symbol) && other_linked_list_item.payload.is_a?(Symbol)
    return -1 if self.payload.is_a?(Fixnum) && !other_linked_list_item.payload.is_a?(Fixnum)
    return 1 if !self.payload.is_a?(Fixnum) && other_linked_list_item.payload.is_a?(Fixnum)
    self.payload <=> other_linked_list_item.payload
  end

  def === linked_list_item
    if self.object_id == linked_list_item.object_id
      true
    end
  end
end