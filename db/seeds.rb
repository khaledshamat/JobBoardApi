3.times do 
	JobApplication.create({
		data: Faker::Book.title,
		status: true
	})
end

User.create({
	email: "admin@test.com",
	password:"123456",
	password_confirmation:"123456",
	admin: true
})

3.times do 
	JobApplication.create({
		data: Faker::Book.title,
		status: true,
		user: User.find(1)
	})
end