contract OptionalToNonOptional {
    foo: Int?;
    bar: Int;

    init() {
        self.foo = null;
        self.foo = 5;
        self.bar = 10;
    }
}