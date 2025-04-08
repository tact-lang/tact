struct OptionalAsDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptionalDefaultsNested {
    data: OptionalAsDefaults = OptionalAsDefaults{};
}