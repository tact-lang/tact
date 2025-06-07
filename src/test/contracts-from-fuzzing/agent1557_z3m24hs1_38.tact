contract NestedStringDefaults {
    foo: String = "foo";
    bar: String = "bar";
    baz: String = "baz";

    init() {
        self.foo = "x";
        self.bar = "y";
        self.baz = "z";
    }
}