contract EmptyInitOverride {
    foo: Int = 10;
    bar: String = "bar";

    init() {
        self.foo = 20;
        self.bar = "baz";
    }
}