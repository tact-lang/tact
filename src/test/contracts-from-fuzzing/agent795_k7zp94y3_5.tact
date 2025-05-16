contract Test {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    addr: Address?;

    init() {
        self.i = 5;
        self.b = true;
        self.s = "x";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.addr = myAddress();
    }
}