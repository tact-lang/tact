struct NestedDefaults {
    val: Int = 5;
    flag: Bool = true;
}

contract InitDefaultFields {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{};
    }
}