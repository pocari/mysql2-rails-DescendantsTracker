# if there is no ridgepole, it is not working

```
docker-compose run --service-port rails

...

[ActiveRecord::ConnectionAdapters::AbstractMysqlAdapter, ActiveRecord::ConnectionAdapters::Mysql2Adapter]
```

# if there is ridgepole, it is not working

step1: Adding ridgepole to Gemfile

```
diff --git a/Gemfile b/Gemfile
index ffed219..695ca4c 100644
--- a/Gemfile
+++ b/Gemfile
@@ -29,6 +29,7 @@ gem 'jbuilder', '~> 2.7'
 gem 'bootsnap', '>= 1.4.4', require: false

 gem 'mysql2'
+gem 'ridgepole'

 group :development, :test do
   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
```

step2: run docker-compose

```
docker-compose run --service-port rails

...

[]
```


# if there is fixed ridgepole, it is working.

step1: fix ridgepole gem location (fixed by me)

```
% git diff Gemfile
diff --git a/Gemfile b/Gemfile
index ffed219..9522b68 100644
--- a/Gemfile
+++ b/Gemfile
@@ -29,6 +29,8 @@ gem 'jbuilder', '~> 2.7'
 gem 'bootsnap', '>= 1.4.4', require: false

 gem 'mysql2'
+gem 'ridgepole', git: 'https://github.com/pocari/ridgepole.git',
+                 branch: "fix-call-super-in-inherited"

 group :development, :test do
```

step2: run docker-compose

```
docker-compose run --service-port rails

...

[ActiveRecord::ConnectionAdapters::AbstractMysqlAdapter, ActiveRecord::ConnectionAdapters::Mysql2Adapter]
```
