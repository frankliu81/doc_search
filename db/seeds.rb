# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Document.create(title: "Mystery Door 1", document_attachment: File.open('/Users/frank_liu/Documents/Hackday/MysteryDoor1.docx'))
Document.create(title: "Mystery Door 2", document_attachment: File.open('/Users/frank_liu/Documents/Hackday/MysteryDoor2.docx'))
Document.create(title: "Mystery Door 3", document_attachment: File.open('/Users/frank_liu/Documents/Hackday/MysteryDoor3.docx'))
Document.create(title: "Mystery Door 4", document_attachment: File.open('/Users/frank_liu/Documents/Hackday/MysteryDoor4.docx'))
Document.create(title: "Mystery Door 5", document_attachment: File.open('/Users/frank_liu/Documents/Hackday/MysteryDoor5.docx'))
