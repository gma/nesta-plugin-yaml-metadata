require 'fileutils'
require 'test/unit'

require 'tilt'
require 'nesta/models'

require_relative '../lib/nesta-plugin-yaml-metadata/init'

class YamlMetadataPluginTest < Test::Unit::TestCase
  def fixture
    File.join(File.dirname(__FILE__), 'fixtures', 'test.mdown')
  end

  def create_fixture(filename)
    File.open(filename, 'w') { |file| file.write yield }
  end

  def setup
    create_fixture(fixture) do
      <<-EOF
---
YAML key:
  - value 1
  - value 2

# Page heading

Well hello...
      EOF
    end
    @page = Nesta::Page.new(fixture)
  end

  def teardown
    FileUtils.rm(fixture) if File.exist?(fixture)
  end

  def test_should_convert_yaml_to_array
    assert_equal ['value 1', 'value 2'], @page.metadata('yaml key')
  end

  def test_should_allow_keys_to_be_accessed_in_any_case
    assert_equal ['value 1', 'value 2'], @page.metadata('YAML Key')
  end

  def test_should_raise_correct_exception_on_invalid_yaml
    assert_raises(Nesta::MetadataParseError) do
      @page.parse_metadata('foo: ["oops')
    end
  end
end
