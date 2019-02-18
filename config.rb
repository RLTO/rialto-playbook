# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end
activate :directory_indexes
activate :livereload

# Template Engine Options
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

# With alternative layout
# page "/path/to/file.html", layout: "other_layout"

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   "/this-page-has-no-template.html",
#   "/template-file.html",
#   locals: {
#     which_fake_page: "Rendering a fake page with a local variable"
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def topics
    content_tag(:ul) do
      item_content = ""
      sitemap.resources.select { |r| r.path.end_with?(".html") && r.path != "index.html" }.each do |link|
        item_content << content_tag(:li) do
          link_content = ""
          link_content << link_to(link.metadata[:page][:title] || link.path, link.path)
          link_content.html_safe
        end
      end
      item_content.html_safe
    end
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css
  activate :minify_html
  set :relative_assets
end
