contract LargeContract {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Slice;
    f: Int?;
    g: String?;
    h: Bool?;
    i: Cell?;
    j: Slice?;
    k: Int as uint32;
    l: Int as int8;
    m: Int as uint64;
    n: Int;

    init() {
        self.a = 1;
        self.b = "b";
        self.c = true;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = 2;
        self.g = "g";
        self.h = false;
        self.i = null;
        self.j = null;
        self.k = 33;
        self.l = -5;
        self.m = 99999;
        self.n = 123;
    }
}
