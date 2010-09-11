# -*- coding: utf-8 -*-
require "spec/rake/spectask"

Spec::Rake::SpecTask.new do |task|
    #task.spec_opts = ['--colour --format specdoc --loadby mtime --reverse']
    task.libs << 'lib'
    task.rcov = true
    task.spec_files = FileList['spec/**/*.rb']
    task.rcov_opts = %w{--exclude spec,rcov,builder,gems\/ --text-summary --failure-threshold 100}
end

task :default => :spec
