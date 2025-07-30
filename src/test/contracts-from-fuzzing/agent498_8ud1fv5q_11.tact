struct NestedDefaults {
    a: Int = 10;
    s: String = "hi";
    b: Bool = true;
}

contract WithNestedDefaults {
    nd: NestedDefaults = NestedDefaults{};
}