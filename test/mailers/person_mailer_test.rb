require 'test_helper'

class PersonMailerTest < ActionMailer::TestCase
  test "nps" do
    person = people(:one)
    email = PersonMailer.nps(person)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [person.email], email.to
    assert_equal ['from@example.com'], email.from
    assert_equal "Hello", email.subject

    assert_match "How likely", email.body.encoded

    0.upto(10).each do |i|
      assert_match "score=#{i}", email.body.encoded
    end
  end
end
