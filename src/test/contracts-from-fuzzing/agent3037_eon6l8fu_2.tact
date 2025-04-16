contract MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    init() {
        self.a = null;
        self.b = true;
        self.c = "abc";
        self.d = null;
        self.e = emptyCell();
    }
}