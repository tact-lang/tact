contract MultipleFields {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;

    init() {
        self.c = myAddress();
        self.d = "x";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}
