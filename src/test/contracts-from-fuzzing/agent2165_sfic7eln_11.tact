contract Test11 {
    a: Int?;
    b: Int = 0;
    c: Bool = true;
    d: String?;
    e: Address;
    f: Cell;
    g: Slice;

    init() {
        self.a = null;
        self.b = 1234;
        self.c = false;
        self.d = "ok";
        self.e = myAddress();
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
    }
}