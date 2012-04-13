$: << File.dirname(__FILE__) # for 1.9

# log in using the login example, so we don't have to duplicate code
require 'login'

# get the root of the folder structure
root = @account.root

puts root.inspect

puts "Enter the name of the file to save:"
file_name = gets.chomp

puts "Enter one line for the content of the file:"
content = gets

File.open(file_name, 'w') do |file|
  file.write(content)
end

begin
  result = root.upload_file(file_name)
  puts "Done! #{ result.name } written to Box"
ensure
  File.delete(file_name)
end
