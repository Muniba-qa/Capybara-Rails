# frozen_string_literal: true

require 'spec_helper'
require_relative '../pages/login_page'

RSpec.describe 'Login workflow', js: true, type: :feature do
  it 'allows users to sign in with valid credentials', login_with_valid_credentials: true do
    login_path = login_page.login_with_valid_credentials

    expect(page).to have_current_path(login_path, ignore_query: true)
  end

  it 'disallows users to sign in with invalid credentials', login_fails: true do
    login_page.sign_in(email: 'dummy@example.com', password: 'Password@1234')

    expect(page).to have_content('Invalid credentials')
  end

  it 'allows admin to search for invalid user on timesheet', search_invalid_user_on_timesheet: true do 
    login_page.login_with_valid_credentials
    login_page.search_invalid_user_on_timesheet
    expect(page).to have_content('No Records Found')
  end

  def login_page
    @login_page ||= LoginPage.new
  end
end
