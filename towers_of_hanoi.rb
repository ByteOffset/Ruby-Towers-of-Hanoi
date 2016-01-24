puts 'How many discs would you like to use?'
print '>> '
num_of_discs = gets.to_i
moves = 0
initial_disc_array = (1..num_of_discs).to_a.reverse
towers = {1 => [], 2 => [], 3 => []}
towers[1] = initial_disc_array
#puts 'Current status of each tower:'
#towers.each { |tower| print "#{tower[1..-1]}\n"}
#towers.each_with_index { |tower, i| puts "Tower #{(i+1)}: #{tower}" }
#towers.each {|tower_number, tower| puts "Tower #{tower_number}: #{tower}"}
while towers[3].size < num_of_discs
	puts "\nCurrent status of each tower:"
	towers.each { |tower_number, tower| puts "Tower #{tower_number}: #{tower}"}
	puts
	puts 'Please select a tower from which to take a disc.'
	print '>> '
	tower_selected = gets.to_i #expecting integer input
	if tower_selected < 1 || tower_selected > 3
		puts 'Invalid tower. Please try again.'
	elsif towers[tower_selected].size < 1
		puts 'That tower has no discs. Please select a different tower.'
	else
		puts 'Please select a destination for the removed disc.'
		print '>> '
		tower_destination = gets.to_i
		if tower_destination < 1 || tower_destination > 3
			puts 'ERROR: Invalid tower. Please try again.'
		elsif towers[tower_destination].size > 0 &&
			  towers[tower_destination][-1].to_i < towers[tower_selected][-1].to_i
			puts 'ERROR: Cannot place a larger disc on top of a smaller one.'
			puts '	Please select a different destination.'
		else
			disc_selected = towers[tower_selected][-1] #copies disc from tower
			towers[tower_selected] = towers[tower_selected][0...-1] #removes disc from tower
			towers[tower_destination] << disc_selected
			moves += 1
			if moves % 5 == 0
				puts "Moves: #{moves}"
			end
			
			#towers.each { |tower| print "#{tower[1..-1]}\n"}
		end
	end

end
puts "\n*********************"
puts 'Well done! You have successfully rearranged the Towers of Hanoi.'
towers.each { |tower_number, tower| puts "Tower #{tower_number}: #{tower}"}
puts "This time it took you #{moves} moves."
puts '*********************'