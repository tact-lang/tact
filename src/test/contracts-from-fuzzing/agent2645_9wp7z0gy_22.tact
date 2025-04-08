contract OptAssignment {
    foo: Int?;

    init() {
        self.foo = null;
        self.foo = 42;
        self.foo = null;
    }
}
