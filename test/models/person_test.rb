require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "has no score by default" do
    person = people(:one)
    assert_nil person.score
  end

  test "send nps email" do
    person = people(:one)
    assert_emails 1 do
      person.send_nps_email
    end

    assert_enqueued_email_with PersonMailer, :nps, args: [person] do
      person.send_nps_email
    end
  end
end
