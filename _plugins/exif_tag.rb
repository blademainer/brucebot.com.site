# -*- coding: utf-8 -*-
# A Liquid tag rof Jekyll sites that allows showing exif data.
# by: Gosuke Miyashita
#
# Example usage: {% exif /images/sample.jpg %}

require 'exifr'

module Jekyll
  class ExifTag < Liquid::Tag
    def initialize(tag_name, file, token)
      super
      @image_file = File.expand_path "../" + file.strip , File.dirname(__FILE__)
    end

    def render(context)
      exif = EXIFR::JPEG::new(@image_file)
      <<-HTML
拍摄时间:#{exif.date_time_original.strftime('%Y-%m-%d')} 相机:#{exif.model} 快门:#{exif.exposure_time.to_s} 焦距:#{exif.focal_length.to_i}mm 光圈:F#{sprintf "%.1f", exif.f_number.to_f} ISO:#{exif.iso_speed_ratings} 
      HTML
    end
  end
end

Liquid::Template.register_tag('exif', Jekyll::ExifTag)
