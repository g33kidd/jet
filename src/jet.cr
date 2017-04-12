require "./jet/*"
require "colorize"

# All of this is just some example usages of the DOM tree
def display_pretty(node : DOM::Node, result : String)
  if node.node_type.is_a?(DOM::NodeType::Element)
    nt = node.node_type.as(DOM::NodeType::Element)

    if !node.children.nil?
      node.children.as(Array(DOM::Node)).each do |child|
        if !result.empty?
          puts display_pretty child, "#{result} #{"->".colorize(:red)} #{nt.tag_name.colorize(:yellow)}#{nt.attributes.colorize(:light_yellow).dim}"
        else
          puts display_pretty child, "#{result} #{nt.tag_name.colorize(:yellow)}#{nt.attributes.colorize(:light_yellow).dim}"
        end
      end
    end
  end

  if node.node_type.is_a?(DOM::NodeType::Text)
    nt = node.node_type.as(DOM::NodeType::Text)
    puts "#{result} #{nt.string.colorize(:red)}"
  end
end

root = DOM.element "p",
  {"class" => "muted", "id" => "clickyClicky"},
  [
    DOM.element("span", {} of String => String, [DOM.text("hello")]),
    DOM.element("span", {} of String => String, [DOM.text("hello"), DOM.text("world")]),
  ]

display_pretty root, ""
