contract ManyFields {
    a: Int = 1;
    b: Int as uint32 = 2;
    c: Int? = null;
    d: Bool = false;
    e: String = "abc";
    f: Cell; // no init
    g: Builder; // no init
    h: Slice; // no init
    i: Address; // no init
    j: Bool = true;
    k: Int = 42;
    l: String = "def";
    m: Int? = 100;
    n: Bool = true;
    o: Int as uint32 = 123456;
    p: String = "pqr";
    q: Cell; // no init
    r: Slice; // no init
    s: Int = 0;
    t: Bool = false;

    init() {
        self.a = 11;
        self.f = emptyCell();
        self.g = beginCell();
        self.h = emptyCell().asSlice();
        self.i = myAddress();
        self.q = emptyCell();
        self.r = emptyCell().asSlice();
    }
}
