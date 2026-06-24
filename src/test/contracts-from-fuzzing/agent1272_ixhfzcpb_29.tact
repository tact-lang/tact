contract OnlyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Slice?;
    e: Cell?;
    f: Address?;
    
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
    }
}
