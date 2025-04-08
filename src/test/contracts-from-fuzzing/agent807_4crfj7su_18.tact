// contract with lots of optional persistent variables directly
contract OptionalVars {
    foo: Int?;
    bar: Int?;
    baz: Int?;
    qux: Bool?;
    quux: Bool?;
    corge: String?;
    grault: String?;
    garply: Int?;

    init() {
        self.foo = 1;
        self.bar = null;
        self.baz = 3;
        self.qux = null;
        self.quux = true;
        self.corge = null;
        self.grault = "hi";
        self.garply = null;
    }
}