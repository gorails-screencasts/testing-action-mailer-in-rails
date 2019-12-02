class PersonMailerPreview < ActionMailer::Preview
  def nps
    person = Person.new(email: "test@test.com")
    PersonMailer.nps(person)
  end
end
