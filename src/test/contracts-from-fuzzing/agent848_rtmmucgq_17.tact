contract OverwriteOptional {
    foo: Int?;

    init() {
        self.foo = null;
        self.foo = 123;
        self.foo = null;
    }
}