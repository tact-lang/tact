contract Test {
    a: Int = 1;
    b: Int?;
    c: Int = 3;
    d: Int?;
    e: Bool = true;
    f: Bool?;
    g: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    h: Address?;
    i: Slice;
    j: Slice?;
    k: String = "abc";
    l: String?;
    m: Cell;
    n: Cell?;
    o: Int = 0;
    p: Int?;
    q: Bool = false;
    r: Bool?;
    s: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    t: Address?;
    u: Slice;
    v: Slice?;
    w: String = "abc";
    x: String?;
    y: Cell;
    z: Cell?;
    a1: Int = 42;
    b1: Bool = false;
    c1: String = "zzz";
    d1: Int?;
    e1: Bool?;
    f1: Address?;
    g1: Slice?;
    h1: String?;
    i1: Cell?;

    init() {
        self.i = emptyCell().asSlice();
        self.j = null;
        self.m = emptyCell();
        self.n = null;
        self.u = emptyCell().asSlice();
        self.v = null;
        self.y = emptyCell();
        self.z = null;
    }
}