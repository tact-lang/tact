struct NestedDefaults {
    x: Int = 5;
    y: Bool = false;
}

contract Test12 {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{};
    }
}