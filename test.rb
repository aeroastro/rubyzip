# frozen_string_literal: true

require 'zip'
path = Pathname('fuga')
archive = File.join(path, 'hoge')+'.zip'
Zip::File.open(archive, 'w') do |zipfile| # Code breaking on this line
  # MY Code
end
