class LinkedListItem
  include Comparable
  attr_reader :payload
  attr_reader :next_list_item

  def initialize(payload)
    @payload = payload
    @next_list_item = nil
  end

  def next_list_item= next_list_item
    if next_list_item.is_a?(LinkedListItem) && next_list_item != self
        @next_list_item = next_list_item
    else
      raise ArgumentError
    end
  end

  def last?
    @next_list_item.nil?
  end

  def <=>(other_linked_list_item)
    self.payload.to_s <=> other_linked_list_item.payload.to_s
  end

  def === linked_list_item
    if self.object_id.to_s == linked_list_item.object_id.to_s
      true
    end
  end
end