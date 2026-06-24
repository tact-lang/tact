contract PrimitiveMix {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    o: Int?;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "str";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.a = myAddress();
        self.o = null;
    }
}