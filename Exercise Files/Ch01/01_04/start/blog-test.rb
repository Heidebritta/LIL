# Simple ruby Selenium test to go to url and sign up with username etc
# To run, do:
# > bundle exec rspec blog-test.rb
#
require "selenium-webdriver"
require "rspec"
require "base64" 

describe "Blog application" do
	describe "signup to the blog application" do
		it "confirm that a user can successfully signup" do
	
			# TEST: Sign up for blog
			driver = Selenium::WebDriver.for :firefox
			driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

			#enter username
			#from rt-click inspect
			# => #<input id="user_username" ...
			username_field = driver.find_element(id: "user_username")
			username_field.send_keys("userHeatherSmith")

			#enter Email
			email_field = driver.find_element(id: "user_email")
			email_field.send_keys("test123HeatherSmith@example.com")

			#enter Password
			pwd_field = driver.find_element(id: "user_password")
			pwd_field.send_keys("sectretpwd")

			#submit
			submit_button = driver.find_element(id: "submit")
			submit_button.click

			#Welcome to the alpha blog user
			banner = driver.find_element(id: "flash_success")
			banner_text = banner.text
			expect(banner_text).to_eq("Welcome to the alpha blog user")

			driver.quit
		end
	end
end