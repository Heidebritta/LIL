# HBF Jan 2025
# TEST: Chapter 3, 03_01 start

require "selenium-webdriver"
require "rspec"
require "base64" 

# there is validation to prevent the name username. Use a timestamp to make username unique
timestamp = Time.now.to_i 
username = "user #{timestamp}"
email = "user#{timestamp}@test.com"
password = "password123"
expected_banner_text = "Welcome to the alpha blog user #{timestamp}"

#method to create username
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

#method to get banner text, expect response of success
def get_banner_text()
	  	banner = @driver.find_element(id: 'flash_success')
  		banner_text = banner.text
end


# Sign up for blog
describe "Blog application" do
  describe "signup to the blog application" do
    it "confirm that a user can successfully signup" do

    	# add @ to make driver variable an instance variable so it can be accessed everywhere throughout this class
      @driver = Selenium::WebDriver.for :firefox

  		# Go to signup form
			@driver.navigate.to "https://selenium-blog.herokuapp.com/signup"  		
  		
  		# Fill out and submit form
  	  enter_username(username)
  		enter_email(email)
  		enter_pwd(password)
  		sign_up()
 		 	
 		 	# Confirm expected result
 		 	banner_text =	get_banner_text()
			expect(banner_text).to eq(expected_banner_text)

  		@driver.quit
	  end
  end
end