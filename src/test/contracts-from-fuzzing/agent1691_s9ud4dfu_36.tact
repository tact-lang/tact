contract BigNested {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Slice;
    e: Address;
    f: Cell;
    g: Int? = null;
    h: Bool? = null;
    i: String? = null;
    j: Slice? = null;
    k: Address? = null;
    l: Cell? = null;

    init() {
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.f = emptyCell();
    }
}