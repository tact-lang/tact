// contract with many persistent fields with serialization
contract ManySerialized {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as int257;
    g: Bool;
    h: Bool;
    i: Int;
    j: Slice;
    k: Cell;
    l: Builder;
    m: String;
    n: Address;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = -4;
        self.e = 5;
        self.f = -6;
        self.g = true;
        self.h = false;
        self.i = 100;
        self.j = emptyCell().asSlice();
        self.k = emptyCell();
        self.l = beginCell();
        self.m = "testing";
        self.n = myAddress();
    }
}