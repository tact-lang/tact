contract OptionalFields {
    a: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    addr: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.s = null;
        self.c = null;
        self.addr = null;
    }
}
