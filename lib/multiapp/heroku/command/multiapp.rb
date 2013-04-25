require 'heroku/command/base'

class Heroku::Command::Multiapp < Heroku::Command::Base
  def index
    apps = api.get_apps.body
    args = ARGV[1..-1]
    cmd = args.shift
    apps.each do |app|
      Heroku::Command.run(cmd, args + ['--app',app["name"]])
    end
  end
end
