module DOM
  extend self

  module NodeType
    struct Text
      property string

      def initialize(@string : String)
      end

      def string : String
        @string
      end
    end

    struct Element
      property tag_name, attributes

      def initialize(@tag_name : String, @attributes : Hash(String, String))
      end

      def attributes : Hash(String, String)
        @attributes
      end

      def tag_name : String
        @tag_name
      end
    end
  end

  class Node
    @children : Array(Node)
    @node_type : NodeType::Element

    def initialize(children, node_type)
      @children = children
      @node_type = node_type

      puts typeof(node_type)
    end

    def children
      @children
    end

    def node_type
      @node_type
    end
  end

  def text(data : String) : Node
    Node.new children: [] of Node, node_type: NodeType::Text.new(data)
  end

  def element(name : String, attrs : Hash(String, String), children : Array(Node)) : Node
    element_node = NodeType::Element.new tag_name: name, attributes: attrs
    Node.new children: children, node_type: element_node
  end
end
