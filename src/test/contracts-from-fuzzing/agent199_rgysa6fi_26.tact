contract NoDefaultsPersistent {
    foo: Int;
    bar: Bool;
    baz: String;

    init() {
        self.foo = 17;
        self.bar = true;
        self.baz = "abc";
    }
}
