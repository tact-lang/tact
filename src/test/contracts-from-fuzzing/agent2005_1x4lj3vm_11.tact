contract OnlyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Address?;
    e: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}