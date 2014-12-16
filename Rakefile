require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

task :default => :spec

task :modspec do
    FileList["static-modules/**/Rakefile"].each do |project|
        Rake::Task.clear
        load project
        dir = project.pathmap("%d")
        Dir.chdir(dir) do
          spec_task = Rake::Task[:spec]
          spec_task.invoke()
        end
    end
end

require 'puppet-lint/tasks/puppet-lint'

# see https://github.com/rodjek/puppet-lint/issues/331
Rake::Task[:lint].clear

PuppetLint::RakeTask.new :lint do |config|
  config.pattern = 'static-modules/**/*.pp'
  config.ignore_paths = ['modules']
  config.disable_checks = ['80chars']
  config.with_context = true
end

