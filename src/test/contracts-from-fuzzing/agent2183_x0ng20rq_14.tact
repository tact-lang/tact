contract OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Address?;

    init() {
        self.a = null;
        self.b = false;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}