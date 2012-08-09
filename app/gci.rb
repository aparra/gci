require_relative 'holmes'
require_relative 'watson'

puts Holmes.search_in file: '../resource/style.css', extensions: ['png', 'jpg']
puts Holmes.search_in dir: '../resource', extensions: ['png', 'jpg']

puts Watson.search_files_in dir: '/Users/anderson/Documents/workspace/central-tiss/src/main/webapp/img', 
                            extensions: ['png', 'jpg']
