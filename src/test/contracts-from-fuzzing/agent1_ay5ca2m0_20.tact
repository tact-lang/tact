contract UnionOptionals {
    a: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    addr: Address?;

    init() {
        self.a = 1;
        self.b = null;
        self.s = "hi";
        self.c = emptyCell();
        self.addr = null;
    }
}
