contract Test {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: Bool?;
    e: Slice;
    f: Slice?;
    g: String = "test";
    h: String?;
    i: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    j: Address?;
    k: Cell;
    l: Cell?;

    init() {
        self.k = emptyCell();
        self.l = null;
        self.e = emptyCell().asSlice();
        self.f = null;
    }
}