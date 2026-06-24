contract ExplicitNulls {
    a: Int?;
    s: String?;
    c: Cell?;
    b: Bool?;
    addr: Address?;
    
    init() {
        self.a = null;
        self.s = null;
        self.c = null;
        self.b = null;
        self.addr = null;
    }
}