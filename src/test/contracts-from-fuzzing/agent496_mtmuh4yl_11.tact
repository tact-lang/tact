contract OptionalFields {
    x: Int?;
    y: Bool?;
    s: String?;
    addr: Address?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.x = null;
        self.y = null;
        self.s = null;
        self.addr = null;
        self.c = null;
        self.sl = null;
    }
}