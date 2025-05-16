struct NestedDefaults {
    val: Int = 42;
    flag: Bool = false;
}

contract WithDefaults {
    inner: NestedDefaults;

    init() {
        self.inner = NestedDefaults{};
    }
}