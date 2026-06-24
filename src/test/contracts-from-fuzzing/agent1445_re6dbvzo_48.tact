contract OptionalIntString {
    foo: Int?;
    bar: String?;
    baz: Bool;

    init() {
        self.foo = 5;
        self.bar = "abc";
        self.baz = false;
    }
}