struct NestedWithDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract NestedDefaults {
    data: NestedWithDefaults;
    init() {
        self.data = NestedWithDefaults{};
    }
}