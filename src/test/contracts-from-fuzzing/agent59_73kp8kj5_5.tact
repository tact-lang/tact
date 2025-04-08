contract DefaultLiteralVals {
    i: Int = 1;
    b: Bool = true;
    a: Address;
    c: Cell;
    s: Slice;
    st: String = "hello";
    o: Int? = null;

    init() {
        self.a = myAddress();
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
    }
}
