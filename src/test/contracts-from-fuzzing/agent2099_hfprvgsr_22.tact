contract OptionalAndDefault {
    foo: Int?;
    bar: Int = 42;

    init() {
        self.foo = null;
    }
}