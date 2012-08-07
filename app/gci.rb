require_relative 'holmes'

file = File.open('../resource/style.css')
puts Holmes.search_in_file(file, 'png', 'jpg')

puts Holmes.search_in_dir('../resource', 'png', 'jpg')