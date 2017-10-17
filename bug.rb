require 'zip'
require 'pry-byebug'

puts "------OPEN------"
Zip::File.open_buffer(File.open('rubycode.zip')) do |zf|
  zf.entries.each do |entry|
    entry.get_raw_input_stream do |os|
      puts "  entry#{entry}, os: #{os.inspect}, pos #{os.pos}"
    end
  end
end

puts "------READ------"
content = File.read('rubycode.zip')
puts "prev md5 #{Digest::MD5.hexdigest(content)}"
Zip::File.open_buffer(content) do |zf|
  zf.entries.each do |entry|
    entry.get_raw_input_stream do |os|
      puts "  entry#{entry}, os: #{os.inspect}, pos #{os.pos}"
    end
  end
end
puts "after md5 #{Digest::MD5.hexdigest(content)}"
