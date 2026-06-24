struct IntDefaults {
    a: Int = 1;
    b: Int = 2;
}

contract StructDefaults {
    inner: IntDefaults;
    init() {
        self.inner = IntDefaults{};
    }
}