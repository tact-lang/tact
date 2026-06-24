contract AllPrimitivesInit {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
    init() {
        self.i = 1;
        self.b = true;
        self.s = "str";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.addr = myAddress();
    }
}