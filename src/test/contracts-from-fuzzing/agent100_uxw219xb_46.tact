struct MultiDefaults {
    i: Int = 100;
    s: String = "str";
    b: Bool = false;
}

contract StructDefaults {
    d: MultiDefaults = MultiDefaults{};
}