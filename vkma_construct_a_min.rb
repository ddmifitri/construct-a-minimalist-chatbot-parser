# vkma_construct_a_min.rb

require 'json'

module VkmaConstructAMin
  class Parser
    def initialize(intent_map)
      @intent_map = intent_map
    end

    def parse(input)
      # Tokenize input
      tokens = input.downcase.split

      # Identify intent
      intent = identify_intent(tokens)

      # Extract entities
      entities = extract_entities(tokens, intent)

      # Construct response
      response = construct_response(intent, entities)

      response
    end

    private

    def identify_intent(tokens)
      # Simple intent identification based on keywords
      @intent_map.each do |intent, keywords|
        return intent if keywords.any? { |keyword| tokens.include?(keyword) }
      end

      # Default intent
      :unknown
    end

    def extract_entities(tokens, intent)
      # Simple entity extraction based on intent
      case intent
      when :greeting
        { name: tokens[1] }
      when :goodbye
        {}
      else
        {}
      end
    end

    def construct_response(intent, entities)
      # Simple response construction based on intent and entities
      case intent
      when :greeting
        "Hello, #{entities[:name]}!"
      when :goodbye
        "Goodbye!"
      else
        "I didn't understand that."
      end
    end
  end

  INTENT_MAP = {
    greeting: %w(hello hi),
    goodbye: %w(goodbye bye)
  }.freeze

  def self.build
    Parser.new(INTENT_MAP)
  end
end