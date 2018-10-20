3.times do 
	JobApplication.create({
		data: Faker::Book.title,
		status: true
	})
end

User.create({
	email: "admin@bd.com",
	password:"123456",
	password_confirmation:"123456"
})

3.times do 
	JobApplication.create({
		data: Faker::Book.title,
		status: true,
		user: User.find(1)
	})
end