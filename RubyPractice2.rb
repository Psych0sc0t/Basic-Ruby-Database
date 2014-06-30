public
def rename(old,new)
    self[new] = self.delete(old)
end

objects = Hash.new
objects = {
	"Boom" => "Explosion",
	"Shenanigans" => "Fun",
	"Good stuff" => "Too much",
	"Etc." => "Whatever",
}
loop do
puts "-----------------------------------------------"
puts "Input a command: "
puts "add -- Add an object to the database"
puts "update -- Update an existing object"
puts "display -- Display all objects in the database"
puts "delete -- Delete an object from the database"
puts "quit -- Bail from the base"
puts "-----------------------------------------------"
command = gets.chomp.downcase
puts "-----------------------------------------------"
break if command == "quit"
case command
	when "add"
		puts "What is the name of the object being added?"
		object = gets.chomp.capitalize
		if objects[object].nil?
			puts "-----------------------------------------------"
			puts "How about a description for #{object}?"
			description = gets.chomp.capitalize
			objects[object] = description
			puts "-----------------------------------------------"
			puts "#{object} has been added with a description of #{description}"
		else
			puts "-----------------------------------------------"
			puts "#{object} already exists in the database!"
		end
	when "update"
		puts "What object are we updating?"
		object = gets.chomp.capitalize
		if objects[object].nil?
			puts "-----------------------------------------------"
			puts "You are silly. #{object} does not exist in the database!"
		else
			puts "-----------------------------------------------"
			puts "What do you want to update about #{object}?"
			puts "name -- self-explanatory"
			puts "description -- again, self-explanatory"
			puts "-----------------------------------------------"
			choice = gets.chomp.downcase
			case choice
				when "name"
					puts "Insert a new name for #{object}"
					newname = gets.chomp.capitalize
					if objects[newname].nil?
						objects.rename(object,newname)
						puts "-----------------------------------------------"
						puts "#{object}'s name has been changed to #{newname}!"
					else
						puts "-----------------------------------------------"
						puts "#{newname} is already being used as a name in the database!"
					end
				when "description"
					puts "Insert a new description for #{object}"
					newdesc = gets.chomp.capitalize
					objects[object] = newdesc
					puts "-----------------------------------------------"
					puts "#{object}'s description has been changed to #{newdesc}!"
				else
					puts "What are you implying?"
			end
		end
	when "display"
		puts "-----------------------------------------------"
		puts "Current objects in database:"
		objects.each { |key,value| puts "#{key}: #{value}" }
		puts "-----------------------------------------------"
	when "delete"
		puts "What Object are we deleting? :'("
		object = gets.chomp.capitalize
		if objects[object].nil?
			puts "-----------------------------------------------"
			puts "LOLWUT? #{object} does not exist!"
		else
			objects.delete(object)
			puts "-----------------------------------------------"
			puts "It has been done. #{object} has been eliminated..."
		end	
	else
	puts "-----------------------------------------------"
	puts "Sorry, I didn't understand you. Please input another command!"
	end
end

puts "You have quit the database! Goodbye!"
puts "-----------------------------------------------"