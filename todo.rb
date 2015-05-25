require_relative 'config/application'
require_relative 'app/models/task'
require 'byebug'
require 'sqlite3'



user = ARGV.first
input = ARGV.last(ARGV.length-1)

case user
when 'list'
  tasks = Task.all

  tasks.each do |e|
    puts "#{e.id} #{e.title}"
  end
when 'add'
  Task.add(input.join(" "))
  puts "Adding #{(input.join(" "))} to your todo list..."
when 'delete'
  Task.find(input).each{|task| task.destroy}
  puts "Deleted #{input} from your todo list.."

when 'complete'
  item_number = input[0].to_i
  p item_number
  Task.complete(item_number)
end



