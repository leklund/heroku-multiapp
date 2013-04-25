require 'heroku/command/base'

class Heroku::Command::Multiapp < Heroku::Command::Base
  def index
    apps = api.get_apps.body
    args = ARGV
    args.shift
    cmd = args.shift
    apps.each do |app|
      argz = getargs(app["name"],args.dup)
      Heroku::Command.run(cmd, argz)
    end
  end

  def getargs(app='',args)
    args.concat(['--app',app])
  end
end
