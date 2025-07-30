contract OptionalReassigns {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = null;
        self.bar = true;
        self.foo = 42;
        self.bar = null;
    }
}