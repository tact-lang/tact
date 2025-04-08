contract OptionalFieldsMixed {
    x: Int?;
    y: String?;
    b: Bool?;
    c: Cell?;
    s: Slice?;
    addr: Address?;
    init() {
        self.x = null;
        self.y = null;
        self.b = null;
        self.c = null;
        self.s = null;
        self.addr = null;
    }
}
