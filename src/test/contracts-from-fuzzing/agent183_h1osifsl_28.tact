contract SimpleInits {
    foo: Int = 5;
    bar: Bool = true;
    baz: Int? = null;

    init() {
        self.foo = 9;
        self.bar = false;
        self.baz = null;
    }
}