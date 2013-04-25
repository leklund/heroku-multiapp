require 'heroku/command/base'

class Heroku::Command::Multiapp < Heroku::Command::Base
  def index
    apps = api.get_apps.body.map{|a| a["name"]}
    args = ARGV[1..-1]
    cmd = args.shift
    if options[:multiapps]
      options[:multiapps].split(',').each do |app|
        error("Invalid app name '#{app}' passed in multiapps option") unless apps.include?(app)
      end
      apps = options[:multiapps].split(',')
    end
    apps.each do |app|
      Heroku::Command.run(cmd, args + ['--app',app])
    end
  end
end
