require_relative '../config/environment.rb'

class NYT
  @@key = YAML.load_file('application.yml')["API_KEY"]
  url = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?api-key=#{@@key}"
  data = RestClient.get(url)
  @@parsed_data = JSON.parse(data)["results"]

  @@top_ten_titles = []

  def title
    10.times do |title|
      @@parsed_data.each do |article_hash|
        @title = article_hash["title"]
        @@top_ten_titles << @title
      end
              # binding.pry
    end
  end

  def add_phrase
    new_title = self.title
    puts "#{new_title}...But everything is going to be okay!"
  end

end

article = NYT.new
article.add_phrase
