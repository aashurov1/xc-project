# Creating new RAILS app

rails _5.2.3_ new xc-project -G --database=postgresql

    When using PostgreSQL, you should also run the command bundle exec rails db:create in the terminal before trying to run migrations. This creates the database for your application.

bundle install - installs all necessary dependencies in Gemfile

bundle exec rails db:create - creates Dev and Test databases in Postgres

localhost:3000 - localy dev 

# Rails 

/models: Classes which interact iwth SQL DB directly

/controllers: Handles Requests , and gives response (response is handled in our Views)

/config: routes.rb - urls which invoke specific controller functions

database.yml - specify which database we use

/db - all schemas go here

/lib - our classes which we wrote

/log - debugging logs

/tests - RSpec tests, Integration, end-to-end tests

vendor - external JS scripts?

# Database Migrations

A migration is a file containing Ruby code
which describes a set of changes applies to 
the database. Each set of changes is written
inside a new migration file.

We can write in RUBY instead of raw ruby

bundle exec rails db:create creates databases specified in our CONFIG file

bundle exec rails generate migration createUsers

^ follow convention to "create"

bundle exec db:migrate

# Models

pry:

bundle exec rails console

user = Users.new
user.save

or 

Users.create( {name: "Anvar" } )


bundle exec annotate (adds schema to our Model)

user.errors.full_messages

user.valid? (method from validation)

user.save (passes now)






rails s -> to start rails server


# PG Start Server

pg_ctlcluster 12 main start

Data dir:  /var/lib/postgresql/12/main 

Log file:  /var/log/postgresql/postgresql-12-main.log        
