contract TestContract {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell;
    e: Slice;
    f: Builder;
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
    }
}