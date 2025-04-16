contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Slice?;
    e: Cell;
    f: Address;
    g: Int = 2;
    h: Bool = false;
    i: String = "i";
    j: Slice?;
    k: Cell;
    l: Address;
    m: Int = 3;
    n: Bool = true;
    o: String = "o";
    p: Slice?;
    q: Cell;
    r: Address;
    s: Int = 4;

    init() {
        self.e = emptyCell();
        self.f = myAddress();
        self.j = null;
        self.k = emptyCell();
        self.l = myAddress();
        self.p = null;
        self.q = emptyCell();
        self.r = myAddress();
    }
}