namespace :dev do 
	task :rebuild => ["db:reset" , :fake]
	task :fake do
		50.times do
			Book.create(:name => Faker::Name.name,
						:description => Faker::Lorem.paragraph,
		                :isbn => Faker::Number.number(10) )
		end
	end
	
end