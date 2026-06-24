contract OptionalMix {
    i: Int?;
    s: String?;
    b: Bool;
    addr: Address?;

    init() {
        self.i = null;
        self.s = null;
        self.b = true;
        self.addr = null;
    }
}