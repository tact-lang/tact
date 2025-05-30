struct NestedDefaults {
    x: Int = 42;
    y: String = "test";
    z: Bool = false;
}

contract StructWithDefaults {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }
}
