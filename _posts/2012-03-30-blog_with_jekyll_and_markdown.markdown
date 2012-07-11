---
layout: post
categories: 
  - 软件应用
title: 使用jekyll写博客
tags:
  - jekyll  blog
date: 2012-03-30 10:24:31
---
* 2012-03-30 初成
* 2012-04-17 完成jekyll分页显示和自动摘要
* 2012-04-25 增加源码链接
* 2012-06-29 增加[我的相册](http://brucebot.com/gallery/)

关于网上使用jekyll的文章,有非常之多,这里就只是记录一下目前我的博客的使用方案.

Refer:[How to install Jekyll on Mac OSX](http://brandonbohling.com/2011/08/27/Installing-Jekyll-on-Mac/)

1. jekyll 本地运行,用来生成静态网站
2. 评论交由disqus处理
3. Mou 用来编辑markdown,写博客
4. 生成博客markdown`rake post["post tile",category]`
		#Usage: rake post["title",category]
		desc "Given a title as an argument, create a new post file"
		task :post, [:title, :category] do |t, args|
		  filename = "#{Time.now.strftime('%Y-%m-%d')}-#{args[:title].gsub(/\s/, '-').downcase}.md"
		  path = File.join("_post", filename)
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
 执行这个命令后会自动生成新的文章,保存在_posts下面,并自动用Mou打开写文章了. 新的文章会有一个draft:开关，写文章时设置为`true`，则不会发表，当写完后改为`false`就会自动发表了。
5. 生成页面 `rake page["title"]`  
			#Usage: rake page["title"]
		desc "Given a title as an argument, create a new post file"
		task :page, :title do |t, args|
		  filename = "#{args.title.gsub(/\s/, '-').downcase}.markdown"
		  path = File.join("pages", filename)
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
		 end #task rake page
执行这个命令后会自动生成新的文章,保存在pages下面,并自动用Mou打开写文章了. 
6. 使用[resize/watermark](http://brucebot.com/2012/03/29/automator-images-resize-and-watermark/)的automator应用给设置图片大小和加水印效果
7. 文章写好后,执行`rake preview`可以预览效果.
		desc "Launch preview environment"
		task :preview do
		  system "jekyll --rdiscount --server"
		end # task :preview
8. 文章发布`rake deploy`
		desc "Building the site and deploy to remote"
		task :deploy do
		 system "jekyll --rdiscount && rsync -avz --delete _site/ xxx@xxx.com:/home/xxx/"
		end # task :deploy
9. 左边的Instagram照片,参考@lianxu的文章[整合instagrm到jekyll](http://www.lianxu.me/blog/2011/12/21/integrate-instagram-into-octopress/)生成.
10. jekyll分页显示
在_config.xml里面增加一项 `paginate: 5` 5表示每页显示文章的数目然后查看:[https://github.com/mojombo/jekyll/wiki/Pagination](https://github.com/mojombo/jekyll/wiki/Pagination) 里面选择一个代码加入到主页当中去,我是选择第二个考虑page1的.
11. 自动摘要
使用10的分页显示后,因为原来的文章每有用到more的摘要功能,看起来每一页会相当长,于是加一个自动摘要的功能,这样单页显示就好看多了.从
[https://github.com/MattHall/truncatehtml/blob/master/html_filters.rb](https://github.com/MattHall/truncatehtml/blob/master/html_filters.rb)下载*html_filter.rb*插件放入**_plugin**文件夹.
原始的*html_filter.rb*不支持中文,使用文本编辑器打开,找到一行代码:
		doc = Nokogiri::HTML(Iconv.conv('ASCII//TRANSLIT//IGNORE', 'UTF8', raw))
将其更改成
		doc = Nokogiri::HTML(Iconv.conv('UTF8//TRANSLIT//IGNORE', 'UTF8', raw))
12. 所有源码可以在github上查看,链接:[https://github.com/brucebot/brucebot.com.site](https://github.com/brucebot/brucebot.com.site)
13. [我的相册](http://brucebot.com/gallery/) 使用[jekyll-gallery-generator](https://github.com/ggreer/jekyll-gallery-generator)搭建
-EOF-




