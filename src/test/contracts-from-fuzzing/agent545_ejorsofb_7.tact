// very long flat list of fields, diverse types
contract LongFieldList {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int;
    h: Bool;
    i: String;
    j: Address;
    k: Cell;
    l: Slice;
    m: Int;
    n: Bool;
    o: String;
    p: Address;
    q: Cell;
    r: Slice;
    s: Int;
    t: Bool;

    init() {
        self.a = 1; self.b = true; self.c = "x"; self.d = myAddress(); self.e = emptyCell(); self.f = emptyCell().asSlice();
        self.g = 2; self.h = false; self.i = "y"; self.j = myAddress(); self.k = emptyCell(); self.l = emptyCell().asSlice();
        self.m = 3; self.n = true; self.o = "z"; self.p = myAddress(); self.q = emptyCell(); self.r = emptyCell().asSlice();
        self.s = 4; self.t = false;
    }
}