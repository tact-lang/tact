contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Address;
    e: Cell;
    f: Slice;
    g: Int = 2;
    h: Bool = false;
    i: String = "y";
    j: Address;
    k: Cell;
    l: Slice;
    m: Int = 3;
    n: Bool = true;
    o: String = "z";
    p: Address;
    q: Cell;
    r: Slice;
    s: Int = 4;
    t: Bool = false;
    u: String = "end";

    init() {
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.j = myAddress();
        self.k = emptyCell();
        self.l = emptyCell().asSlice();
        self.p = myAddress();
        self.q = emptyCell();
        self.r = emptyCell().asSlice();
    }
}