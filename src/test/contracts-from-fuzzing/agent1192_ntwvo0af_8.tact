contract OptFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = emptyCell();
    }
}