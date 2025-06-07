contract JustFields {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Int?;
    quux: Bool?;
    corge: String?;
    grault: Address;
    garply: Address?;

    init() {
        self.foo = 77;
        self.bar = true;
        self.baz = "hi";
        self.qux = null;
        self.quux = false;
        self.corge = null;
        self.grault = myAddress();
        self.garply = null;
    }
}