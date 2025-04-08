contract WidePrimitives {
    a: Int = 1;
    b: Int as uint32 = 2;
    c: Bool = true;
    d: String = "abc";
    e: Address;
    f: Cell;
    g: Slice;
    h: String? = null;
    i: Bool? = false;
    j: Int? = 123;
    k: Cell?;
    l: Address?;

    init() {
        self.e = myAddress();
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
        self.k = emptyCell();
        self.l = myAddress();
    }
}