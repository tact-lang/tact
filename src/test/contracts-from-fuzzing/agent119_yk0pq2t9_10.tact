contract TestContract {
    foo: Int;
    bar: Int?;
    baz: Bool;
    qux: Bool?;
    addr: Address;
    c: Cell?;
    st: String = "default";

    init() {
        self.foo = 10;
        self.bar = null;
        self.baz = true;
        self.qux = null;
        self.addr = myAddress();
        self.c = null;
        self.st = "hi";
    }
}