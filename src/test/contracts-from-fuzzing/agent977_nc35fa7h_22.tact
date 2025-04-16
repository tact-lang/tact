// contract fields with explicit default values and init override
contract DefVals {
    foo: Int = 7;
    bar: String = "hi";
    baz: Bool = true;
    qux: Int?;
    init() {
        self.foo = 8;
        self.bar = "bye";
        self.baz = false;
        self.qux = null;
    }
}