require "faker"
require_relative "../app/models/task"

20.times do
  Task.create(title: Faker::Lorem.paragraphs(rand(2..8)))
end


