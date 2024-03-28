require_relative './base_page'
class LoginPage < BasePage
  def login_with_valid_credentials
    sign_in(email: email_for('admin'), password: password_for('admin'))
    ensure_correct_credentials
    page.current_path
  end

  def sign_in(email: '', password: '')
    visit app_url

    # Insert credentials on login page
    fill_in 'username', with: email
    fill_in 'password', with: password

    submit
  end

  def search_invalid_user_on_timesheet
    # Click on Time from Sidebar
    find('a', text: 'Time').click

    find_all('input').last.click
    page.send_keys('dummy@example.com')
  end

  private

  def app_url
    'https://opensource-demo.orangehrmlive.com/web/index.php/auth/login'
  end

  def submit
    # Click on Login button
    click_on 'Login'
  end

  def ensure_correct_credentials
    expect(page).to have_content('Dashboard')
  end
end
