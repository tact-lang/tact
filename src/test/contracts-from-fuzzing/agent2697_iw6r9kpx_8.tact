contract OnlyOptionalFields {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}
