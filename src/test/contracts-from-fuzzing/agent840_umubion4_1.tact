contract Test {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Cell;
    f: Cell?;
    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = emptyCell();
        self.f = null;
    }
}