require 'erb'

kids_data = File.read('data/kids-data.txt')
invoice_letter = File.read('templates/invoice_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name          = kid_data_array[0]
  street_number = kid_data_array[8]
  street_name   = kid_data_array[9]
  street_suffix = kid_data_array[10]
  postal_code   = kid_data_array[11]


 filename    = 'letters/invoices/' + name + '.txt'
 letter_text = ERB.new(invoice_letter, nil, '-').result(binding)

 puts "Writing #{filename}."
 File.write(filename, letter_text)

end

puts 'Done!'
