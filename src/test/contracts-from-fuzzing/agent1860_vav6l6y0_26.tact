struct HasOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract OptStructDefaults {
    val: HasOptionalDefaults = HasOptionalDefaults{};
}