contract TestRewriteDefaults {
    foo: Int = 10;
    bar: Bool = false;

    init() {
        self.foo = 99;
        self.bar = true;
    }
}