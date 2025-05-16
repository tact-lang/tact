contract OnlyOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;

    init() {
        self.foo = 5;
        self.bar = null;
        self.baz = "hi";
    }
}