contract OnlyOptionals {
    a: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.s = null;
        self.addr = null;
    }
}