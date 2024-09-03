data:extend({{
    type = "bool-setting",
    setting_type = "startup",
    name = "lo_always-on",
    default_value = true,
    order = "a1"
}, {
    type = "int-setting",
    setting_type = "startup",
    name = "lo_darkness-on",
    default_value = 50,
    minimum_value = 0,
    maximum_value = 100,
    order = "a1"
}, {
    type = "int-setting",
    setting_type = "startup",
    name = "lo_darkness-off",
    default_value = 30,
    minimum_value = 0,
    maximum_value = 100,
    order = "a1"
}})
