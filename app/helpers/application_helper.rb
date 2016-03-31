module ApplicationHelper
  # create a custom renderer that allows highlighting of code blocks
class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language)
  end
end


  def markdown(content)
    renderer = HTMLwithPygments.new(filter_html: true, hard_wrap: true)
    options={
      superscript: true,
      strikethrough: true,
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      autolink: true,
      lax_html_blocks: true,
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end
