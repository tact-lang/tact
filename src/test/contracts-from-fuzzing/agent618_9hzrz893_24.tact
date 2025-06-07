contract LargeOptionals {
    foo: Int?;
    bar: Bool?;
    s: String?;
    addr: Address?;
    cl: Cell?;
    sl: Slice?;

    init() {
        self.foo = null;
        self.bar = true;
        self.s = null;
        self.addr = myAddress();
        self.cl = null;
        self.sl = emptyCell().asSlice();
    }
}