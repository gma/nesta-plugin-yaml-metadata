# Yaml metadata plugin for Nesta

Pages of content in [Nesta CMS][] can be embellished with metadata,
written in a simple key/value pair syntax. If you'd like extra
flexibility in your metadata, you can use this plugin to replace Nesta's
built-in metadata parser with Ruby's Yaml parser.

You still need to make sure that all the metadata is at the top of the
page; the first blank line signifies the start of the page content.

To use the plugin just add it to your project's `Gemfile` and rebuild
your bundle:

    $ echo 'gem "nesta-plugin-yaml-metadata"' >> Gemfile
    $ bundle

It requires Nesta 0.9.12 or later.

[Nesta CMS]: http://nestacms.com
