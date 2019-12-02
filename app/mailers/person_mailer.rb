class PersonMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.person_mailer.nps.subject
  #
  def nps(person)
    @person = person

    mail to: @person.email, subject: "Hello"
  end
end
