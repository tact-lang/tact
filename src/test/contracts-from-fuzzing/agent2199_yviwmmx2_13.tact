contract MixedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;

    init() {
        self.a = 5;
        self.b = null;
        self.c = null;
        self.d = emptyCell();
        self.e = null;
    }
}
