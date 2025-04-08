contract Test {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Cell;
    addr: Address;
    optFoo: Int?;
    optBar: Bool?;
    optBaz: String?;
    optQux: Cell?;
    optAddr: Address?;

    init() {
        self.foo = 5;
        self.bar = true;
        self.baz = "hi";
        self.qux = emptyCell();
        self.addr = myAddress();
        self.optFoo = null;
        self.optBar = null;
        self.optBaz = null;
        self.optQux = null;
        self.optAddr = null;
    }
}