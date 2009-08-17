require "rubygems"
require "systemu"
require "optparse"
require "fileutils"
require "yaml/store"

class Saimaa
  class Command
    class << self
      def run(argv)
        options = {}
        stats, result = []
        OptionParser.new do |opt|
          opt.on('-c COMMAND', 'execute command') do |cmd|
            options[:execute] = cmd
          end
          opt.on('-n COMMAND', 'notifier command') do |cmd|
            options[:notify] = cmd
          end
          opt.parse!(argv)
        end

        project = argv.first

        if options.key?(:execute)
          stats, result = execute(options[:execute], project)
        end

        unless stats.to_i == 0
          if options.key?(:notify)
            notify(options[:notify], result)
          else
            puts result
          end
        end

        save(project,
          :stats => stats.to_i,
          :result => result,
          :time => Time.now)
      end

      def execute(cmd, project)
        stats, stdout, stderr = systemu(cmd)
        result = %W(
          --project--
          #{project}
          --stdout--
          #{stdout}
          --stderr--
          #{stderr}
        ).join("\n")
        [stats, result]
      end

      def notify(cmd, stdin)
        systemu(cmd, :stdin => stdin)
      end
      
      def save(project, record)
        path = "#{ENV["HOME"]}/.saimaa"
        FileUtils.mkdir(path) unless File.exists?(path)
        db = YAML::Store.new("#{path}/saimaa.yml")
        db.transaction do
          db[project] ||= []
          db[project] << record
        end
      end
    end
  end
end
