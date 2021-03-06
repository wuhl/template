# template.rb

# install gem's inside Gemfile
gem 'validates_lengths_from_database'
gem 'high_voltage'
gem 'simple_form'

gem 'rails-i18n'
gem 'rails-i18n-enhanced', github: 'wuhl/rails-i18n-enhanced'
# gem 'rails-i18n-enhanced', path: '~/Documents/Rails/gems/rails-i18n-enhanced'

# gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'bootstrap-sass'
gem 'bootstrap-enhanced', github: 'wuhl/bootstrap-enhanced'
# gem 'bootstrap-enhanced', path: '~/Documents/Rails/gems/bootstrap-enhanced'

gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap-datepicker-rails'
gem 'bootstrap-datepicker-enhanced', github: 'wuhl/bootstrap-datepicker-enhanced'

gem_group :development, :test do
  gem 'byebug', platform: :mri
end

gem_group :development do
  gem 'web-console'
  gem 'better_errors'
  gem 'binding_of_caller'
end

copy_file "~/Documents/Rails/template/translation.yml", "doc/translation.yml"

after_bundle do
  generate "railsi18nenhanced:install"
  generate "bootstrapenhanced:install"
  generate "bootstrapdatepickerenhanced:install"
  generate "scaffold", "project name start:date end:date --skip-stylesheets"
  generate "scaffold", "project_phase project:references name start:date end:date --skip-stylesheets"
  generate "scaffold", "resource first_name last_name start:date 'price:decimal{10.2}' --skip-stylesheets"
  generate "scaffold", "project_member project_phase:references resource:references --skip-stylesheets"

  rails_command("db:migrate")
  # rails_command("server")

  puts "cd into_app and enter 'rails server'"
  puts "go to browser and open 'localhost:3000'"
end
