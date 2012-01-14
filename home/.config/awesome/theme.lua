--//  Main
theme = {}
theme.wallpaper_cmd = { "awsetbg -a /home/nkn/Pictures/steampunk.jpg" }
--//

--/// Styles

theme.font      = "montecarlo 7"
--themedir2 		= "~/.config/awesome/themes/buttons"
themedir 		= "~/.config/awesome/themes"

--// Colors
theme.fg_normal = "#9da560"
theme.fg_focus  = "#c8611f"
theme.fg_urgent = "#000000"
theme.bg_normal = "#101309"
theme.bg_focus  = "#222815"
theme.bg_urgent = "#ffc0c0"
--//

--// Borders
theme.border_width  = "1"
theme.border_normal = "#101309"
theme.border_focus  = theme.fg_normal
theme.border_marked = "#000000"
--//

--// Titlebars
theme.titlebar_fg_normal	= "#9da560"
theme.titlebar_fg_focus		= "#c8611f"
theme.titlebar_bg_normal	= "#363636ff"
theme.titlebar_bg_focus		= "#000000ff"
theme.titlebar_font			= theme.font or "cure 8"
--//

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_bg_focus = theme.fg_focus
theme.taglist_fg_focus = theme.bg_normal
theme.taglist_bg_not_empty = "#404040"
theme.taglist_fg_not_empty = "#808080"
--theme.tasklist_bg_focus = theme.bg_normal

--////

--// Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_bg_normal = "#101709ff"
theme.menu_bg_focus  = "#222815ff"
theme.menu_fg_normal = theme.fg_normal
theme.menu_fg_focus  = theme.fg_focus
theme.menu_border_width = "0"
theme.menu_height = "18"
theme.menu_width  = "150"
--//
icon_dir = "~/.config/awesome/icons"


--//// Icons

--// Taglist
theme.taglist_squares_sel   = themedir .."/taglist/squarefz.png"
theme.taglist_squares_unsel = themedir .."/taglist/squarez.png"
theme.taglist_squares_resize = "false"
--//

--// Misc
--theme.awesome_icon           = themedir .."/awesome-icon.png"
--theme.menu_submenu_icon      = "~/.config/awesome/themes/default/submenu.png"
--theme.tasklist_floating_icon = "~/.config/awesome/themes/default/tasklist/floatingw.png"
--//

--// Layout
theme.layout_tile       = themedir .."/layouts/tile.png"
theme.layout_tileleft   = themedir .."/layouts/tileleft.png"
theme.layout_tilebottom = themedir .."/layouts/tilebottom.png"
theme.layout_tiletop    = themedir .."/layouts/tiletop.png"
theme.layout_fairv      = themedir .."/layouts/fairv.png"
theme.layout_fairh      = themedir .."/layouts/fairh.png"
theme.layout_spiral     = themedir .."/layouts/spiral.png"
theme.layout_dwindle    = themedir .."/layouts/dwindle.png"
theme.layout_max        = themedir .."/layouts/max.png"
theme.layout_fullscreen = themedir .."/layouts/fullscreen.png"
theme.layout_magnifier  = themedir .."/layouts/magnifier.png"
theme.layout_floating   = themedir .."/layouts/floating.png"
--//

--// Titlebar
--[[theme.titlebar_close_button_focus  = themedir .."/close-focused.png"
theme.titlebar_close_button_normal = themedir .."/close-unfocused.png"
theme.titlebar_maximized_button_focus_active  = themedir .."/maximize-focused.png"
theme.titlebar_maximized_button_normal_active = themedir .."/maximize-unfocused.png"
theme.titlebar_maximized_button_focus_inactive  = themedir .."/maximize-focused.png"
theme.titlebar_maximized_button_normal_inactive = themedir .."/maximize-unfocused.png"]]
--//

--////

return theme

