struct InlineDefaults {
    x: Int = 5;
    y: String = "abc";
    z: Bool = true;
}

contract StructDefaults {
    s: InlineDefaults = InlineDefaults{};
}