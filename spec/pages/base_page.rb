class BasePage
  include RSpec::Matchers
  include Capybara::DSL

  def user_yml
    "#{RSPEC_ROOT}/fixtures/secrets.yml"
  end

  def user
    YAML.load_file(user_yml)
  end

  def email_for(role)
    user[role]['email']
  end

  def password_for(role)
    user[role]['password']
  end
end