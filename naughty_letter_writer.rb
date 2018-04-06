require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split
  behaviour = kid.split('|')

  name       = kid_data_array[0]
  behavior   = kid_data_array[1]
  toy_random = kid_data_array[2..7].sample
  toys       = kid_data_array[2..7]
  infraction = behaviour[1]

  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
