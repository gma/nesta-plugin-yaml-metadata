require 'yaml'

module Nesta
  class FileModel
    def parse_metadata(first_paragraph)
      yaml = YAML.load(first_paragraph)
    rescue Psych::SyntaxError
      raise MetadataParseError
    else
      raise MetadataParseError unless yaml
      metadata = CaseInsensitiveHash.new
      yaml.each { |key, value| metadata[key.downcase] = value } if yaml
      metadata
    end
  end
end
