contract OnlyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: Cell?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}
