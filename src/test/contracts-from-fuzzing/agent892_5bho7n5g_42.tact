struct Inner {
    x: Int? = 5;
    y: Bool? = true;
}

contract NestedDefaults {
    inner: Inner;

    init() {
        self.inner = Inner{};
    }
}