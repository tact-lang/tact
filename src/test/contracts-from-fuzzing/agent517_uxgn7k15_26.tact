contract AllNullOptionals {
    x: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;

    init() {
        self.x = null;
        self.b = null;
        self.s = null;
        self.addr = null;
    }
}