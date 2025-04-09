contract MixedOptional {
    foo: Int?;
    bar: String;
    baz: Bool?;

    init() {
        self.foo = null;
        self.bar = "abc";
        self.baz = null;
    }
}