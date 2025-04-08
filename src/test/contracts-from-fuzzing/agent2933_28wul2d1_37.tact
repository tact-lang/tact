struct InnerDefaults {
    val1: Int = 1;
    val2: Int = 2;
}

contract DefaultsAtBothLevels {
    a: Int = 5;
    inner: InnerDefaults = InnerDefaults{};
    b: Bool = true;
}