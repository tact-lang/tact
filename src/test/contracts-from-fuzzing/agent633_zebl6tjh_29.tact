struct NestedDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract NestedDefaultsHolder {
    val: NestedDefaults = NestedDefaults{};
}