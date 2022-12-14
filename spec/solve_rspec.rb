# frozen_string_literal: true

require_relative 'rails_helper'
require_relative 'spec_helper'
require 'selenium-webdriver'
Capybara.register_driver :chrome_headless do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions': {
      args: %w[no-sandbox headless disable-gpu --window-size=1920,1080]
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

# Ensure Log directory exists
`mkdir -p tmp/selenium_logs`

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions': { args: %w[start-maximized] }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities,
    driver_opts: {
      log_path: "./tmp/selenium_logs/selenium-#{Time.now.to_i}.log",
      verbose: true
    }
  )
end
def finished_all_ajax_requests?
  page.evaluate_script('jQuery.active').zero?
end
