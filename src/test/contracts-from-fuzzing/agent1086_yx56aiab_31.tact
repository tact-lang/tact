contract OverwriteDefaults {
    foo: Int = 1;
    bar: Int = 2;

    init() {
        self.foo = 100;
        self.bar = 200;
    }
}