struct OptDefaults {
    a: Int? = null;
    b: String? = null;
}

contract OptInlineDefaults {
    r: OptDefaults = OptDefaults{};
}