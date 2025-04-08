contract OptionalMixed {
    i: Int?;
    s: String?;
    b: Bool?;
    addr: Address?;

    init() {
        self.i = null;
        self.s = null;
        self.b = null;
        self.addr = null;
    }
}