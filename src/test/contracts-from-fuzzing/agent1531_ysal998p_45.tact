contract PrimitiveMixed {
    foo: Int;
    bar: String;
    baz: Bool;
    addr: Address;
    optFoo: Int?;
    optBar: String?;
    optBaz: Bool?;
    optAddr: Address?;

    init() {
        self.foo = 1;
        self.bar = "str";
        self.baz = true;
        self.addr = myAddress();
        self.optFoo = null;
        self.optBar = null;
        self.optBaz = null;
        self.optAddr = null;
    }
}
