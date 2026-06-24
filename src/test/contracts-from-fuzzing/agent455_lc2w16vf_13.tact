contract OptionalInit {
    foo: Int?;
    bar: String?;
    baz: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }
}