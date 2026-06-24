struct NestedDefaults {
    x: Int = 42;
    y: Bool = false;
}

contract StructWithDefaults {
    nested: NestedDefaults;

    init() {
        self.nested = NestedDefaults{};
    }
}