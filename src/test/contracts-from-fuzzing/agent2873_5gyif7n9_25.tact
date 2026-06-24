struct NestedWithDefaults {
    a: Int = 1;
    b: Bool = true;
}

contract StructDefaultNested {
    s: NestedWithDefaults;
    init() {
        self.s = NestedWithDefaults{};
    }
}