contract AllTypesOptional {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    addr: Address?;

    init() {
        self.i = null;
        self.b = null;
        self.s = null;
        self.c = null;
        self.sl = null;
        self.addr = null;
    }
}
