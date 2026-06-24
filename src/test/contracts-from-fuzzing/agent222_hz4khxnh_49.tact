contract ContrInitWithOpts {
    foo: Int;
    bar: Int?;
    baz: Bool;
    qux: String?;

    init() {
        self.foo = 42;
        self.baz = true;
        self.bar = null;
        self.qux = "x";
    }
}