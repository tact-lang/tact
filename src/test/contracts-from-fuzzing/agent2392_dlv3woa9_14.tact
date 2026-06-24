struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
}

contract WithNestedDefaults {
    val: NestedDefaults = NestedDefaults{};
    num: Int = 42;
}