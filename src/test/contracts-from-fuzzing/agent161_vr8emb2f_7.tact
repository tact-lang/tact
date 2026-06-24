struct NestedWithDefaults {
    a: Int = 5;
    b: String = "default";
    c: Bool?;
}

contract TestDefaultsNested {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults{};
    }
}
