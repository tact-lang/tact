struct NestedWithDefaults {
    a: Int = 10;
    b: Bool = false;
}

contract TestContract {
    nested: NestedWithDefaults;

    init() {
        self.nested = NestedWithDefaults{};
    }
}