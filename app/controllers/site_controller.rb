class SiteController < ApplicationController
  def search
  #   # @results = Artist.where name: params[:term] This is prone to SQL injection because it will take whatever the user typed and convert it into an SQL command to search your db
  #   @results = Artist.where("name like ?", "%#{params[:term]}%") #This is safe because SQL is looking for name LIKE "user input" which is not the same as a full input as above...the one above is taking whatever the user inputs and injects it as is, whereas this one will put in the db name LIKE and then the input...so even if the input is ':) DROP TABLE it will not be found because the code starts with name LIKE "usesr input" instead of ':) DROP TABLE
  # end


  artists = Artist.where("name like ?", "%#{params[:term]}%")
  albums = Album.where("name like ?", "%#{params[:term]}%")
  labels = Label.where("name like ?", "%#{params[:term]}%")
  @results = artists + albums + labels
  end

end




# Turn the search results into links.

# <%# apps/views/site/search.html.erb %>
# <%= link_to result.name, result  %>
# This search form only finds exact matches. Let add support for case-insensitive matching.

# # app/controllers/site_controller.rb
# @results = Artist.where("name LIKE '#{params[:term]}'")
# The LIKE keyword in SQL supports case-insensitive matches.

# Test case-insensitive search in the app.

# This query is dangerous. Try searching for '); DROP TABLE artists; --. This is a SQL-injection (SQLi) attack vector (aka. Little Bobby Tables). Never do interpolation into a SQL String. Instead, use a parameterized query.

# # app/controllers/site_controller.rb
# @results = Artist.where("name LIKE ?", "#{params[:term]}")
# Rails will sanitize the data before inserting it into the SQL query.

# We only have case-insensitive matching. Add partial matching.

# @results = Artist.where("name like ?", "%#{params[:term]}%")
# The % in SQL acts like the wildcard * in Command Line (BaSH).

# Searching for the should return all "The" bands. Searching for nothing should return everything. Entering a non-matching string should return your try again message.