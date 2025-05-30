contract MultiplePersistentOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = emptyCell();
        self.e = null;
        self.f = "test";
    }
}