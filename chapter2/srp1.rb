# we don't ever want to depend on structures of arrays, so that we'd need to know it's index to accomplish anything. if we're using an array, we gotta define it in one place, so that any change in the structure would only be affected where it's declared.

class BJJ
  attr_accessor :belts
  def initialize(data)
    @belts = gracify(data)
  end

  Belt = Struct.new(:training_days, :competitions) #structs are a cool way to plug in your data. this lets you call Struct.attribute, as opposed to a sepcific index.
  def gracify(data)
    data.map{|i| Belt.new(i[0], i[1])}
  end

  def rankScore
    belts.map{|i| i.training_days + (20 * i.competitions)}
  end

end

data = [[230, 34],[450, 12]]
#we thus see that these indexes are only taken into account in the gracify method ---  encapsulation.
score = BJJ.new(data).rankScore

puts "#{score}"
