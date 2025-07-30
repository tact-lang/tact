contract NullableVars {
    foo: Int?;
    bar: Bool?;
    baz: String?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }

    receive() {
        self.foo = 1;
        self.bar = true;
        self.baz = "abc";
    }
}