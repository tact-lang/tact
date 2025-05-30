contract LotsOfFields {
    a: Int;
    b: Int as uint32;
    c: Bool;
    d: Bool;
    e: String;
    f: Cell;
    g: Builder;
    h: Slice;
    i: Address;
    j: Int?;
    k: String?;
    l: Bool?;
    m: Int as int8;
    n: Int as uint8;
    o: Int as int64;
    p: Int as uint64;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = false;
        self.e = "hello";
        self.f = emptyCell();
        self.g = beginCell();
        self.h = emptyCell().asSlice();
        self.i = myAddress();
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = -5;
        self.n = 250;
        self.o = -12345678;
        self.p = 12345678;
    }
}