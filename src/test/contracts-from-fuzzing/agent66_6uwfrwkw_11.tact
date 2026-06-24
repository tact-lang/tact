contract DefaultValues {
    foo: Int = 0;
    bar: Bool = false;
    baz: Int? = null;

    init() {
        self.foo = 10;
        self.bar = true;
        self.baz = null;
    }
}