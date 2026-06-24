contract AltOrderFields {
    foo: Bool;
    bar: Int;
    baz: String;
    qux: Int?;
    quux: Bool?;

    init() {
        self.foo = true;
        self.bar = 123;
        self.baz = "chain";
        self.qux = null;
        self.quux = false;
    }
}