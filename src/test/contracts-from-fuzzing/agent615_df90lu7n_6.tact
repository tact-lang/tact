contract LargeFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Address;
    e: Cell;
    f: Slice;
    g: Int? = null;
    h: Bool? = null;
    i: String? = null;
    j: Address?;
    k: Int = 42;
    l: Bool = false;
    m: String = "y";
    n: Int? = null;
    o: Bool = true;
    p: Int = 9;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.j = null;
    }

    receive() {
        self.a = self.a + 1;
    }
}