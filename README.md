## QueryTrail for Rails ~> 4.0

Shows a backtrace of your queries:

```
User Load (0.4ms)  SELECT  `users`.* FROM `users`  WHERE `users`.`id` = 1 LIMIT 1
Query Trail: config/initializers/warden.rb:11:in `block in <top (required)>'
             config/initializers/warden.rb:15:in `block in <top (required)>'
Doc Load (18.2ms)  SELECT `docs`.* FROM `docs`  WHERE `docs`.`approved` = 1
Query Trail: app/views/main/_docs.html.erb:2
             app/helpers/docs_helper.rb:3:in `render_main_block'
             app/views/main/index.html.erb:13
             app/views/main/index.html.erb:9
```

## Installation

```ruby
gem 'query_trail', group: :development
```
