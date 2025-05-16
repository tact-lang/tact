struct NestedWithDefaults {
    a: Int = 1;
    b: String? = null;
    c: Bool = false;
}

contract NestedDefaults {
    nd: NestedWithDefaults;

    init() {
        self.nd = NestedWithDefaults{};
    }
}