contract Test {
    a: Int = 0;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    f: Address?;
    g: String = "hello";
    h: String?;
    i: Slice;
    j: Slice?;
    k: Cell;
    l: Cell?;

    init() {
        self.i = emptyCell().asSlice();
        self.j = null;
        self.k = emptyCell();
        self.l = null;
    }
}