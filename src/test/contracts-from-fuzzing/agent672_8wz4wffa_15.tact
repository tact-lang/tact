contract ChainOptionals {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Cell?;
    e: Address?;
    f: Int;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = 0;
    }
}