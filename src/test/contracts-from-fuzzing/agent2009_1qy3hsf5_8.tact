contract MixedOptionalPersistent {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Int;
    quux: Bool;
    corge: String;
    init() {
        self.foo = null;
        self.bar = false;
        self.baz = "hi";
        self.qux = 42;
        self.quux = true;
        self.corge = "hello";
    }
}