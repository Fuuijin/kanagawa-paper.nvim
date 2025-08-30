local util = require("kanagawa-paper.lib.util")

local M = {}

--- @param colors ThemeColors
function M.generate(colors)
	local bat = util.template(
		[[
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>name</key>
    <string>${_style_name}</string>
    <key>semanticClass</key>
    <string>theme.${_theme}.kanagawa-paper</string>
    <key>uuid</key>
    <string>kanagawa-paper-${_theme}</string>
    <key>author</key>
    <string>kanagawa-paper.nvim</string>
    <key>colorSpaceName</key>
    <string>sRGB</string>
    <key>settings</key>
    <array>
      <dict>
        <key>settings</key>
        <dict>
          <key>background</key>
          <string>${ui.bg}</string>
          <key>foreground</key>
          <string>${ui.fg}</string>
          <key>caret</key>
          <string>${modes.normal}</string>
          <key>lineHighlight</key>
          <string>${ui.bg_cursorline}</string>
          <key>misspelling</key>
          <string>${diag.error}</string>
          <key>accent</key>
          <string>${syn.special1}</string>
          <key>selection</key>
          <string>${ui.bg_visual}</string>
          <key>activeGuide</key>
          <string>${ui.indent_scope}</string>
          <key>findHighlight</key>
          <string>${ui.bg_search}</string>
          <key>gutterForeground</key>
          <string>${ui.fg_dim}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Basic text &amp; variable names (incl. leading punctuation)</string>
        <key>scope</key>
        <string>text, source, variable.other.readwrite, punctuation.definition.variable</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${ui.fg}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Parentheses, Brackets, Braces</string>
        <key>scope</key>
        <string>punctuation</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.punctuation}</string>
          <key>fontStyle</key>
          <string/>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Comments</string>
        <key>scope</key>
        <string>comment, punctuation.definition.comment</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.comment}</string>
          <key>fontStyle</key>
          <string>italic</string>
        </dict>
      </dict>
      <dict>
        <key>scope</key>
        <string>string, punctuation.definition.string</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.string}</string>
        </dict>
      </dict>
      <dict>
        <key>scope</key>
        <string>constant.character.escape</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.special3}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Booleans, constants, numbers</string>
        <key>scope</key>
        <string>constant.numeric, variable.other.constant, entity.name.constant, constant.language.boolean, constant.language.false, constant.language.true, keyword.other.unit.user-defined, keyword.other.unit.suffix.floating-point</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.number}</string>
        </dict>
      </dict>
      <dict>
        <key>scope</key>
        <string>keyword, keyword.operator.word, keyword.operator.new, variable.language.super, support.type.primitive, storage.type, storage.modifier, punctuation.definition.keyword</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.keyword}</string>
          <key>fontStyle</key>
          <string/>
        </dict>
      </dict>
      <dict>
        <key>scope</key>
        <string>entity.name.tag.documentation</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.keyword}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Punctuation</string>
        <key>scope</key>
        <string>keyword.operator, punctuation.accessor, punctuation.definition.generic, meta.function.closure punctuation.section.parameters, punctuation.definition.tag, punctuation.separator.key-value</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.operator}</string>
        </dict>
      </dict>
      <dict>
        <key>scope</key>
        <string>entity.name.function, meta.function-call.method, support.function, support.function.misc, variable.function</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.fun}</string>
          <key>fontStyle</key>
          <string>italic</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Classes</string>
        <key>scope</key>
        <string>entity.name.class, entity.other.inherited-class, support.class, meta.function-call.constructor, entity.name.struct</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.type}</string>
          <key>fontStyle</key>
          <string>italic</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Enum</string>
        <key>scope</key>
        <string>entity.name.enum</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.type}</string>
          <key>fontStyle</key>
          <string>italic</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Enum member</string>
        <key>scope</key>
        <string>meta.enum variable.other.readwrite, variable.other.enummember</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.constant}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Object properties</string>
        <key>scope</key>
        <string>meta.property.object</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.constant}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Types</string>
        <key>scope</key>
        <string>meta.type, meta.type-alias, support.type, entity.name.type</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.type}</string>
          <key>fontStyle</key>
          <string>italic</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Decorators</string>
        <key>scope</key>
        <string>meta.annotation variable.function, meta.annotation variable.annotation.function, meta.annotation punctuation.definition.annotation, meta.decorator, punctuation.decorator</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.special1}</string>
        </dict>
      </dict>
      <dict>
        <key>scope</key>
        <string>variable.parameter, meta.function.parameters</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.parameter}</string>
          <key>fontStyle</key>
          <string>italic</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Built-ins</string>
        <key>scope</key>
        <string>constant.language, support.function.builtin</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.special2}</string>
        </dict>
      </dict>
      <dict>
        <key>scope</key>
        <string>entity.other.attribute-name.documentation</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.special2}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Preprocessor directives</string>
        <key>scope</key>
        <string>keyword.control.directive, punctuation.definition.directive</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.preproc}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Type parameters</string>
        <key>scope</key>
        <string>punctuation.definition.typeparameters</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.special3}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Namespaces</string>
        <key>scope</key>
        <string>entity.name.namespace</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.type}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Property names (left hand assignments in json/yaml/css)</string>
        <key>scope</key>
        <string>support.type.property-name.css</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.identifier}</string>
          <key>fontStyle</key>
          <string/>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>This/Self keyword</string>
        <key>scope</key>
        <string>variable.language.this, variable.language.this punctuation.definition.variable</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${syn.special2}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>Object properties</string>
        <key>scope</key>
        <string>variable.object.property</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${ui.fg}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>String template interpolation</string>
        <key>scope</key>
        <string>string.template variable, string variable</string>
        <key>settings</key>
        <dict>
          <key>foreground</key>
          <string>${ui.fg}</string>
        </dict>
      </dict>
      <dict>
        <key>name</key>
        <string>`new` as bold</string>
        <key>scope</key>
        <string>keyword.operator.new</string>
        <key>settings</key>
        <dict>
          <key>fontStyle</key>
          <string>bold</string>
        </dict>
      </dict>
    </array>
  </dict>
</plist>]],
		colors
	)
	return bat
end

return M