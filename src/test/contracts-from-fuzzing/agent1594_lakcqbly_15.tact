contract OptionalFields {
    a: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.s = null;
        self.addr = null;
        self.c = null;
        self.sl = null;
    }
}