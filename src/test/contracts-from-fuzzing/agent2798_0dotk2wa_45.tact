contract OptionalReuse {
    foo: Int?;
    bar: Int?;

    init() {
        self.foo = null;
        self.bar = null;
        self.foo = 11;
        self.bar = 22;
        self.foo = null;
        self.bar = null;
    }
}