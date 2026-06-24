struct NestedWithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "test";
}

contract StructWithDefaults {
    s: NestedWithDefaults;

    init() {
        self.s = NestedWithDefaults{};
    }
}