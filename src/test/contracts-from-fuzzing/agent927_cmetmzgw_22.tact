contract MultipleOptionals {
    a: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
    sl: Slice?;
    c: Cell?;
    bu: Builder?;

    init() {
        self.a = null;
        self.b = null;
        self.s = null;
        self.addr = null;
        self.sl = null;
        self.c = null;
        self.bu = null;
    }
}