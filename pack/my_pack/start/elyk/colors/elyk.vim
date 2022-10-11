vim9script

import "../helper.vim" as h
import "../color_palette.vim" as p

g:colors_name = "elyk"

h.HL(["Normal"],                 {fg: p.black, bg: p.white})
h.HL(["Matchparen"],             {fg: p.black, bg: p.grey85, gui: {bold: v:true}})
h.HL(["Search"],                 {fg: p.black, bg: p.grey78})
h.HL(["IncSearch"],              {fg: p.white, bg: p.black})
h.HL(["Visual"],                 {fg: p.black, bg: p.grey70})
h.HL(["Cursor"],                 {fg: p.white, bg: p.black})
h.HL(["CursorLineNr"],           {fg: p.grey70, bg: p.grey93})
h.HL(["CursorLine"],             {bg: p.grey93})
h.HL(["Pmenu"],                  {fg: p.grey50, bg: p.grey03})
h.HL(["PmenuSel"],               {fg: p.white, bg: p.grey03}) 
h.HL(["Wildmenu"],               {fg: p.white, bg: p.black})
h.HL(["Comment"],                {fg: p.grey70})
h.HL(["StatusLine"],             {fg: p.black})
h.HL(["Underlined"],             {gui: {underline: v:true}})
h.HL(["SpellBad"],               {gui: {undercurl: v:true}})
h.HL(["Error"],                  {fg: p.red})
h.HL(["CursorColumn"],           {linksto: "CursorLine"})
h.HL(["ErrorMsg", "WarningMsg"], {linksto: "Error"})

h.HL([
    "DiffAdd",
    "DiffChange",
    "DiffDelete",
    "DiffText",
    "TabLine",
    "TabLineSel",
    "TabLineFill",
    "ToolbarLine",
    "ToolbarButton",
    "Directory",
    "ColorColumn",
    "QuickFixLine",
    "SpecialKey",
    "NonText",
    "Question",
    "SignColumn",
    "Title",
    "Function",
    "String",
    "Character",
    "Statement",
    "PreProc",
    "Identifier",
    "Constant",
    "Boolean",
    "Delimiter",
    "Type",
    "Number",
    "Linear",
    "Special",
    "Conceal",
    "Ignore",
    "Float",
    "Conditional",
    "Repeat",
    "Label",
    "Operator",
    "Keyword",
    "Exception",
    "Include",
    "Define",
    "Macro",
    "PreCondit",
    "StorageClass",
    "Structure",
    "Typedef",
    "Tag",
    "SpecialChar",
    "SpecialComment",
    "Debug",
    "SpellCap",
    "SpellRare",
    "SpellLocal",
    "StatusLineTerm",
    "StatusLineTermNC",
    "PmenuSbar",
    "PmenuThumb",
    "lCursor",
    "LineNrAbove",
    "LineNrBelow",
    "VisualNOS",
    "MoreMsg",
    "ModeMsg" 
    ], {linksto: "Normal"})

h.HL([
    "Folded",
    "FoldColumn",
    "StatusLineNC",
    "Todo",
    "VertSplit",
    "EndOfBuffer",
    "LineNr"
    ], {linksto: "Comment"})

# Run the highlight set
h.Set()
