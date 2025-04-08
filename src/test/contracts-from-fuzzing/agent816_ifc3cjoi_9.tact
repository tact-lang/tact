contract OptionalSimple {
    foo: Int?;
    bar: Bool?;
    baz: String?;

    init() {
        self.foo = 100;
        self.bar = null;
        self.baz = "test";
    }
}