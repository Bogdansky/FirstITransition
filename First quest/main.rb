require 'securerandom'
require 'hmac-sha1'
require 'matrix'
things = %w(rock scissors paper fire life evil darkness happiness worthless hopeless regularity lightning tank building magic harmony sea human nature)
count = ARGV[0].to_i
results = Array.new() # матрица результатов
row = Array.new(Array.new(count/2,1)+Array.new(count/2,-1)+[0])
(0..count-1).each do |index|
    last = row.pop
    results[index] = Array.new(row.unshift last)
end
(0..count-1).each do |index|
    puts "\"#{index+1}\" - #{things[index]}"
end
enemy_choice = SecureRandom.random_number count
key = SecureRandom.base64(14)
hmac = HMAC::SHA1.new(enemy_choice.to_s) # инициализация hmac кодируемой строкой
hmac.update key # добавление ключа
puts "Enemy: #{hmac}"
player_choice = $stdin.gets.to_i-1
result = results[player_choice][enemy_choice] > 0 ? "You won" : results[player_choice][enemy_choice] < 0 ? "You lose" : "Draw"
# 1 - победа, 0 - ничья, -1 - проигрыш
puts "Enemy choice is #{things[enemy_choice]}"
puts "Your choice is #{things[player_choice]}"
puts result
puts "You can check your computer for truth! Key is #{key}\nFor example, rock - \"0\"."