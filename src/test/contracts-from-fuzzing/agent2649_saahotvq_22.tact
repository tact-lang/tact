contract PrimitivesOnly {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Address;
    f: Cell;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.f = emptyCell();
    }
}