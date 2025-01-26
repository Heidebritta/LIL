class SignupPage

	#css selectors
	USERNAME_FIELD = {id: 'user_username'}
	EMAIL_FIELD = {id: 'user_email'}
	PASSWORD_FIELD = {id: 'user_password'}
	SUBMIT_BUTTON = {id: 'submit'}

	attr_reader :driver

	# class method
	def initialize(driver)
		@driver = driver
	end

	#method to create username
	def enter_username(username)
	  username_field = @driver.find_element(USERNAME_FIELD)
	  username_field.send_keys(username)
	end

	#method to send email
	def enter_email(email)
	  email_field = @driver.find_element(EMAIL_FIELD)
	  email_field.send_keys(email)
	end

	#method to send password
	def enter_pwd(password)
	    password_field = @driver.find_element(PASSWORD_FIELD)
	    password_field.send_keys(password)
	end

	#method to click sign_up button
	def sign_up
	      sign_up_button = @driver.find_element(SUBMIT_BUTTON)
	      sign_up_button.click
	end

end