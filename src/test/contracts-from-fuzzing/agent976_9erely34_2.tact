struct Inner {
    x: Int = 10;
    y: Int = 20;
}

contract WithDefaults {
    nested: Inner;
    init() {
        self.nested = Inner{};
    }
}