contract OnlyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
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