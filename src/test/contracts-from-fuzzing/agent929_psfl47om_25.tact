contract ManyOptionalsNoDefaults {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Address?;
    f: Cell?;

    init() {
        self.a = null;
        self.b = 123;
        self.c = null;
        self.d = true;
        self.e = null;
        self.f = emptyCell();
    }
}