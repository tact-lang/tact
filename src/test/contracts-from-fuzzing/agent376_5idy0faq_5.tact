contract DefaultOptionals {
    foo: Int?;
    bar: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    addr: Address?;

    init() {
        self.foo = null;
        self.bar = null;
        self.s = null;
        self.c = null;
        self.sl = null;
        self.addr = null;
    }
}