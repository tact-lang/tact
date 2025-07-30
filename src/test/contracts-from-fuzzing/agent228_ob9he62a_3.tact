contract TestContract {
    a: Int;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
    f: Int as int128;
    g: Bool;
    h: Address;
    i: Cell;
    j: Slice;
    k: String;
    l: Int?;
    m: Bool?;
    n: Address?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.g = true;
        self.h = myAddress();
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
        self.k = "hello";
        self.l = null;
        self.m = null;
        self.n = null;
    }
}