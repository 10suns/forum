# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless Admin.any?
  admin_user = Admin.new({name: 'Admin', email: 'admin@example.com', password: '1234qwer'})
  admin_user.save!
end