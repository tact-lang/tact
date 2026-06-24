contract OptionalVars {
    foo: Int?;
    bar: Bool?;
    baz: String?;

    init() {
        self.foo = 123;
        self.bar = true;
        self.baz = "text";
    }
}