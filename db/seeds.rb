5.times do 
	JobApplication.create({
		data: Faker::Book.title,
		status: true
	})
end