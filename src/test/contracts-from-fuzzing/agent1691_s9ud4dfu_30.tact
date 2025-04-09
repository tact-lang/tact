contract LongPrimitiveSequence {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: String = "abc";
    e: Slice;
    f: Cell;
    g: Int? = null;
    h: Bool? = null;
    i: Address? = null;
    j: String? = null;
    k: Slice? = null;
    l: Cell? = null;

    init() {
        self.c = myAddress();
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
    }
}