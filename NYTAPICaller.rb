require_relative './config/environment.rb'

class NYTAPICaller
  @@key = YAML.load_file('application.yml')["API_KEY"]
  url = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?api-key=#{@@key}"
  data = RestClient.get(url)
  @@parsed_data = JSON.parse(data)["results"]

  @@titles = []
  @@top_ten_titles_with_phrase = []

  def self.add_titles
    @@parsed_data.each do |article_hash|
      @title = article_hash["title"]
      @@titles << @title
    end
  end

  def self.get_ten
    @@titles[0..9]
  end


  def self.add_phrase_to_ten
    self.get_ten.each do |title|
      title << ", but everything is going to be okay!"
      @@top_ten_titles_with_phrase << title
    end
    @@top_ten_titles_with_phrase
  end

  def search_title (keyword)
    @@parsed_data.each do |article_hash|
      @title = article_hash["title"]
      if keyword == @title
        @title
      else
        "No articles found!"
      end
    end
  end

end

article = NYT.new
NYT.add_titles
NYT.get_ten
puts NYT.add_phrase_to_ten
