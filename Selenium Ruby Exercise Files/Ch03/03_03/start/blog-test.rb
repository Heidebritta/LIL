# HBF Jan 2025
# To run: go to Command Line Ch03/03_01/start
# > bundle exec rspec blog-test.rb

# TEST: Chapter 3, 03_03 start
# Compare to Chapter 3, 03_01 start. Use Page Object Pattern: this exercise sets up a class for each page
#  creating Selectors and Methods
# This creates a seperation of tests and code
# Make sure each class has one focus, group tests by feature

require "selenium-webdriver"
require "rspec"
require "base64" 
require_relative "signup_page.rb"
require_relative "users_page.rb"

# there is validation to prevent the name username. Use a timestamp to make username unique
timestamp = Time.now.to_i 
username = "user #{timestamp}"
email = "user#{timestamp}@test.com"
password = "password123"
expected_banner_text = "Welcome to the alpha blog user #{timestamp}"

#This exercise 03_03 creates classes, so pull this code out to signup_page.rb
=begin#method to create username
def enter_username(username)
  username_field = @driver.find_element(id: 'user_username')
  username_field.send_keys(username)
end

#method to send email
def enter_email(email)
  email_field = @driver.find_element(id: 'user_email')
  email_field.send_keys(email)
end

#method to send password
def enter_pwd(password)
    password_field = @driver.find_element(id: 'user_password')
    password_field.send_keys(password)
end

#method to click sign_up button
def sign_up
      sign_up_button = @driver.find_element(id: 'submit')
      sign_up_button.click
end

#pull this code out to users_page.rb
#method to get banner text, expect response of success
def get_banner_text()
      banner = @driver.find_element(id: 'flash_success')
      banner_text = banner.text
end
=end


# Sign up for blog
describe "Blog application" do
  describe "signup to the blog application" do
    it "confirm that a user can successfully signup" do

      # add @ to make driver variable an instance variable so it can be accessed everywhere throughout this class
      @driver = Selenium::WebDriver.for :firefox

      # Go to signup form
      @driver.navigate.to "https://selenium-blog.herokuapp.com/signup"      
      
      # Fill out and submit form
      signup = SignUpPage.new(@driver)
      signup.enter_username(username)
      signup.enter_email(email)
      signup.enter_pwd(password)
      signup.sign_up()
      
      # Confirm expected result
      users = UsersPage.new(@driver)
      banner_text = users.get_banner_text()
 
      expect(banner_text).to eq(expected_banner_text)

      @driver.quit
    end
  end
end