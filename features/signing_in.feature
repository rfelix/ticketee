Feature: Signing in
  In order to use the site
  As a user
  I want to be able to sign in

  Background:
    Given there are the following users:
      | email              | password | unconfirmed |
      | user@ticketee.com  | password | true        |
      | user2@ticketee.com | password | false       |

  Scenario: Signing in via confirmation
    And "user@ticketee.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed"
    Then I should see "Signed in as user@ticketee.com"

  Scenario: Signing in via form
    And I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "user2@ticketee.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in successfully."


