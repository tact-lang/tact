contract TestDefaults {
    foo: Int = 10;
    bar: Bool = true;
    baz: String = "hello";

    init() {
        self.foo = 20;
        self.bar = false;
        self.baz = "world";
    }
}