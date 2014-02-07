# Markdown Stuff
set :markdown_engine, :redcarpet

set :markdown,
    :autolink => true,
    :fenced_code_blocks => true,
    :tables => true


# Sass + Compass
# Assets directories
set :css_dir, 'assets/css'
set :fonts_dir, 'assets/fonts'
set :images_dir, 'assets/img'
set :js_dir, 'assets/js'

activate :directory_indexes

# Activate the Blog
# activate :blog do |blog|
#   blog.prefix    = "blog"
#   blog.layout    = "blogroll"
#   blog.permalink = ":year/:month/:day/:title.html"
#   blog.sources   = ":year-:month-:day-:title.html"
#   blog.taglink   = "tags/:tag.html"
#   blog.summary_separator = /(READMORE)/
#   blog.summary_length = 250
#   blog.year_link = ":year.html"
#   blog.month_link = ":year/:month.html"
#   blog.day_link = ":year/:month/:day.html"
#   blog.default_extension = ".markdown"

#   blog.layout = "post"
#   blog.tag_template = "blog/tag.html"
#   blog.calendar_template = "blog/calendar.html"

#   blog.paginate = true
#   blog.per_page = 10
#   blog.page_link = "page/:num"
# end

###
# Markdown
###

set :markdown_engine, :redcarpet
set :markdown,
  :layout_engine => :erb,
  :fenced_code_blocks => true,
  :tables => true,
  :smartypants => true,
  :no_intra_emphasis => true,
  :strikethrough => true,
  :superscript => true,
  :highlight => true,
  :footnotes => true


# Projects Pages
def get_projects
  @projects = sitemap.resources.find_all { |page| page.url.match(/\/projects\/.*\/.*/) }
  # Sort by date of project
  @projects.sort! { |a,b| a.data['order'].to_i <=> b.data['order'].to_i }
end

ready do
  get_projects
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
