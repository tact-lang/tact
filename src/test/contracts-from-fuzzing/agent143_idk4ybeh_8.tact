struct NestedWithDefaults {
    val: Int = 100;
    flag: Bool = true;
}

contract NestedDefaults {
    data: NestedWithDefaults;
    init() {
        self.data = NestedWithDefaults{};
    }
}