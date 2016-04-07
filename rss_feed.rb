require 'rss'
require 'open-uri'

class RSSFeed
  def initialize
    puts "Enter RSS URL:"
    puts
    url = gets.chomp
    read(url)
  end

  def read(url)
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      puts "Title: #{feed.channel.title}"
      feed.items.each do |item|
        puts "Item: #{item.title}"
        puts item.description
      end
    end
  end
end

RSSFeed.new