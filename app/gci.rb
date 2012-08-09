require_relative 'holmes'

puts Holmes.search_in file: '../resource/style.css', extensions: ['png', 'jpg']
puts Holmes.search_in dir: '../resource', extensions: ['png', 'jpg']