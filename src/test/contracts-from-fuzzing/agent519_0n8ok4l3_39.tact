struct NestedWithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "xyz";
}

contract NestedDefaults {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults{};
    }
}