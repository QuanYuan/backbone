# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Entry.create!(name: "c++", address:"http://www.google.com", tags:"for c++")
Entry.create!(name: "java", address:"http://www.cnn.com", tags:"for java")