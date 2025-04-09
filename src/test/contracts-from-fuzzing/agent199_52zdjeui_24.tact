contract OptionalBeforeDefault {
    foo: Int?;
    bar: Int = 10;

    init() {
        self.foo = null;
    }
}