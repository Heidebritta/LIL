# Simple test to go to google.com, find element q (search field), enter text, submit and quit
# Uses geckodriver for firefox webdriver
# Selenium documentation here https://www.selenium.dev/documentation/webdriver/actions_api/keyboard/

require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://google.com"

element = driver.find_element(name: 'q')
element.click
element.send_keys "Hello WebDriver!"
element.submit

driver.quit
