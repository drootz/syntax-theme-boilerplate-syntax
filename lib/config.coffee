fs = require 'fs'
path = require 'path'

module.exports =

  apply: ->

    updateColor = () ->
      theme = atom.config.get "syntax-theme-boilerplate-syntax.themeVariant"
      theme_path = "#{__dirname}/_theme.less"
      theme_content = ""
      theme_file = "#{__dirname}/themes/" + theme + ".less"
      theme_content = fs.readFileSync theme_file, "utf8"
      fs.writeFileSync theme_path, "// FILE CONTENT GENERATED DYNAMICALLY\n// Colors can be edited in ../_colors_base.less or in the ./themes files\n\n", "utf8"
      fs.appendFileSync theme_path, theme_content, "utf8"

    # When starting
    updateColor()

    # When config changes
    atom.config.onDidChange 'syntax-theme-boilerplate-syntax.themeVariant', () ->
      updateColor()
