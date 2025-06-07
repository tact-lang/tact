contract OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}
