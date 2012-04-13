$: << File.dirname(__FILE__) # for 1.9

# log in using the login example, so we don't have to duplicate code
require 'login'

# get the root of the folder structure
root = @account.root

# list all of the folders in the root directory with their index
root.folders.each_with_index do |folder, i|
  puts "##{ i } -- #{ folder.name }"
end

# let the user pick one to show the contents of
puts "Pick a folder number above to show: "
index = gets

begin
  # grab the folder they selected
  folder = root.folders[index.to_i]
rescue
  # they picked a folder that broke our script!
  puts "You picked an invalid folder, please try again."
  exit
end

puts "Excellent choice, here are the contents of that folder"

puts "FOLDER: #{ folder.name } (#{ folder.id })"

# loop through and show each of the sub files and folders
folder.items.each do |item|
  puts "\t#{ item.class.name }: #{ item.name } (#{ item.id })"
end
