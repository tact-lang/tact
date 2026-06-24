contract TwentyFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int? = null;
    i: Bool? = null;
    j: String? = null;
    k: Address? = null;
    l: Cell? = null;
    m: Slice? = null;
    n: Builder? = null;
    o: Int as uint8 = 7;
    p: Int as uint16 = 9;
    q: Int as int64 = 12;
    r: Int? as uint4 = null;
    s: Int? as uint30 = null;
    t: Int as coins = 123;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }
}