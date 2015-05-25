class Task < ActiveRecord::Base

def self.list_all(print)
array = []
initial = 1
Task.all.select do |x|
  array << x.id
  puts "#{initial.to_s}" + "." + "#{x.title}" if print
initial += 1
end
return array
end

def self.add(add)
add = self.create(title: add)
puts "#{add} was added"
end

def self.delete(input)
  list = list_all(true)
  if list.input.to_i == 0
    puts "try again"
  else
    task = Task.find_by(id: list_all(true)[input.to_i-1])
    puts "#{task.title} was destroyed"
    task.destroy
  end
end

def self.complete(input)
  list = list_all(true)
  if input.to_i == 0
    puts "try again"
  else
    task = Task.find_by(id: list_all(true)[input.to_i])
    puts "#{task.title} was completed!"
    a = task.title
    task.update(title: "DONE!!" + a )
  end
end


# case user
# when 'list'
#   tasks = Task.all
#   tasks.each do |e|
#     puts "#{e.id} #{e.title}"
#   end
# when 'add'
#   Task.add(input.join(" "))
# when 'delete'
#   Task.find(input).each{|task| task.destroy}

# when 'complete'
#   Task.complete(:id).complete
# end

end
