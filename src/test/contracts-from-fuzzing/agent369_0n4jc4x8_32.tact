contract OptionalAndDefaults {
    foo: Int?;
    bar: Bool = true;
    baz: String = "hello";

    init() {
        self.foo = null;
        self.bar = false;
        self.baz = "world";
    }
}