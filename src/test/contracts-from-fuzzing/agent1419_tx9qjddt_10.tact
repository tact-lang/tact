contract InitDefaults {
    foo: Int = 5;
    bar: Bool = true;
    baz: String = "hi";

    init() {
        self.foo = 20;
    }
}