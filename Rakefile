require "rubygems"
require 'rake'
require 'yaml'
require 'time'

SOURCE = "."
CONFIG = {
  'layouts' => File.join(SOURCE, "_layouts"),
  'posts' => File.join(SOURCE, "_posts"),
  'draft' => File.join(SOURCE, "_draft"),
  #'pages' => File.join(SOURCE, "pages"),
  'post_ext' => "markdown",
}

#Usage: rake post["title",category]
desc "Given a title as an argument, create a new post file"
task :post, [:title, :category] do |t, args|
  filename = "#{Time.now.strftime('%Y-%m-%d')}-#{args[:title].gsub(/\s/, '-').downcase}.markdown"
  path = File.join("_draft", filename)
  if File.exist? path; raise RuntimeError.new("Won't clobber #{path}"); end
  File.open(path, 'w') do |file|
    file.write <<-EOS
---
layout: post
categories: 
 - #{args[:category]}
title: #{args[:title]}
tags:
  - 
draft: true
date: #{Time.now.strftime('%Y-%m-%d %k:%M:%S')}
---
EOS
    end
    puts "Now open #{path} in an editor."
    system "open #{path}"
 end #task rake write

#Usage: rake write["title"]
desc "Given a title as an argument, create a new page file"
task :write, :title do |t, args|
  filename = "#{args.title.gsub(/\s/, '-').downcase}.markdown"
  path = File.join("pages", filename)
  puts "#{path}"
  if File.exist? path; raise RuntimeError.new("Won't clobber #{path}"); end
  File.open(path, 'w') do |file|
    file.write <<-EOS
---
layout: page
title: #{args.title}
date: #{Time.now.strftime('%Y-%m-%d %k:%M:%S')}
---
EOS
    end
    puts "Now open #{path} in an editor."
    system "open #{path}"
 end #task rake write page

desc "Launch preview environment"
task :preview do
  system "jekyll --rdiscount --server"
end # task :preview

desc "deploy site to remote"
task :deploy do
  #system "git add . && git commit -m 'update post' && git push deploy master"
  system "git add . && git commit -m '#{Time.now.strftime('%Y-%m-%d %k:%M:%S')}' && git push deploy master"
end # task :deploy

desc "Building the site"
task :build do
 system "jekyll --rdiscount"
end # task :build

desc "rsync all to remote"
task :upload do
  system "rsync -avz --progress --delete ../jekyll/ xxx@xxx.com:/home/xx/jekyll/"
end #task :upload

#Load custom rake scripts
Dir['_rake/*.rake'].each { |r| load r }
