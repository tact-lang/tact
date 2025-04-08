contract OptionalAddress {
    a: Address?;
    b: Int;

    init() {
        self.a = null;
        self.b = 42;
    }
}