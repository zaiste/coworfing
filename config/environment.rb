# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Coworfing::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mandrillapp.com",
  :port                 => 587,
  :user_name            => 'coworfing@gmail.com',
  :password             => 'be19de35-2ad7-4cc1-9a0c-3ebc9c625d6e',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}
