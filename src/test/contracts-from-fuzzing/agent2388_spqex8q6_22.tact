contract NullablePrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;

    init() {
        self.i = null;
        self.b = null;
        self.s = null;
        self.addr = null;
    }
}