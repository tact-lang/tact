contract ManyBaseOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;

    init() {
        self.a = 11;
        self.b = null;
        self.c = null;
        self.d = emptyCell();
        self.e = null;
        self.f = "abc";
    }
}