contract OptionalDefaultInitialized {
    foo: Int? = null;
    bar: Int? = 5;

    init() {
        self.foo = null;
        self.bar = 7;
    }
}