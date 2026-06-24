struct NestedDefaults {
    x: Int = 42;
    y: Bool = true;
}

contract TestContract {
    field: NestedDefaults;

    init() {
        self.field = NestedDefaults{};
    }
}