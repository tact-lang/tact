contract ImplicitDefaults {
    foo: Int;
    bar: Bool;
    baz: String;

    init() {
        self.foo = 5;
        self.bar = false;
        self.baz = "abc";
    }
}