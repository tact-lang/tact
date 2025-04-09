contract OptionalPersists {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = 0;
        self.bar = false;
    }
}