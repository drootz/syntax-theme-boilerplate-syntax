fs = require 'fs'
path = require 'path'

module.exports =

  apply: ->

    updateColor = () ->
      theme = atom.config.get "syntax-theme-boilerplate-syntax.themeVariant"
      theme_path = "#{__dirname}/theme.less"
      theme_content = ""
      theme_file = "#{__dirname}/themes/" + theme + ".less"
      theme_content = fs.readFileSync theme_file, "utf8"
      fs.writeFileSync theme_path, theme_content

    # When starting
    updateColor()

    # When config changes
    atom.config.onDidChange 'syntax-theme-boilerplate-syntax.themeVariant', () ->
      updateColor()
