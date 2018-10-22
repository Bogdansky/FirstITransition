require 'securerandom'
require 'hmac-sha1'

def get_result player,enemy
    "Friendship have won!" 
end

things = %w(rock blades paper fire life evil darkness happiness worthless hopeless regularity lightning tank building magic harmony sea human)
count = ARGV[0].to_i
variants = []
(0..count-1).each do |index|
    variants << things[index]
    puts "\"#{index}\" - #{variants[index]}"
end
enemy_choice = SecureRandom.random_number variants.length
key = SecureRandom.base64(14)
hmac = HMAC::SHA1.new(enemy_choice.to_s) # инициализация hmac кодируемой строкой
hmac.update key # добавление ключа
puts "Enemy: #{hmac}"
player_choice = $stdin.gets.to_i
result = player_choice % enemy_choice
puts "Enemy choice is #{variants[enemy_choice]}"
puts "Your choice is #{variants[player_choice]}"
puts get_result player_choice,enemy_choice
puts "You can check your computer for truth! Key is #{key}\nFor example, rock - \"0\"."