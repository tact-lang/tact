struct NestedDefaults {
    val: Int = 5;
    flag: Bool = true;
    text: String = "hi";
}

contract StructWithDefaults {
    nested: NestedDefaults = NestedDefaults{};

    init() {
        self.nested = NestedDefaults{};
    }
}