contract PrimitiveMix {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    cl: Cell;
    sl: Slice;

    init() {
        self.i = 0;
        self.b = true;
        self.s = "abc";
        self.addr = myAddress();
        self.cl = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}
