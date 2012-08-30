---
layout: post
categories: 
 - 软件应用
title: Latex with MathJax in Jekyll
tags:
  - Latex
date: 2012-07-14 21:19:44
---
[Jekyll]真是一个不错的东西，全部用文本写文章，也极其方便的增加其他的功能，比如[instagram],[My Gallery],同时也很方便集成[L<sub>A</sub>T<sup>E</sup>X]。借助[Markdown]与的语法[MathJax]的帮助，jekyll可以非常方便的显示[L<sub>A</sub>T<sup>E</sup>X]的数学公式，实现的步骤如下：

1. 使用[Mou]用文本方式用[L<sub>A</sub>T<sup>E</sup>X]写下数学公式
2. 使用[Jekyll]生成文章静态的HTML文件，但是内部的[L<sub>A</sub>T<sup>E</sup>X]语句保持不变。
3. 发布文章到服务器，当访问这个页面的时候，[MathJax]会在浏览器端渲染[L<sub>A</sub>T<sup>E</sup>X]语句，显示正常的数学公式。


比如*工业机器人的D-H矩阵*：

`\[
 ^{i-1}T_i = \begin{bmatrix}
  \cos\theta_i & -\sin\theta_i\cos\alpha_{i,i+1} & \sin\theta_i\sin\alpha_{i,i+1} & \alpha_{i,i+1}\cos\theta_i \\
  \sin\theta_i & \cos\theta_i\cos\alpha_{i,i+1} & -\cos\theta_i\sin\alpha_{i,i+1} & \alpha_{i,i+1}\sin\theta_i \\
  0 & \sin\alpha_{i,i+1} & \cos\alpha_{i,i+1} & d_i \\
  0 & 0 & 0 & 1
 \end{bmatrix}
\]`

这样的效果，看着就顺眼。

>Refer: 1. [mathjax in markdown] 2. [Writing Mathematics with Textile and MathJax] 3. [Latex math Magic]

[Writing Mathematics with Textile and MathJax]:http://blog.felixbreuer.net/2010/03/19/writing-math.html
[Latex math Magic]:http://cwoebker.com/posts/latex-math-magic/
[Jekyll]:https://github.com/mojombo/jekyll
[MathJax]:http://www.mathjax.org/
[instagram]:http://brucebot.com/instagram
[My Gallery]:http://brucebot.com/gallery
[Markdown]: http://daringfireball.net/projects/markdown/
[L<sub>A</sub>T<sup>E</sup>X]:http://www.latex-project.org/
[Mou]:http://mouapp.com
[mathjax in markdown]:http://doswa.com/2011/07/20/mathjax-in-markdown.html


