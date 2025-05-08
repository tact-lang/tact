contract OptFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Builder?;
    g: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
    }

    receive() {}
}