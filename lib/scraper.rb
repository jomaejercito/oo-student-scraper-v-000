require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    student_array = []
    
    doc.css("div.student-card").each do |card|
      student_hash = {
        :name => card.css("h4.student-name").text
        :location => card.css("p.student-location").text
        :profile_url => card.css("a").attribute("href").value
      }
      student_array << student_hash
    end  
    student_array
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    profile_page = {}
    
    doc.css(".social-icon-container a").each
    
  end

end

